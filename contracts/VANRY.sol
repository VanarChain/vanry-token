//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./ERC20/presets/ERC20PresetMinterPauser.sol";
import "./ERC20/extensions/ERC20Capped.sol";

/**
 * @title New Token
 * @dev A capped ERC20 token contract with preset functionality 0f minter and pauser.
 */
contract VANRY is ERC20PresetMinterPauser, ERC20Capped {

    string public constant TOKEN_NAME = "VANRY";
    string public constant TOKEN_SYMBOL = "VANRY";
    uint256 public constant MAX_SUPPLY = 2400000000;
    uint256 public constant INITIAL_SUPPLY = 1200000000;

    event TokensMinted(address indexed _beneficiary, uint256 _amount, string _context);

    /**
     * @dev Constructor to initialize the token details and mint initial supply.
     * @param _beneficiary The address where initial supply will be minted.
     */

    constructor(address _beneficiary)
        ERC20PresetMinterPauser(TOKEN_NAME, TOKEN_SYMBOL)
        ERC20Capped(MAX_SUPPLY * 1 ether)
    {
        _mint(_beneficiary, INITIAL_SUPPLY *  1 ether);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override(ERC20, ERC20PresetMinterPauser) {
        super._beforeTokenTransfer(from, to, amount);
    }

    /**
     * @dev Creates amount of new tokens for account.
     *
     * Requirements:
     * - the caller must have the `MINTER_ROLE`.
     *
     * @param _account The address where amount of tokens will be minted.
     * @param _amount The amount of tokens to be minted.
     * @param _purpose The purpose of minting the tokens.
     *
     */

    function mint(address _account, uint256 _amount, string memory _purpose) public {

        super.mint(_account,_amount);

        emit TokensMinted(_account, _amount, _purpose);
    }

    /**
     * @dev Creates amount new tokens for account.
     *
     * See {ERC20-_mint}.
     *
     */
    
    function _mint(
        address account,
        uint256 amount
    ) internal virtual override(ERC20, ERC20Capped) {
        super._mint(account, amount);
    }
}