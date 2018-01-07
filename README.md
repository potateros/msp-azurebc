# msp-azurebc

## How to use this repo

Switch to different branches for different computers

bc3 is the first node

bc4 is the second node

## How to install

* Install [Geth](https://geth.ethereum.org/downloads/)

* Open the terminal and run

`[location of folder] -networkid [random numbers]`

Example:

`\home\user\blockchain\ethnet\ -networkid 1234512345`

* Open the Geth interactive console `geth attach`

* To check how many peers are connected `net.peerCount`

* To start mining `miner.start(2)` (You can replace 2 with the number of threads you'd like to use)

* Install Ethereum wallet [MIST](https://github.com/ethereum/mist/releases)

* You should be good to go
