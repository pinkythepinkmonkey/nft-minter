# nft-minter

Mint NFT collections on Ethereum Virtual Machine (EVM) blockchains such as Ethereum, Polygon, or Binance Smart Chain.

# Related resource

The code here is an extension of the `simple` contract in PatrickAlphaC [nft-mix](https://github.com/PatrickAlphaC/nft-mix) tutorial. Give this a read for more information and especially if you are interested in developing a contract which can generate random NFTs.

I have also found the [OpenZeppelin Contracts Wizard](https://wizard.openzeppelin.com/) to be very useful. This wizard assumes you are using OpenZeppelin >= 4.x contracts while the contract here is based on OpenZepplin 3.x due to compatibility issues with Brownie. Nonetheless, it is generally a useful place to start when looking to add new features to an NFT contract.

## Prerequisites

The following are required:

- [nodejs and npm](https://nodejs.org/en/download/)
- [python](https://www.python.org/downloads/)

[Brownie](https://eth-brownie.readthedocs.io/en/stable/install.html) and [ganache-cli](https://www.npmjs.com/package/ganache-cli) must also be installed:
```
> pip install eth-brownie
> npm install -g ganache-cli
```

## Set environmental variables

Environmental variables can be placed in a `.env` file and actived using `source .env`. The following variable must be set:

- PRIVATE_KEY: the private key in your Etherum wallet. The same key is also used on Polygon. Make sure to add `.env` to your `.gitignore` file as you must keep your private key private!

## Fund wallet for testnets

You can get ETH or MATIC into your wallet by using the [rinkeby faucet](https://docs.chain.link/docs/link-token-contracts#rinkeby) or [mumbai faucet](https://faucet.matic.network/), respectively.

## Deploy contract

```
> brownie run scripts/deploy_contract.py --network rinkeby
```

## Mint tokens

```
> brownie run scripts/mint_nfts.py --network rinkeby
```

## Add Polygon to Brownie

```
> ./setup_polygon.sh
```

The Polygon testnetwork is called Mumbai and can be used by replaced `rinkeby` with `mumbai` when deplying the contract and minting tokens. In my experience, OpenSea shows results almost immediately when deployed to Rinkeby, but can taken several hours to pickup contracts and tokens on Mumbai.

