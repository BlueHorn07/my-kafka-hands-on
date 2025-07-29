export USERNAME=admin
export PASSWORD=admin1234
export DATABASE=my_database

mysql -u $USERNAME -p$PASSWORD $DATABASE -e "CREATE TABLE IF NOT EXISTS test_cdc (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255), created_at DATETIME);"

while true; do
    mysql -u $USERNAME -p$PASSWORD $DATABASE -e "INSERT INTO test_cdc (name, created_at) VALUES ('User-$(date +%s)', NOW());"
    sleep 1
done
