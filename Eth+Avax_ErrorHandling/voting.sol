// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    mapping(address => bool) public hasVoted;
    mapping(uint => uint) public voteCounts;
    
    uint public totalVotes;
    uint public constant MAX_OPTIONS = 3;
    uint public votingEndTime;
    address public owner;

    constructor(uint _durationInMinutes) {
        require(_durationInMinutes > 0, "Voting duration must be positive");
        votingEndTime = block.timestamp + (_durationInMinutes * 1 minutes);
        owner = msg.sender;
    }

    function vote_1or2or3(uint _choice) external {
        require(!hasVoted[msg.sender], "Already voted");
        require(block.timestamp < votingEndTime, "Voting has ended");
        require(_choice > 0 && _choice <= MAX_OPTIONS, "Invalid option");

        hasVoted[msg.sender] = true;
        voteCounts[_choice]++;
        totalVotes++;

        assert(totalVotes <= type(uint).max); // Ensure no overflow
    }

    function endVoting() external {
        require(msg.sender == owner, "Only owner can end voting");
        if (block.timestamp < votingEndTime) {
            revert("Voting period not over");
        }
        votingEndTime = block.timestamp;
    }

    function getResults() external view returns (uint[MAX_OPTIONS] memory) {
        require(block.timestamp >= votingEndTime, "Voting still ongoing");
        uint[MAX_OPTIONS] memory results;
        for (uint i = 1; i <= MAX_OPTIONS; i++) {
            results[i-1] = voteCounts[i];
        }
        return results;
    }
}
