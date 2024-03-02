<h1>E-commerce smart contract</h1>
<h2>Author : Samarth Deshpande</h2>
The contract contains 4 major functions:
💡 Register product : For the seller to register the product ,it's name and price.
💡 Buy product : For the buyer to buy the product by paying a specific amount of ether to the contract.
💡 Delivery : The buyer confirms the delivery of the product and the ether will be transferred from the contract to the seller's wallet.
💡 Destroy function : If in case if the contract gets hacked , the manager of the contract can call a self destruct function which destroys the contract. Further purchases will not occur and NO ether will be lost.
The contract also contains 3 events:
⚫ Register
⚫ bought
⚫delivered
Which are emitted in the respective functions.
