pragma solidity ^0.4.0;

/**
 * Integers Library
 * 
 * In summary this is a simple library of integer functions which allow a simple
 * conversion to and from strings
 * 
 * @author James Lockhart <james@n3tw0rk.co.uk>
 */
library Integers {
    /**
     * Parse Int
     * 
     * Converts an ASCII string value into an uint as long as the string 
     * its self is a valid unsigned integer
     * 
     * @param _value The ASCII string to be converted to an unsigned integer
     * @return uint The unsigned value of the ASCII string
     */
    function parseInt(string _value) 
        public
        returns (uint _ret) {
        bytes memory _bytesValue = bytes(_value);
        uint j = 1;
        for(uint i = _bytesValue.length-1; i >= 0 && i < _bytesValue.length; i--) {
            assert(_bytesValue[i] >= 48 && _bytesValue[i] <= 57);
            _ret += (uint(_bytesValue[i]) - 48)*j;
            j*=10;
        }
    }
    
    /**
     * To String
     * 
     * Converts an unsigned integer to the ASCII string equivalent value
     * 
     * @param _base The unsigned integer to be converted to a string
     * @return string The resulting ASCII string value
     */
    function toString(uint _base) 
        internal
        returns (string) {
        bytes memory _tmp = new bytes(32);
        uint i;
        for(i = 0;_base > 0;i++) {
            _tmp[i] = byte((_base % 10) + 48);
            _base /= 10;
        }
        bytes memory _real = new bytes(i--);
        for(uint j = 0; j < _real.length; j++) {
            _real[j] = _tmp[i--];
        }
        return string(_real);
    }
}