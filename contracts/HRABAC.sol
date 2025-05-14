//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract HRABAC {

	struct Role {
		bytes32 name;
		bool isActive;
	}

	struct User {
		Role role;
		bool isUserActive;
		address userAddress;
	}
	
	mapping (address => User) public users;

	bytes32 public constant VOTER = keccak256("Voter");
	bytes32 public constant ADMIN = keccak256("Admin");
	bytes32 public constant SUPERADMIN = keccak256("Superadmin");

	address public owner;
	
	constructor()
	{
		owner = msg.sender;
	}

	function getSender() public view returns (address)  
	{  
	    return msg.sender;  
	}
	
	function getOwner() public view returns (address)  
	{  
	    return owner;  
	}

	//assign role to an address
	function assignRole(address _userAddress, string memory _name, bool _isRoleActive, bool _isUserActive) 
	external  onlyOwner returns () {

		users[_userAddress].role= Role({name: keccak256(abi.encodePacked(_name)), isActive: _isRoleActive});
		users[_userAddress].isUserActive = _isUserActive;
	}

	//get an assigned role to an address
	function getAssignedRole(address _userAddress) public view returns (Role memory role) {

		return users[_userAddress].role;
	}

	//make an address active or inactive
	function setAddressIsActive(address _user, bool _isUserActive) external  onlyOwner {

		users[_userAddress].isUserActive = _isUserActive;
	}

	//check whether an address is active
	function checkIsActive(address _userAddress) external view returns (bool) {

		return users[_userAddress].isUserActive && users[_userAddress].role.isActive;
	}

	modifier onlyOwner {
	
		require(msg.sender == owner, "The user is not owner!");
		_;
	}
}