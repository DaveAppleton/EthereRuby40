//start pragma OMIT
pragma solidity ^0.4.10;
//end pragma OMIT

contract RubyToken {
//start basic OMIT

    /* Public variables of the token */
    string  public standard = 'Token 0.1';
    string  public name;
    string  public symbol;
    uint8   public decimals;
    uint256 public totalSupply;
    address public owner;
//end basic OMIT
    

//start fa OMIT
    struct fundAmount  {
        uint256     amount;
        bool        passedKYC;
        bool        blocked;
    }

    /* This creates an array with all balances */
    mapping (address => fundAmount) public balances;
//end fa OMIT

//start mod event OMIT
    /* This generates a public event on the blockchain that will notify clients */
    event Transfer(address indexed from, address indexed to, uint256 value); // HL

    modifier MustBeEnabled(address x) {
        if (balances[x].blocked) throw;
        if (!balances[x].passedKYC) throw;
        
        _;
    }
    
    modifier MustBeOwner() {
        if (msg.sender != owner) throw;
        
        _;
    }
//end mod event OMIT

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function RubyToken(
        uint256 initialSupply,
        string tokenName,
        uint8 decimalUnits,
        string tokenSymbol
        ) {
        owner = msg.sender;
        balances[msg.sender].passedKYC = true;
        balances[msg.sender].amount = initialSupply;              // Give the creator all initial tokens
        totalSupply = initialSupply;                        // Update total supply
        name = tokenName;                                   // Set the name for display purposes
        symbol = tokenSymbol;                               // Set the symbol for display purposes
        decimals = decimalUnits;                            // Amount of decimals for display purposes
    }

//start balance OMIT
    function balanceOf(address user) constant returns (uint256) {
        return balances[user].amount;
    }
//end balance OMIT

    /* Send coins */
//start xfer OMIT
    function transfer(address _to, uint256 _value) 
    MustBeEnabled(msg.sender) // HL
    MustBeEnabled(_to) { // HL
        if (_to == 0x0) throw;                               // Prevent transfer to 0x0 address
        if (balances[msg.sender].amount < _value) throw;     // Check if the sender has enough
        if (balances[_to].amount + _value < balances[_to].amount) throw; // Check for overflows
        balances[msg.sender].amount -= _value;                 // Subtract from the sender
        balances[_to].amount += _value;                        // Add the same to the recipient
        Transfer(msg.sender, _to, _value); // Notify anyone listening that this transfer took place // HL
   }
//end xfer OMIT
   
//start cs OMIT
    /* Approve the account for operation */
    function approve(address user) MustBeOwner {
        balances[user].passedKYC = true;
    }
    
    function block(address user) MustBeOwner {
        balances[user].blocked = true;
    }

    function unblock(address user) MustBeOwner {
         balances[user].blocked = false;
    }

    function newOwner(address newOwner) MustBeOwner {
        owner = newOwner;
    }
//end cs OMIT

}
