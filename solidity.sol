

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
}
