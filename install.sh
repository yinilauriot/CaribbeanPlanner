USERNAME='root'
PASSWORD=''
DBNAME='db_CaribbeanPlanner'
HOST='localhost'

USER_USERNAME='ylauriot'
USER_PASSWORD='lyn59161012'

MySQL=$(cat <<EOF
DROP DATABASE IF EXISTS $DBNAME;
CREATE DATABASE $DBNAME DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
DELETE FROM mysql.user WHERE user='$USER_USERNAME' and host='$USER_PASSWORD';
GRANT ALL PRIVILEGES ON $DBNAME.* to '$USER_USERNAME'@'$HOST' IDENTIFIED BY '$USER_PASSWORD' WITH GRANT OPTION;
EOF
)

echo $MySQL | mysql --user=$USERNAME --password=$PASSWORD

mysql -u $USERNAME -p $PASSWORD $DBNAME < db_caribbeanplanner.sql