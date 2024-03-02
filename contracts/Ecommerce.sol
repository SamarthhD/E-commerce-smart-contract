// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;
contract ecom{
    struct product{
    string name;   
    uint price;
    string description;
    uint productId;
    address payable seller;
    address buyer;
    bool delivery;
    }
    uint counter = 1;
    product[] public products;//array of product type to register proudcts
      bool public destroyed= false;
        modifier isNotDestroyed {
            require(!destroyed,"Contract doesn't exist");
            _;
        }
    address payable public manager;
    constructor(){
        manager=payable(msg.sender); 
    }
      

        event registered(string name,uint proudctId,uint price,address seller);
        event bought(uint productId,address buyer);
        event delivered(uint productId);


        function registerProduct (string memory _name,string memory _desc , uint _price) public  isNotDestroyed {
        require(_price > 0,"Price should be greater than zero");
        product memory temp; //temporary variable of product type
        temp.name =_name; //adding all info
        temp.description=_desc;
        temp.price=_price * 10**18;//converting price from eth to gwei
        temp.seller=payable (msg.sender);//paying eth to seller
        temp.productId=counter;
        products.push(temp);//pushing the whole info structure in the products array
        counter++;
        emit registered(temp.name, temp.productId,temp.price, msg.sender);


    }

function buy(uint _id) public  payable  isNotDestroyed {
require(products[_id-1].price==msg.value,"Pay the exact price"); //_id-1 
require(products[_id-1].seller != msg.sender,"Seller cannot buy the product");
products[_id-1].buyer = msg.sender;
emit bought(_id, msg.sender);
}
function deliver(uint _id) public  isNotDestroyed{
    require(products[_id-1].buyer == msg.sender,"Only buyer can confirm"); 
    products[_id-1].delivery=true;
    products[_id-1].seller.transfer(products[_id-1].price);
    emit delivered(_id);
} 

//function destroy() public{
  //  require(msg.sender == manager,"Only manager can call ");
    //selfdestruct(manager);
//}
function destroy() public  isNotDestroyed{
    require(msg.sender == manager,"Only manager can call ");
    manager.transfer(address(this).balance);
    destroyed=true;
}

fallback() external payable {
    payable(msg.sender).transfer(msg.value);
    
 }
}