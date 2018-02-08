pragma solidity ^0.4.19;

contract SimpleMath {
    
    int public state = 0;

    function numberOneState() public returns (int) {
        return state;
    }
    
    function numberReset() public returns (int) {
        state = 0;
        return state;
    }
    
    function add(int b) public returns (int) {
        state += b;
        return state;
    }
    
    function substract(int b) public returns (int) {
        assert(b <= state);
        state -= b;
        return state;
    }
    
    function multiply(int b) public returns (int) {
        state *= b;
        return state;
    }
        
    function divide(int b) public returns (int) {
        state /= b;
        return state;
    }
            
    function pow(uint b) public returns (int) {
        if (state >= 0) {
            state = int(uint(state) ** b);
        } else {
            state = int(uint(-state) ** b);
        }

        return state;
    }

    function mod(int b) public returns (int) {
        state = state % b;
        return state;
    }


}