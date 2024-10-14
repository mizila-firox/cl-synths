// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {SourceCode} from "./source/SourceCode.sol";
import {FunctionsRequest} from "lib/chainlink/contracts/src/v0.8/functions/v1_0_0/libraries/FunctionsRequest.sol";
import {FunctionsClient} from "lib/chainlink/contracts/src/v0.8/functions/v1_0_0/FunctionsClient.sol";
import {IERC20} from "lib/forge-std/src/interfaces/IERC20.sol";

// Synths contract
// this has Synthetics assets like stocks that is powered by Chainlink Automation and Functions
// deployed on the Fuji testnet blockchain first
contract Synths is SourceCode, FunctionsClient {
    using FunctionsRequest for FunctionsRequest.Request;
    /*//////////////////////////////////////////////////////////////
                            GLOBAL VARIABLES
    //////////////////////////////////////////////////////////////*/

    IERC20 public linkToken;
    address public router;
    bytes32 public donId;
    uint32 public gasLimit;
    uint64 public subscriptionId;

    mapping(string => Asset) public assets;

    struct Asset {
        // string name;
        string symbol;
        string price; // string for now, because of decimal type. later do the multiplication
        string updatedAt;
    }

    constructor(
        address _router,
        address _linkTokenAddress,
        bytes32 _donId,
        uint32 _gasLimit,
        uint64 _subscriptionId
    ) FunctionsClient(_router) {
        router = _router;
        linkToken = IERC20(_linkTokenAddress);
        donId = _donId;
        gasLimit = _gasLimit;
        subscriptionId = _subscriptionId;
    }

    /*//////////////////////////////////////////////////////////////
                          CHAINLINK FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    function update(
        string memory _symbol
    ) external returns (bytes32 requestId) {
        FunctionsRequest.Request memory req;
        req.initializeRequestForInlineJavaScript(sourceCodeGetPrices);

        string[] memory args = new string[](1);
        args[0] = _symbol;

        req.setArgs(args);

        requestId = _sendRequest(
            req.encodeCBOR(),
            subscriptionId,
            gasLimit,
            donId
        );
    }

    function fulfillRequest(
        bytes32 requestId,
        bytes memory response,
        bytes memory err
    ) internal override {
        require(msg.sender == router, "Only the router can fulfill");
        if (err.length > 0) {
            revert(string(err));
        }
        (
            string memory symbol,
            string memory price,
            string memory updatedAt
        ) = abi.decode(response, (string, string, string));

        // update the asset
        assets[symbol] = Asset({
            symbol: symbol,
            price: price,
            updatedAt: updatedAt
        });
    }

    /*//////////////////////////////////////////////////////////////
                               AUTOMATION
    //////////////////////////////////////////////////////////////*/

    // automate
    // callable only by the automation forwarder addresss
    // function
}
