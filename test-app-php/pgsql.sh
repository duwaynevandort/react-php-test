PHP_VER="5.6.1"
PHP_INI="/usr/local/php5/lib/php.ini"

# Check if extension exists first
php -m | grep pgsql

# Update brew and install requirements
brew update
brew install autoconf

# Download PHP source and extract
mkdir -p ~/php-src; cd ~/php-src
wget -c http://br1.php.net/distributions/php-$PHP_VER.tar.bz2
tar -xjf php-$PHP_VER.tar.bz2

# Install pdo
cd php-$PHP_VER/ext/pdo_pgsql/
phpize
./configure --with-pdo-pgsql="/Applications/Postgres.app/Contents/Versions/9.4"
make
sudo make install
sudo echo "extension=pdo_pgsql.so" >> $PHP_INI

# Install pgsql
cd ../pgsql/
phpize
./configure --with-pgsql="/Applications/Postgres.app/Contents/Versions/9.4"
make
sudo make install
sudo echo "extension=pgsql.so" >> $PHP_INI

# Check if extension exists, again
php -m | grep pgsql
