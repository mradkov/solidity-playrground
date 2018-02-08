pragma solidity ^0.4.19;

contract SimpleMath {
    
    function add(int256 a, int256 b) public returns (int256) {
        int256 c = a + b;
        assert(c >= a);
        return c;
    }
    
    function substract(int256 a, int256 b) public returns (int256) {
        assert(b <= a);
        return a - b;
    }
        
    function multiply(int256 a, int256 b) public returns (int256) {
        int256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }
        
    function divide(int256 a, int256 b) public returns (int256) {
        int256 c = a / b;
        return c;
    }
            
    function pow(uint256 a, uint256 b) public returns (uint256) {
        uint256 result = a ** b;
        return (result);
    }
}