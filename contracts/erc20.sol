// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;
interface ERC20Interface {
    function totalSupply() external view returns (uint);//returns amt of tokens in existance

function balanceOf(address tokenOwner) external view returns (uint balance);//returns amount of tokens hold by account

function transfer(address to, uint tokens) external returns (bool success);//Moves amount tokens from 
//the caller’s account to to.
//Returns a boolean value indicating whether the operation succeeded.Emits a transfer event.

function allowance(address tokenOwner,address spender) external view returns (uint remaining);//Returns the remaining number of tokens that spender will be
// allowed to spend on behalf of owner through transferFrom. This is zero by default.
//This value changes when approve or transferFrom are called.

function approve(address tokenOwner,address  spender,uint tokens) external returns (bool success);

function transferFrom(address from, address to, uint tokens) external returns (bool success);
event Transfer();
event Approval();
}
contract block is  ERC20Interface{

}