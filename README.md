# Invenio User Group Workshop 2015

*Esteban J. G. Gabancho <esteban.gabancho@gmail.com>*

*Ludmila Marian <ludmila.marian@gmail.com>*

*Sebastian Witowski <sebastian.witowski@cern.ch>*

## Migrating to Invenio 2

### Initial considerations

Our first recommendation is always to start the migration process from the
latest version of Invenio *legacy*, as of October 2014 `maint-1.2`. (If your
installation follows the `legacy` branch it would be perfect!)

If you are running any other version older than 1.2 it is highly recommended to
update to Invenio 1.2. If you can't, or don't want to update your production
environment to Invenio 1.2 you can take a look at the [upgrade recipes](
https://github.com/inveniosoftware/invenio/tree/legacy/modules/miscutil/lib/upgrades)
which would be applied to your database depending which Invenio version you are
running (This possible because for the migration of data we will only use a
dump from the database).

### Dump current *production* database

Not all the tables are important for Invenio *master*, i.e. *bibindex* tables
like `idxINDEX`, `idxWORDXXX`, etc. or all the `bibxxx` tables are not relevant
for our new installation.

We can use regular expression matching in the table names to dump the tables we
want.

```sql
show tables from cdsweb where Tables_in_cdsweb not regexp "^idx*|bib[0-9]+";
```

This will exclude all the *bibindex* and *bibXXX* tables. For the purpose of
this demo we will use the follow one-liner to create the `mysqldump` command
that we need to migrate our database:

```bash
{ echo "mysqldump -u root --no-create-info --no-create-db --extended-insert legacy"; mysql -u root -e 'show tables from legacy where Tables_in_legacy not regexp "^idx*|bib[0-9]+|^staEVENT*|backup|^tmp_*|^sbm*|^rnk*|^sch*|^crc*|^bsk*|^field|^collection*|^tag|^pid|session|basket|portalbox|bibfmt|^format|^record$";' | sed 's/|//;s/Tables_in_legacy//'; } | tr "\n" " "
```

Which will output:

```bash
mysqldump -u root --no-create-info --no-create-info --extended-insert legacy  accACTION accARGUMENT accMAILCOOKIE accROLE accROLE_accACTION_accARGUMENT aidCACHE aidDENSEINDEX aidINVERTEDLISTS aidPERSONIDDATA aidPERSONIDPAPERS aidRESULTS aidUSERINPUTLOG aulAFFILIATIONS aulAUTHORS aulAUTHOR_AFFILIATIONS aulAUTHOR_IDENTIFIERS aulPAPERS aulREFERENCES bibARXIVPDF bibEDITCACHE bibHOLDINGPEN bibcheck_rules bibdoc bibdoc_bibdoc bibdocfsinfo bibdocmoreinfo bibrec bibrec_bibdoc clsMETHOD cmtACTIONHISTORY cmtCOLLAPSED cmtRECORDCOMMENT cmtSUBSCRIPTION example expJOB expJOBRESULT expJOBRESULT_expQUERYRESULT expJOB_expQUERY expQUERY expQUERYRESULT externalcollection goto hstBATCHUPLOAD hstDOCUMENT hstEXCEPTION hstRECORD hstTASK jrnISSUE jrnJOURNAL knwKB knwKBDDEF knwKBRVAL lnkADMINURL lnkADMINURLLOG lnkENTRY lnkENTRYLOG lnkENTRYURLTITLE lnkLOG msgMESSAGE oaiHARVEST oaiHARVESTLOG oaiREPOSITORY oauth1_storage publreq query seqSTORE swrCLIENTDATA swrREMOTESERVER upgrade user userEXT user_accROLE user_expJOB user_msgMESSAGE user_query user_usergroup usergroup wapCACHE webapikey xtrJOB
```

The output of this command is saved to `dump-tables.sql`.

### Load dump in *labs* setup

For this step we need to have an up and running Invenio 2.2 installation.

From now on we will use the
[cdslabs](https://github.com/CERNDocumentServer/cds) overlay as our Invenio 2.2
installation, to see the installation steps you can read the
[INSTALL.rts](https://github.com/CERNDocumentServer/cds/blob/cdslabs/INSTALL.rst)
file, there it's explained how to do it with docker and virtual environments.

Before loading the dump we should first delete all the tables, this step is
necessary because the table structure is quite different between 1.x and 2.x
version.

```sql
$ mysql -u root
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| cdslas             |
| legacy             |
| mysql              |
+--------------------+
4 rows in set (0.00 sec)

mysql> drop database cdslabs;
Query OK, 55 rows affected (0.12 sec)

mysql> CREATE DATABASE cdslabs DEFAULT CHARACTER SET utf8;
Query OK, 1 row affected (0.00 sec)

mysql> use cdslabs;
Database changed

mysql> source legacy-dump-defs.sql
Query OK, 0 rows affected (0.00 sec)
.....
mysql> source legacy-dump-table-content.sql
Query OK, 10 rows affected (0.00 sec)
Records: 10  Duplicates: 0  Warnings: 0
.....
```

One important thing to run on the database before continuing would be inserting
the new collection tag in the `tag` table.

```sql
mysql> insert into tag (name, value, recjson_value) values ('collection identifier', '', '_collections');
Query OK, 1 row affected (0.00 sec)
```

This will be used to store together with the record metadata the collections
that the record belongs to and it'll be used by others, i.e. search or access
control.

### Apply upgrade recipes

```bash
inveniomanage upgrader check
inveniomanage upgrader run
```

Maybe there is some upgrade that fails, don't panic, there a few things that
could happen and are relative easy to fix.

If you get an error saying that Invenio Upgrader cannot find an upgrade recipe,
check that the module adding this recipe is enable in your `PACKAGES`
configuration variable inside `config.py`.

Maybe you also get errors with queries containing `"` instead of which MySQL
ones. To avoid this simply run:

```sql
mysql> SELECT @@GLOBAL.sql_mode;
+--------------------------------------------+
| @@GLOBAL.sql_mode                          |
+--------------------------------------------+
| STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION |
+--------------------------------------------+
1 row in set (0.00 sec)

mysql> SET GLOBAL SQL_MODE='ANSI_QUOTES,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT @@GLOBAL.sql_mode;
+--------------------------------------------------------+
| @@GLOBAL.sql_mode                                      |
+--------------------------------------------------------+
| ANSI_QUOTES,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION |
+--------------------------------------------------------+
1 row in set (0.00 sec)
```

Once you are done with the upgrades, you can revert it

```sql
mysql> SET GLOBAL SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
Query OK, 0 rows affected (0.00 sec)
```

Some other errors could appear during the upgrade in which case, either one can
try to understand the error or just go and open an issue in the corresponding
Invenio module (if there is no issue opened before)

### Things to do after the database migration

If you happen to have any model, and consequently any SQL table in your overlay,
and if you don't have an upgrade recipe which creates this model, now is a good
moment to create the tables with the help of SQLAlchemy:

```python
from cds.modules.personal_collection.models import PersonalCollectionSettings

from sqlalchemy import create_engine
from sqlalchemy.engine.url import URL

cfg = app.config
SQLALCHEMY_DATABASE_URI = URL(
        cfg.get('CFG_DATABASE_TYPE', 'mysql'),
        username='root',
        password='',
        host=cfg.get('CFG_DATABASE_HOST'),
        database=cfg.get('CFG_DATABASE_NAME'),
        port=cfg.get('CFG_DATABASE_PORT'),
    )
engine = create_engine(SQLALCHEMY_DATABASE_URI)
engine.connect()
PersonalCollectionSettings.__table__.create(bind=engine)
```

Also we need to create the elasticsearch index (this is a temporary hack until
a nicer solution is made):

```python
from invenio.ext.es import create_index, delete_index

delete_index()
create_index(None)
```

If you have some data that needs to be loaded always to the database, no matter
if we are creating a demo site or booting up a new production machine, you can
load it using the `mixer`. For example, in our case we want to delete the
current production collection tree and use a new one:

```python
from invenio.ext.mixer import blend_all
blend_all(None)
```

## Map past data to the new model

Once our site is up a running, meaning ES, celery, rabbitmq, etc., we can
migrate the records from the *production* environment to the *labs* setup.

First we need to do the dump of the records, we recommend to do it by thousands
to avoid overloading the memory in both sides.

```python
from invenio.search_engine import perform_request_search, print_record
from itertoolsmodule import izip_longest

def grouper(iterable, n, fillvalue=None):
    "Collect data into fixed-length chunks or blocks"
    args = [iter(iterable)] * n
    return izip_longest(fillvalue=fillvalue, *args)

l = perform_request_search(p='indicator:CERN’) # For CEN related content
i = 0

for group in grouper(l, 1000):
    f = open('/tmp/cern_{0}.xml'.format(i), 'w')
    [f.write(print_record(id, format='xm')) for id in group if id]
    f.close()
    print i
    i += 1
```

Before inserting the records into our *labs* maybe is a good practice to check
if our marc Invenio 1.x data model matches our new data model using DoJSON.

There are two levels of verification we can do, first we can simply check that
all our fields are taken into account (this needs to be done in the *labs*
servers):

```python
from dojson.contrib.marc21.utils import create_record, split_blob
from cds.base.dojson.marc21 import query_matcher

missing = set()
f = open('/tmp/cern_1.xml', 'r')
for blob in split_blob(f):
    rec_marc = create_record(blob)
    dojson_model = query_matcher(rec_marc)
    missing.add(dojson.missin(rec_marc))

print missing
```

We are currently working in a
[back to marc21](https://github.com/inveniosoftware/dojson/pull/30) utility
which will generate a marc21 python representation that we can compare with the
one `create_record` generates. Using this we can actually ensure that whatever
json we generate from marc21 we can generate the same marc21 back.


Once we are sure our data model is covering everything, or at least everything
we want/need, we can insert the records:

```bash
for i in $(ls /tmp/cern*) ; do inveniomanage records create -t marcxml < $i ; done
```

Or we can run it in `inveniomanage shell` to verify errors:

```pyhton
from invenio_records.manage import create
create(open('/tmp/cern_1.xml', 'r'), input_type='marcxml')
%debug
....
```
## Albums in Invenio 2

