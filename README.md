# **Fiat Lux** 🌾 by EasyCarbon ✳️
## Embedding satellite imagery into dynamic NFTs 🌍

![Public Minting Page - dApp](https://i.ibb.co/X3pJrHH/fiatluxdemo.gif)
###  [Find our demo @ FiatLux.live](https://www.fiatlux.live/)

## Use Cases
- Immediate disaster relief & prevention 🔥
- Tracking the efficacy of carbon credit providers 🌳
- Carbon offset tokens with built-in credit quality assurance 🛰

## Technical Overview

### For Storage (of the satellite imagery & other NFT data):
- We use IPFS & IPNS [^1] for storage (decentralized storage) & Pinata [^2] for updating the folders (CIDs) of the NFT metadata (embedded information) & satellite imagery stored.

### For the Smart Contracts:
- Our NFT smart contracts use the ERC-721A protocol [^3], which allows for low-cost (gas-fee) bulk minting.
- We also use the ERC-1155: Multi Token Standard, as it makes it simpler to create several different collections under one smart contract by allowing the minting of different tokens with unique BaseURIs—metadata). [^4]
- We have deployed several pre-audited ERC-1155 templates from Dedaub contract library. [^5]

### For the UI:
- Our public mint page is built with React using Chakra-UI. [^6]

## About Harberger Tax
- We have successfully deployed a Harberger Tax Implementation on Avalanche. (Modeled after WildCards [^7])
- Originally deployed on Goerli Ethereum Test Network [^8], we deployed our version on FUJI.
- Used for “taxing” NFT holders; holders have to pay to keep holding an NFT. [^9]
- *This allowed us to implement a subscription-based NFT.*

### See our full [GitHub Repo Here!](https://github.com/orgs/EasyCarbon/repositories)

[^1]: **IPNS Documentation** (https://docs.ipfs.io/concepts/ipns/)
[^2]: **Pinata API Documentation** (https://docs.pinata.cloud/pinata-api)
[^3]: **ERC-721A** (https://erc721a.org)
[^4]: **ERC-1155** (https://eips.ethereum.org/EIPS/eip-1155)
[^5]: **TreumERC1155, Dedaub Smart Contract Library** (https://library.dedaub.com/contracts/Ethereum/d5fabf928f5505a533bbfd0eb89569634c29b953/source)
[^6]: **Chakra-UI** (React) (https://chakra-ui.com/)
[^7]: **WildCards** (https://wildcards.world/)
[^8]: **Harberger Tax Implementation** (https://dev.to/wildcards/build-your-first-harberger-tax-app-part-1-3gdd)
[^9]: **Harberger Tax Overview** (https://medium.com/@simondlr/what-is-harberger-tax-where-does-the-blockchain-fit-in-1329046922c6)
