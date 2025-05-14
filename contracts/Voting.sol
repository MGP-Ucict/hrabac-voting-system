//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {HRABAC} from "./HRABAC.sol";

contract Voting is HRABAC {

	struct Candidate {
		uint256 id;
		bytes32 name;
		uint256 countVotes;
	}

	struct Voting {
		uint256 id;
		uint256 startDate;
		uint256 endDate;
		mapping (uint256 => Candidate) candidates;
		mapping (uint256 => Users) users;
		address owner;
		string linkAdress;

	}

	struct Vote {
		uint256 id;

	}
	
	mapping (uint256 => Voting) public votings;

	modifier onlyVoter {
      		require(this.checkIsActive(msg.sender) && VOTER == users[msg.sender].role.name, "The user is not voter!");
       		_;
   	}

   	function vote(address _userAddress, uint256 _candidateID, uint256 _votingID) 
	external  onlyVoter {
	    	votings[votingID].candidates[_candidateID].countVotes ++; 
	}

	function getCandidateCountVotes(address _userAddress) public view returns (uint256 countVotes) {

		return votings[votingID].candidates[_candidateID].countVotes;
	}
}