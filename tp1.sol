pragma solidity ^0.8.0;
 
contract VotingSystem {
    struct Candidate {
        uint id; 
        string name;
        uint voteCount; 
    }
    mapping(uint => Candidate) public candidates;
    uint[] public candidateIds;
    mapping(address => bool) public voters;
    address public owner;
    constructor() {
        owner = msg.sender; 
    }
 

    function addCandidate(uint _id, string memory _name) public {
        require(msg.sender == owner, "Only owner can add candidates"); 
        candidates[_id] = Candidate(_id, _name, 0); 
        candidateIds.push(_id); 
    }
 
    function vote(uint _candidateId) public {
        require(!voters[msg.sender], "You have already voted"); 
        require(candidates[_candidateId].id != 0, "Candidate does not exist"); 
        candidates[_candidateId].voteCount++; 
        voters[msg.sender] = true; 
    }
}
