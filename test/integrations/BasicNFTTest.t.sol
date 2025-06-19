// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test, console2} from "forge-std/Test.sol";
import {BasicNFT} from "../../src/BasicNFT.sol";
import {DeployBasicNFT} from "../../script/DeployBasicNFT.s.sol";

contract BasicNFTTest is Test {
    DeployBasicNFT public deployBasicNFT;
    BasicNFT public basicNFT;

    address public USER = makeAddr("user");
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployBasicNFT = new DeployBasicNFT();
        basicNFT = deployBasicNFT.run();
    }

    function testNameIsCorrect() public view {
        string memory expected = "Dogie";
        string memory actual = basicNFT.name();

        console2.log("basicNFT address: ", address(basicNFT));
        // assert(expected == actual); - strings exist as an array of bytes, arrays can't
        // be compared to arrays in this way, this is limited to primitive data types
        assert(keccak256(abi.encodePacked(expected)) == keccak256(abi.encodePacked(actual)));
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(USER);
        basicNFT.mintNft(PUG);

        assert(basicNFT.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(PUG)) == keccak256(abi.encodePacked(basicNFT.tokenURI(0))));
    }
}
