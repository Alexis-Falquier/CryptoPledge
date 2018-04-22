# CryptoPledge
*A multi purpose escrow smart contract*

**CryptoPledge a multi use escrow smart contract for applicaions to use**

crypto pledge is in all its simplicity an escrow smart contract, but built with the idea of it being used for multiple use cases rather than one specific situation. A general escrow contract can be used by a multitude of platforms and applications, where the smart contract gives all the basic functionality for a crypto escrow.

**escrow contract factory**

the smart contract built on solidity can be launched on both the Ehtereum network as well as the QTUM netowrk. Once launched the EscrowService contract acts as a contract factory for any platform or application which has a need for a crypto escrow. Only the two parties involved, the amount to be staked, and a notary need be defined for the contract. 

*Contract was built on QTUM's QMix platform and deployed and tested on the QTUM regtest network running on a docker image on my machine simulating the QTUM blockchain*

**simple yet verbose functionality**

Both parties need to pay the full deposit in order for the funds to be locked, and in order for them to get it back each party needs to acknowledge that the other party fulfilled their side of the agreement. Once both parties have done so, the funds are released. The definition of what it means to fulfill the agreement is purposfully left vague in order for the contract to work on a variety of use cases. Any further details on this can be built upon through an application layer, on the blockchain level, the ocntract only needs to know that the agreement has been reached. A notary is in place in case of a dispute, in which if there is a malicious actor, the bad actor will lose thier stake and the other player will recieve the full funds. The notary has no access to the funds but can only resolve the issue between the two players.

**Use Case**

This contract was built with the idea that it can be used for many use cases, but was inspired by a specific case:

In developing countries, international money transmission is monopolized by banks and large money transmitters such as Western Union. The lack of competition resulted in long lines, quotas, exorbitant fees and slow service.  

Kaoshi will be the first peer to peer app for international money transmission. It accomplishes money transmission as follows: User A in India wants to send money to her son in the US. She gets matched with user B in the US looking to send money to his brother in India. User A in India locally remits her money to user B’s brother in India, while User B in the US locally remits his money to user A’s son in the US. No money crosses the border, thus eliminating the need for a money transmitter. Users commit short-term collaterals to escrow wallets on the blockchain to secure against counterparty default. Additionally, small and medium sized money transmitters can also post their competitive offers as peers on the platform to provide efficiency to the platform.
