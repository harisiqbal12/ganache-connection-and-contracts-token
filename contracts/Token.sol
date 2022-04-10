// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;

contract Token {
    string public name;
    string public symbol;
    uint public decimals = 18;
    uint public totalSupply;

    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

    constructor(string memory _name, string memory _symbol, uint _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = _totalSupply;
    }

    function transfer(address _to, uint value) external returns(bool success) {
        require(balanceOf[msg.sender] >= value);
        require(msg.sender != _to);
        _transfer(msg.sender, _to, value);
        return true;
    }

    function _transfer(address from, address _to, uint value) internal {
        require(_to != address(0));
        balanceOf[_to] = balanceOf[_to] + value;
        balanceOf[from] -= value;
        emit Transfer(from, _to, value);
    }

    function approver(address _spender, uint _value) external returns(bool success) {
        require(_spender != address(0));
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint _value) external returns(bool success) {
        require(balanceOf[_from] >= _value);
        require(allowance[_from][msg.sender] >= _value);

        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }
}