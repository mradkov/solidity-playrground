pragma solidity ^0.4.19;


library SafeMath {
    function mul(uint256 a, uint256 b) internal constant returns (uint256) { //no constant PURE is better CasperUpdate
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal constant returns (uint256) { //no constant PURE is better CasperUpdate
        uint256 c = a / b;
        return c;
    }

    function sub(uint256 a, uint256 b) internal constant returns (uint256) { //no constant PURE is better CasperUpdate
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal constant returns (uint256) { //no constant PURE is better CasperUpdate
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}


contract Splitter {
    
    using SafeMath for uint256;    
        
    address owner;
    address bob;
    address carol;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier onlyPayloadSize(uint numwords) {
        assert(msg.data.length == numwords * 32 + 4);
        _;
    }
        
    function Splitter(address _bob, address _carol) public {
        owner = msg.sender;
        bob = _bob;
        carol = _carol;
    } 
    
    function () public payable {
        splitBalance();
    }
        
    function splitBalance() public { 
        require(msg.sender == owner);   //require msg.sender == alice or modifire only owner the, first better
        uint256 _value = msg.value;
        uint256 _splittedValue = SafeMath.div(_value, 2);

        bob.transfer(_splittedValue);
        balanceOf[bob] = balanceOf[bob].add(_splittedValue); //must use add everytime cuz you must know how much coins you have 

        carol.transfer(_splittedValue);
        balanceOf[carol] = balanceOf[carol].add(_splittedValue); //must use add everytime cuz you must know how much coins you have
    }

    function _withdraw(address _to, uint256 _amount) internal onlyPayloadSize(2) {
        require(_amount <= this.balance);
        _to.transfer(_amount);
    }

    function withdraw (uint _amount) public onlyOwner returns(bool) {
        _withdraw(owner, _amount);
        return true;
    }
        
    function withdrawToAddress(address _receiver, uint _amount) public onlyOwner returns(bool) {
        _withdraw(_receiver, _amount);
        return true;
    }

    mapping (address => uint256) public balanceOf;
    
}