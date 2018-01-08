pragma solidity ^0.4.11;

contract DonationCampaignContract {
    address contractCreator;
    mapping(address => uint) donorList;
    event NewDonation(address donor, uint amount);
    uint donated = 0;

    modifier minimumDonation(uint threshold) {
        if (msg.value < threshold) {
            revert();
        }
        _;
    }

    modifier onlyCreator() {
        if (msg.sender == contractCreator) {
            _;
        } else {
            revert();
        }
    }

    modifier onlyHasEther(uint etherBalance) {
        if (etherBalance > 0) {
            _;
        } else {
            revert();
        }
    }

    function DonationCampaignContract() {
        contractCreator = msg.sender;
    }

    function donate() payable minimumDonation(0.5 ether) {
        // Check if this guy has ever donated
        uint currentDonation = 0;
        if (donorList[msg.sender] != 0) {
            currentDonation = donorList[msg.sender];
        }

        // Save the donation record into a mapping table
        donorList[msg.sender] = currentDonation + msg.value;

        // Exeute event
        NewDonation(msg.sender, msg.value);
        donated = currentDonation;
    }

    function claimDonation() onlyCreator() onlyHasEther(this.balance) {
        uint currentBalance = this.balance;
        contractCreator.transfer(currentBalance);
    }

    function destroyContract() onlyCreator() {
        selfdestruct(contractCreator);
    }

    function checkSelfDonationAmount() constant returns(uint) {
        uint balancenum = donated;
        return balancenum;
    }
}
