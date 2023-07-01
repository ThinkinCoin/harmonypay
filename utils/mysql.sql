DROP DATABASE IF EXISTS api;
CREATE SCHEMA api;

CREATE TABLE api.orders (
id INT AUTO_INCREMENT PRIMARY KEY,
payment_id INT,
transaction_id VARCHAR(160),
amount DECIMAL(5,2),
confirmations SMALLINT,
currency_id VARCHAR(9),
autosettlements JSON,
timeout_hours INT,
microtime VARCHAR(30),
to_address VARCHAR(160),
domain VARCHAR(160),
domain_key VARCHAR(30),
status TINYINT,
created_at TIMESTAMP default CURRENT_TIMESTAMP);
CREATE INDEX idx_id ON api.orders(id);
CREATE INDEX idx_payment_id ON api.orders(payment_id);
CREATE INDEX idx_to ON api.orders(to_address);


CREATE TABLE api.transactions (
id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
block_hash VARCHAR(255),
block_number BIGINT,
from_address VARCHAR(160),
gas INT, 
gas_price VARCHAR(30),
hash VARCHAR(255),
input TEXT,
nonce INT,
r VARCHAR(255),
s VARCHAR(255),
timestamp VARCHAR(30),
to_address VARCHAR(160),
transaction_index SMALLINT,
v VARCHAR(160),
value TEXT,
created_at TIMESTAMP default CURRENT_TIMESTAMP);
CREATE INDEX idx_trans_id ON api.transactions(id);
CREATE INDEX idx_order_id ON api.transactions(order_id);
CREATE INDEX idx_trans_to ON api.transactions(to_address);


CREATE TABLE api.donations (
id INT AUTO_INCREMENT PRIMARY KEY,
transaction_id VARCHAR(160),
amount VARCHAR(30),
confirmations SMALLINT,
currency_id VARCHAR(9),
autosettlements JSON,
microtime VARCHAR(30),
from_address VARCHAR(160),
to_address VARCHAR(160),
domain VARCHAR(160),
domain_key VARCHAR(30),
status TINYINT,
created_at TIMESTAMP default CURRENT_TIMESTAMP);
CREATE INDEX idx_donations_id ON api.donations(id);
CREATE INDEX idx_donations_to ON api.donations(to_address);


CREATE TABLE api.wallets (
id INT AUTO_INCREMENT PRIMARY KEY,
currency_id VARCHAR(30),
address VARCHAR(160),
confirmations SMALLINT,
enabled BOOLEAN,
created_at TIMESTAMP default CURRENT_TIMESTAMP);
CREATE INDEX idx_wallets_id ON api.wallets(id);
CREATE INDEX idx_wallets_to ON api.wallets(address);


CREATE TABLE api.settlements (
id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
settlement_type VARCHAR(30),
settlement_info JSON,
settlement_pair VARCHAR(15),
settlement_amount DECIMAL(5,2),
transaction_id VARCHAR(160),
amount DECIMAL(5,2),
currency_id VARCHAR(9),
to_address VARCHAR(160),
order_info JSON,
status TINYINT,
created_at TIMESTAMP default CURRENT_TIMESTAMP);
CREATE INDEX idx_settlements_id ON api.settlements(id);
CREATE INDEX idx_settlements_to ON api.settlements(to_address);


CREATE TABLE api.coins (
id INT AUTO_INCREMENT PRIMARY KEY,
symbol VARCHAR(15),
name VARCHAR(60),
address_length INT,
decimal_precision INT,
token_group VARCHAR(60),
token_image VARCHAR(160),
contract VARCHAR(160),
contract_testnet VARCHAR(160),
erc20 BOOLEAN,
hrc20 BOOLEAN,
metamask_abi JSON,
metamask_currency VARCHAR(15),
metamask_gas VARCHAR(30),
metamask_gas_limit VARCHAR(30),
wp_plugin_open_in_wallet BOOLEAN,
active BOOLEAN,
created_at TIMESTAMP default CURRENT_TIMESTAMP);
CREATE INDEX idx_coin_id ON api.coins(id);
CREATE INDEX idx_coin_name ON api.coins(name);

INSERT INTO api.coins (symbol,name,address_length,decimal_precision,token_group,hrc20,wp_plugin_open_in_wallet,active) VALUES ('ONE','Harmony ONE',42,18,'Main blockchains',1,1,1);

-- To increase the max connections, you'll have to modify the my.cnf or my.ini configuration file
-- or dynamically set the max_connections global variable like this:
-- SET GLOBAL max_connections = 999;
