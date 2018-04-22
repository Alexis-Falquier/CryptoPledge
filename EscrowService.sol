pragma solidity ^ 0.4.18;

contract EscrowService {

    function EscrowService() public {
        
    }
    
    function () public payable {

    }
    
    address public escrowAddr;
    
    event contractCreated(
        address escrowAddress
    );
    
    function createContract(address _player1, address _player2, uint _bondAmnt) public returns(address) {
        address escrow = new EscrowContract(_player1, _player2, _bondAmnt);
        escrowAddr = escrow;
    }
    
    
    
}

contract EscrowContract {
    
    address public notary;
    uint bondAmnt;
    
    struct Player {
        address addr;
        address suggestedNotary;
        uint stake;
        bool dealUpheld;
    }
    
    Player player1;
    Player player2;

    function EscrowContract(address _player1, address _player2, uint _bondAmnt) public {
        player1.addr = _player1;
        player1.stake = 0;
        player1.dealUpheld = false;
        player2.addr = _player2;
        player2.stake = 0;
        player2.dealUpheld = false;
        bondAmnt = _bondAmnt;
        
    }
    
    function () public payable {

    }
    
    modifier onlyPlayers{
        if (msg.sender != player1.addr && msg.sender != player2.addr){ 
            revert();
        }
        _;
    }
    
     modifier onlyNotary{
        if (msg.sender != notary){ 
            revert();
        }
        _;
    }
    
    modifier notarySet{
        require(notary != 0);
        _;
    }
    
    modifier notaryNotSet{
        require(notary == 0);
        _;
    }
    
    function payBond() onlyPlayers payable public {
        if (msg.sender == player1.addr){
            if (player1.stake < bondAmnt){
                player1.stake += msg.value;
            }
            else { revert(); }
        }
        else {
             if (player2.stake < bondAmnt){
                player2.stake += msg.value;
            }
            else { revert(); }
        }
    }
    
    function suggestNotary(address _notary) onlyPlayers notaryNotSet public {
        if (msg.sender == player1.addr){
            player1.suggestedNotary = _notary;
        }
        else {
            player2.suggestedNotary = _notary;
        }
    }
    
    function setNotay() onlyPlayers notaryNotSet public {
        if (player1.suggestedNotary == player2.suggestedNotary){
            notary = player1.suggestedNotary;
        }
    }
    
    function confirmDeal() onlyPlayers public {
        if (msg.sender == player1.addr){
            player1.dealUpheld = true;
        }
        else{
            player2.dealUpheld = true;
        }
    }
    
    modifier dealUpheld{
        require(player1.dealUpheld == true && player2.dealUpheld == true);
        _;
    }
    
    function returnAssets() dealUpheld public {
        player1.addr.transfer(player1.stake);
        player2.addr.transfer(player2.stake);
    }
    
    function resolveDispute(uint _option) onlyNotary public {
        if (_option == 1){
            player1.addr.transfer(player1.stake + player2.stake);
        }
        else if (_option == 2){
            player1.addr.transfer(player1.stake + player2.stake);
        }
    }
    
}
