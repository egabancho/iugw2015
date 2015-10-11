# Invenio User Group Workshop 2015

*Ludmila Marian <ludmila.marian@gmail.com>*

*Sebastian Witowski <sebastian.witowski@cern.ch>*

*Esteban J. G. Gabancho <esteban.gabancho@gmail.com>*

## Map past data to the new model

## Albums in Invenio 2

## Migrating to Invenio 2

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

```
show tables from cdsweb where Tables_in_cdsweb not regexp "^idx*|bib[0-9]+";
```

This will exclude all the *bibindex* and *bibXXX* tables. For the purpose of
this demo we will use the follow one-liner to create the `mysqldump` command
that we need to migrate our database:

```
{ echo "mysqldump -u root --no-create-info --no-create-db --extended-insert legacy"; mysql -u root -e 'show tables from legacy where Tables_in_legacy not regexp "^idx*|bib[0-9]+|^staEVENT*|backup|^tmp_*|^sbm*|^rnk*|^sch*|^crc*|^bsk*|^field|^collection*|^tag|^pid|session|basket|portalbox|bibfmt|^format|^record$";' | sed 's/|//;s/Tables_in_legacy//'; } | tr "\n" " "
```

Which will output:

```
mysqldump -u root --no-create-info --no-create-info --extended-insert legacy  accACTION accARGUMENT accMAILCOOKIE accROLE accROLE_accACTION_accARGUMENT aidCACHE aidDENSEINDEX aidINVERTEDLISTS aidPERSONIDDATA aidPERSONIDPAPERS aidRESULTS aidUSERINPUTLOG aulAFFILIATIONS aulAUTHORS aulAUTHOR_AFFILIATIONS aulAUTHOR_IDENTIFIERS aulPAPERS aulREFERENCES bibARXIVPDF bibEDITCACHE bibHOLDINGPEN bibcheck_rules bibdoc bibdoc_bibdoc bibdocfsinfo bibdocmoreinfo bibrec bibrec_bibdoc clsMETHOD cmtACTIONHISTORY cmtCOLLAPSED cmtRECORDCOMMENT cmtSUBSCRIPTION example expJOB expJOBRESULT expJOBRESULT_expQUERYRESULT expJOB_expQUERY expQUERY expQUERYRESULT externalcollection goto hstBATCHUPLOAD hstDOCUMENT hstEXCEPTION hstRECORD hstTASK jrnISSUE jrnJOURNAL knwKB knwKBDDEF knwKBRVAL lnkADMINURL lnkADMINURLLOG lnkENTRY lnkENTRYLOG lnkENTRYURLTITLE lnkLOG msgMESSAGE oaiHARVEST oaiHARVESTLOG oaiREPOSITORY oauth1_storage publreq query seqSTORE swrCLIENTDATA swrREMOTESERVER upgrade user userEXT user_accROLE user_expJOB user_msgMESSAGE user_query user_usergroup usergroup wapCACHE webapikey xtrJOB
```

The output of this command is saved to `dump-tables.sql`.

