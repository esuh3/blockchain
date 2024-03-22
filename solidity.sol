

pragma solidity ^0.8.18;

contract SimpleStore {
    uint256 public favoriteNumber;

    uint256[] listOfFavoriteNumbers;

    Person[] public listOfPersons;
    
    mapping (uint256 favoriteNumber => string ofPerson) public favoriteNumbersOf;
    
    struct Person {
        uint256 preferredNumber;
        string name;
    }

    event AddPerson(uint favoriteNumber, string personName);
    
    function store(uint256 fNumber) public {
        favoriteNumber = fNumber;
        favoriteNumber++;
    }
        
    function retrievefavoritenumber() public view returns(uint256){
            return favoriteNumber;
    }

    function addPerson(uint256 personNumber, string memory personName) public {
        listOfPersons.push(Person(personNumber, personName));
        favoriteNumbersOf[personNumber] = personName;
        emit AddPerson(personNumber, personName);
    }

        function registerCandidate(uint _id, string memory _name) public onlyOwner {
        require(candidates[_id].id == 0, "Candidate with this ID already exists");        
        Candidate memory newCandidate = Candidate(_id, _name, 0);
        candidates[_id] = newCandidate;
        candidateIds.push(_id);
    }

        function vote(uint _candidateId) public {
        require(candidates[_candidateId].id != 0, "Candidate with this ID does not exist");
        require(!voters[msg.sender], "You have already voted");        
        candidates[_candidateId].voteCount++;
        voters[msg.sender] = true;
    }
}
