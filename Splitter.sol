pragma solidity ^0.4.19;


library SafeMath {
    function mul(uint256 a, uint256 b) internal constant returns (uint256) {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal constant returns (uint256) {
        uint256 c = a / b;
        return c;
    }

    function sub(uint256 a, uint256 b) internal constant returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal constant returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}


contract Splitter {
        
    address owner;
    address alice;
    address bob;
    address carol;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
        
    function Splitter(address _alice, address _bob, address _carol) public {
        owner = msg.sender;
        alice = _alice;
        bob = _bob;
        carol = _carol;
    } 
    
    function () public payable {
        splitBalance();
    }
        
    function splitBalance() public {
        if (msg.sender == alice) {
            uint256 _value = msg.value;
            uint256 _splittedValue = SafeMath.div(_value, 2);

            bob.transfer(_splittedValue);
            balanceOf[bob] = _splittedValue;

            carol.transfer(_splittedValue);
            balanceOf[carol] = _splittedValue;
        }
    }
        
    function withdraw (uint amount) public onlyOwner returns(bool) {
        require(amount <= this.balance);
        owner.transfer(amount);
        return true;
    }
        
    function withdrawToAddress(address _receiver, uint amount) public onlyOwner returns(bool){
        require(amount <= this.balance);
        _receiver.transfer(amount);
        return true;
    }

    mapping (address => uint256) public balanceOf;
    
}