// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract DeployBasicNFT is Script {
    function run() external returns (BasicNFT){
        vm.startBroadcast();
        BasicNFT BasicNFT = new BasicNFT();
        vm.stopBroadcast();
        return BasicNFT;
    }
}