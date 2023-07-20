//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

/*
 * @title BoxV2
 * @dev BoxV2 contract
 * @dev This is an implementation contract
 */

contract BoxV2 is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    //storage layout
    uint256 internal number;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        /*
         * @dev Calling this in the constructor of a contract will prevent that contract from being initialized or reinitialized
         * to any version. It is recommended to use this to lock implementation contracts that are designed to be called
         * through proxies.
         */
        _disableInitializers();
    }

    /*
        @dev the proxy contract should call this function
        @dev this function works as a constructor for the proxy contract
    */
    function initialize() public initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    function getValue() public view returns (uint256) {
        return number;
    }

    function setValue(uint256 _number) public {
        number = _number;
    }

    function version() public pure returns (uint256) {
        return 2;
    }

    function _authorizeUpgrade(
        address newImplementation
    ) internal override onlyOwner {}
}
