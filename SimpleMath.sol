pragma solidity ^0.4.19;

contract SimpleMath {
    
    uint256 public a = 0;
    
    function add(uint256 b) public {
        uint256 c = a + b;
        assert(c >= a);
        a = c;
    }
    
    function substract(uint256 b) public {
        assert(b <= a);
        a -= b;
    }
    
    function multiply(uint256 b) public {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        a = c;
    }
        
    function divide(uint256 b) public {
        uint256 c = a / b;
        a = c;
    }
            
    function pow(uint256 b) public {
        uint256 result = a ** b;
        a = result;
    }
    
    function numberOneState() public returns (uint256) {
        return a;
    }
    
    function numberReset() public {
        a = 0;
    }

}