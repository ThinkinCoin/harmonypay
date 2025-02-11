<p align="center">
   <br/>
   <a href="https://harmonypay.open4g.com/" target="_blank"><img width="150px" src="https://github.com/sekmet/harmonypay-gateway/raw/main/docs/ONE.svg" /></a>
   <h3 align="center">HarmonyPay - Payment Gateway</h3>
   <p align="center">
   Accept Harmony ONE and HRC20 Tokens. Peer-to-peer transactions.
   </p>

</p>

# Overview

## HarmonyPay Gateway Application - Accept Harmony ONE and HRC20 tokens

# IN PROGRESS

Cryptocurrency payment gateway for WooCommerce and Easy Digital Downloads. Accept Harmony ONE and HRC20 Tokens. Peer-to-peer transactions.

## Description

Cryptocurrency payment gateway for WooCommerce and Easy Digital Downloads. Receive coins directly into the wallet of your choice.


## Key Features & Highlights

- 0% transaction fees
- No KYC or product restrictions
- Peer-to-peer transactions
- No redirection to 3rd parties or iframes
- Use any crypto wallet you want
- Automagically detect unique payments using one wallet address
- Hierarchically deterministic (HD) wallet support
- 1-Click payment buttons, MetaMask, Waves Client, etc.
- Fiat autosettlement enables you to connect to exchange(s) and instantly convert selected coins to fiat or stablecoins
- Donations widget shortcode generator
- Tor support
- 0-conf (mempool) support for some coins
- Take MCC for a test ride by visiting our <a href="https://harmonypay.open4g.com/">Demo Store</a>


## eCommerce platforms supported

- Easy Digital Downloads
- WooCommerce

## Cryptocurrencies supported

- Harmony ONE
- HRC20 Tokens
- Custom HRC20 Tokens


## About HarmonyPay

HarmonyPay is an easy to implement, cryptocurrency payment gateway for WooCommerce and Easy Digital Downloads. Accept Harmony ONE and HRC20 Tokens. Peer-to-peer transactions.


# Getting Started

## Requirements
- docker
- node >= v12 / npm
- [one wallet](https://metamask.io/download.html)
- [metamask wallet](https://metamask.io/download.html)

# Usage and installation

### Preparation:
## Instal YARN if you dont have installed yet (script for ubuntu 20.04) 
```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update && sudo apt install yarn
```
## Install Docker packages by apt

Update the apt package index and install packages to allow apt to use a repository over HTTPS:
```sh
 sudo apt-get update
 sudo apt-get install ca-certificates curl gnupg
```
Add Docker’s official GPG key:
```sh
 sudo install -m 0755 -d /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
 sudo chmod a+r /etc/apt/keyrings/docker.gpg
```
Use the following command to set up the repository:
```sh
 echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
Than install using: 
```sh
snap install docker     # version 20.10.24, or
apt  install docker.io  # version 20.10.21-0ubuntu1~20.04.2
```

### 1. Clone the repository and install app

```sh
git clone https://github.com/thinkincoin/harmonypay.git
cd harmonypay
```

Install HarmonyPay: 
```sh
yarn add pm2 @types/react --global /
&& yarn add --dev @types/react
yarn install
```
Install Gateway (from app dir): 
```sh
cd ./harmonypay-gateway-app
yarn install && yarn add --dev @types/react

```
Install Monitror (from app dir): 
```sh
cd ./payments-monitor
yarn install
```
Install Auto Settlement (from app dir): 
```sh
cd ./autosettlement-agent
yarn install
```
Load .env files (from app dir): 
```sh
cp ./utils/.env.sample .env
cp ./utils/.env.sample ./harmonypay-gateway-app/.env
```
Setup database:
```sh
sh ./utils/dbsetup.sh
```

OPTIONAL: add server data on .env files: 
```
# Get ip address
CURRENTIP=`hostname -I | awk '{print $1}'`
SERVERURL="http:\/\/$CURRENTIP:3033"
SERVERURLAPI="http:\/\/$CURRENTIP:3033\/api\/v1"

perl -pi -e "s/SERVER_URL_API/$SERVERURLAPI/g" ./.env
perl -pi -e "s/SERVER_URL_NEXTAUTH/$SERVERURL/g" ./.env

perl -pi -e "s/SERVER_URL_API/$SERVERURLAPI/g" ./harmonypay-gateway-app/.env
perl -pi -e "s/SERVER_URL_NEXTAUTH/$SERVERURL/g" ./harmonypay-gateway-app/.env
```

### 2. Run development enviroment

```sh
yarn dev
```

### Or production enviroment

```sh
yarn start
```

## License

MIT
