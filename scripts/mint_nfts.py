#!/usr/bin/python3

from brownie import NFT, accounts, network, config


OPENSEA_FORMAT = "https://testnets.opensea.io/assets/{}/{}"


def main():
    dev = accounts.add(config["wallets"]["from_key"])
    print(network.show_active())

    contract = NFT[len(NFT) - 1]
    transaction = contract.mintBatch(4, {"from": dev})
    transaction.wait(1)

    print(
        "View NFT on OpenSea, e.g.: {}".format(
            OPENSEA_FORMAT.format(contract.address, 0)
        )
    )

    print('You may need to hit the "refresh metadata" button in OpenSea.')
