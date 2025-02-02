pragma solidity 0.8.0;

/**
 * Addresses Library
 * 
 * In summary this is a simple library of address functions which extends the
 * pre-existing functionality
 * 
 * @author James Lockhart <james@n3tw0rk.co.uk>
 */
library Addresses {
    /**
     * Is Contract
     * 
     * Check to see if the subject address is a contract on the Ethereum network
     * 
     * @param _base The address on the network to check if it is a contract
     * @return _r Returns true if it is a valid contract
     */
    function isContract(address _base) internal view returns (bool _r) {
        assembly {
            _r := gt(extcodesize(_base), 0)
        }
    }
}
