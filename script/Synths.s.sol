// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {IERC20} from "lib/forge-std/src/interfaces/IERC20.sol";
import {Synths} from "../src/Synths.sol";

contract SynthsScript is Script {
    // Synths public synths;
    // FUJI
    address routerFuji = 0xA9d587a00A31A52Ed70D6026794a8FC5E2F5dCb0;
    bytes32 donIdFuji =
        0x66756e2d6176616c616e6368652d66756a692d31000000000000000000000000;
    uint32 gasLimitFuji = 300_000;
    uint64 subscriptionIdFuji;
    IERC20 linkTokenAddressFuji =
        IERC20(0x0b9d5D9136855f6FEc3c0993feE6E9CE8a297846);

    // 14041 VALE3
    // 14157 ITUB4
    // 1774  ABEV3
    // 604793 MGLU3
    // ELET3 12760
    // 2797 EMBR3

    address routerSepolia = 0xb83E47C2bC239B3bf370bc41e1459A34b41238D0;
    bytes32 donIdSepolia =
        0x66756e2d657468657265756d2d7365706f6c69612d3100000000000000000000;
    uint32 gasLimitSepolia = 300_000;
    uint64 subscriptionIdSepolia = 3655;
    IERC20 linkTokenAddressSepolia =
        IERC20(0x779877A7B0D9E8603169DdbD7836e478b4624789);

    function run() public {
        vm.startBroadcast();

        // synths = new Synths(
        //     routerFuji,
        //     address(linkTokenAddressFuji),
        //     donIdFuji,
        //     gasLimitFuji,
        //     subscriptionIdFuji
        // );

        // synths.update("14041"); // VALE3

        //////////////////////////////////////////////////
        // SEPOLIA
        //////////////////////////////////////////////////

        // Synths synths = new Synths(
        //     routerSepolia,
        //     address(linkTokenAddressSepolia),
        //     donIdSepolia,
        //     gasLimitSepolia,
        //     subscriptionIdSepolia
        // );

        // console.logAddress(address(synths));

        Synths synths = Synths(0xd7c15fBc007f7437440d7C3276D034336a73C473);
        // synths.update("14041"); // VALE3
        // synths.update("1774"); // ABEV

        Synths.Asset memory asset = Synths.Asset({
            symbol: "",
            price: 0,
            updatedAt: ""
        });
        (asset.symbol, asset.price, asset.updatedAt) = synths.assets("VALE");

        console.logString(asset.symbol);
        console.logUint(asset.price / 1e16);
        console.logString(asset.updatedAt);
    }
}
