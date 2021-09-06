#!/usr/bin/python3

from brownie import SandDollarNFT, accounts, network, config


OPENSEA_FORMAT = "https://testnets.opensea.io/assets/{}/{}"


def main():
    dev = accounts.add(config["wallets"]["from_key"])
    print(network.show_active())

    for idx in range(4):
        contract = SandDollarNFT[len(SandDollarNFT) - 1]

        transaction = contract.mint({"from": dev})
        transaction.wait(1)

        print(
            "View NFT on OpenSea: {}".format(
                OPENSEA_FORMAT.format(
                    contract.address, contract.totalSupply()-1)
            )
        )

    print('Please wait 20 minutes and hit the "refresh metadata" button.')
