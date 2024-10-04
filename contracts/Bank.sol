// SPDX - License - Identifier : MIT
pragma solidity ^0.8.20;

contract Bank {
    struct Account {
        address owner;
        uint256 balance;
    }

    mapping ( address => Account ) public accounts ;

    function createAccount () public {
        require(accounts[msg.sender].owner == address(0), "Account already exists");

        accounts[msg.sender] = Account({
            owner: msg.sender,
            balance: 0
        });
    }

    function deposit(uint256 amount) public {
        require(accounts[msg.sender].owner != address(0), "Account does not exist");

        accounts[msg.sender].balance += amount;
    }

    function withdraw(uint256 amount) public {
        require(accounts[msg.sender].owner != address(0), "Account does not exist");

        require(accounts[msg.sender].balance >= amount, "Insufficient balance");

        accounts[msg.sender].balance -= amount;
    }
}
