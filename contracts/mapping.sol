// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract map{ //normal mapping
/*mapping (uint=>string) public  data;
function setter(uint _roll,string memory _name) public {
    data[_roll]= _name;


}
function getter(uint _roll) public view  returns (string memory){

    return data[_roll];
}

Mapping with struct
struct Student{
    string name;
    bool pass;

}
mapping(uint=>Student) public data;
function getdata(uint _roll,string memory _name,bool _pass) public {
data[_roll]=Student(_name,_pass);
}
function setdata(uint _roll) public view returns (Student memory){
    return data[_roll];
}
*/
//nested mapping
mapping (uint=> mapping (string=>bool)) public data;
function getdata(uint index,string memory name,bool pass) public {
data[index][name]=pass;
}
function setdata(uint index,string memory name) public view returns (bool){
return data[index][name];
}


}
