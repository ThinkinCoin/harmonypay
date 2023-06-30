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

### 0. Instal YARN if you dont have installed yet (script for ubuntu 20.04) 
```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update && sudo apt install yarn
```

### 1. Clone the repository and install dependancies

```sh
git clone https://github.com/sekmet/harmonypay-gateway-app.git
cd harmonypay-gateway-app
```

Install HarmonyPay: 
```sh
yarn add pm2 --global
yarn install
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
