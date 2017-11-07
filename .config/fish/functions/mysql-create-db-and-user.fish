function mysql-create-db-and-user
  set -l user $argv[1]
  set -l database $argv[1]
  set -l password $argv[1]

  mysqladmin -u root create $database
  mysql -u root -e "GRANT ALL ON $database.* TO '$user'@'localhost' IDENTIFIED BY '$password';"
end
