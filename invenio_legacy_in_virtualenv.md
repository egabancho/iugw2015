# Install Invenio Legacy using *virtualenv*

The following instructions assumes:
* Invenio is cloned in `$HOME/Work/src/invenio`
* `git-new-workdir` is in the path
* The `WORKON_HOME` directory is set to `$HOME/Work/envs`
* All the system libraries are installed already, i.e. mysql

Create the virtual environment and the work directory
```
virtualenv legacy
cdvirtualenv
mkdir src; cd src
git-new-workdir ~/Work/src/invenio invenio legacy
```

Clone and add to the path Tibor's development scripts
```
cdvirtualenv bin/
git clone https://github.com/tiborsimko/invenio-devscripts.git
ln -s ./invenio-devscripts/* .
unlink README.org
```

Update the `active` script to add Invenio environment variables
```
cdvirtualenv bin/
cat <<EOT >> activate
MYSQL_ADMIN_USER=root
MYSQL_ADMIN_PASS=
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export PYVER=`python -c "import sys;print '%s.%s' % (sys.version_info[0],sys.version_info[1])"`
export CFG_INVENIO_SRCDIR=$HOME/Work/src/invenio
export CFG_INVENIO_PREFIX=$HOME/Work/envs/legacy
export CFG_INVENIO_USER=`whoami`
export CFG_INVENIO_ADMIN=`whoami`@`hostname -s`
export CFG_INVENIO_HOSTNAME=`hostname -s`
export CFG_INVENIO_DOMAINNAME=`domainname`
export CFG_INVENIO_PORT_HTTP=4000
export CFG_INVENIO_PORT_HTTPS=4000
# Database
export CFG_INVENIO_DATABASE_HOST=localhost
export CFG_INVENIO_DATABASE_NAME=legacy
export CFG_INVENIO_DATABASE_USER=invenio
export CFG_INVENIO_DATABASE_PASS="my123p\$ss"
# Debugging mail server
export CFG_MISCUTIL_SMTP_HOST=127.0.0.1
export CFG_MISCUTIL_SMTP_PORT=1025
# More used dev scripts
alias mi="${CFG_INVENIO_PREFIX}/bin/invenio-make-install"
alias kw="${CFG_INVENIO_PREFIX}/bin/invenio-check-kwalitee --check-some"
EOT

workon legacy
```

Install python requirements
```
cdvirtualenv src/invenio/
git pull
pip install -r requirements.txt
pip install invenio-devserver honcho ipython ipdb
```

Create MySQL database and set permission
```
mysql -u $MYSQL_ADMIN_USER --password=$MYSQL_ADMIN_PASS -e "DROP DATABASE IF EXISTS $CFG_INVENIO_DATABASE_NAME"
mysql -u $MYSQL_ADMIN_USER --password=$MYSQL_ADMIN_PASS -h $CFG_INVENIO_DATABASE_HOST -e "CREATE DATABASE IF NOT EXISTS $CFG_INVENIO_DATABASE_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci"
mysql -u $MYSQL_ADMIN_USER --password=$MYSQL_ADMIN_PASS -h $CFG_INVENIO_DATABASE_HOST -e "GRANT ALL PRIVILEGES ON $CFG_INVENIO_DATABASE_NAME.* TO $CFG_INVENIO_DATABASE_USER@localhost IDENTIFIED BY '$CFG_INVENIO_DATABASE_PASS'"
mysqladmin -u $MYSQL_ADMIN_USER --password=$MYSQL_ADMIN_PASS flush-privileges
mysql.server restart #if running in a debian like system run service mysqld restart
```

Mac OS X default `gettex` doesn't work properly, it is recommended to install
the homebrew version
```
brew install gettext
brew link gettex --force # override system defaul, can be undone bew unlink getttext
```

Configure, make and friends
```
aclocal && automake --add-missing && autoconf
./configure --prefix=$CFG_INVENIO_PREFIX --with-python=$CFG_INVENIO_PREFIX/bin/python
ln -s $CFG_INVENIO_PREFIX/lib/python/invenio $CFG_INVENIO_PREFIX/lib/python$PYVER/site-packages/invenio
make
make install
make install-mathjax-plugin
make install-jquery-plugins
make install-ckeditor-plugin
```

Invenio-local
```
cdvirtualenv
cat <<EOT >> etc/invenio-local.conf
[Invenio]
CFG_BIBSCHED_PROCESS_USER = `whoami`
CFG_DATABASE_HOST = localhost
CFG_DATABASE_PORT = 3306
CFG_DATABASE_NAME = legacy
CFG_DATABASE_USER = invenio
CFG_DATABASE_PASS = my123p\$ss
CFG_SITE_URL = http://localhost:4000
# For production environments, change http to https in next line
CFG_SITE_SECURE_URL = http://localhost:4000
CFG_SITE_ADMIN_EMAIL = `whoami`@`hostname -s`
CFG_SITE_SUPPORT_EMAIL = `whoami`@`hostname -s`
CFG_SITE_NAME = Atlantis Fictive Institute of Science
CFG_SITE_NAME_INTL_fr = Atlantis Institut des Sciences Fictives
EOT
```

Create tables and load demo site
```
inveniocfg --update-all
inveniocfg --create-tables
inveniocfg --load-webstat-conf
inveniocfg --create-demo-site
inveniocfg --load-demo-records
```
If during `creat-tables` you get an error like
`ERROR 1101 (42000) at line 3328: BLOB/TEXT column 'setDescription' can't have a default value`
Probably your MySQL installation has the `sql_mode` set to `STRICT_TRANS_TABLES`.
Comment this line from your `my.conf` file and restart MySQL. After that
everything should work fine.

For developers is convenient to use honcho
```
cdvirtualenv
cat <<EOT >> bin/Procfile
web: serve
cache: redis-server
EOT
cat <<EOT >> bin/legacy-start
lsof -i :4000 | sed -n 2p | cut -d' ' -f3 | xargs kill -9
honcho --procfile $VIRTUAL_ENV/etc/Procfile start
EOT
```

Now running `legacy-start` inside the virtual environment your Invenio Legacy
should be up a running in `http://localhost:4000`
