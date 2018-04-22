# CryptoPledge
*A multi purpose escrow smart contract*

**CryptoPledge a multi use escrow smart contract for applicaions to use**

crypto pledge is in all its simplicity an escrow smart contract, but built with the idea of it being used for multiple use cases rather than one specific situation. A general escrow contract can be used by a multitude of platforms and applications, where the smart contract gives all the basic functionality for a crypto escrow.

**escrow contract factory**

the smart contract built on solidity can be launched on both the Ehtereum network as well as the QTUM netowrk. Once launched the EscrowService contract acts as a contract factory for any platform or application which has a need for a crypto escrow. Only the two parties involved, the amount to be staked, and a notary need be defined for the contract. 

**simple yet verbose functionality**

Both parties need to pay the full deposit in order for the funds to be locked, and in order for them to get it back each party needs to acknowledge that the other party fulfilled their side of the agreement. Once both parties have done so, the funds are released. The definition of what it means to fulfill the agreement is purposfully left vague in order for the contract to work on a variety of use cases. Any further details on this can be built upon through an application layer, on the blockchain level, the ocntract only needs to know that the agreement has been reached. A notary is in place in case of a dispute, in which if there is a malicious actor, the bad actor will lose thier stake and the other player will recieve the full funds. The notary has no access to the funds but can only resolve the issue between the two players.
