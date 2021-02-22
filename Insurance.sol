pragma solidity >=0.6.0 <0.8.1;

/**
 * @title Tech Insurance tor
 * @dev complete the functions
 */
contract TechInsurance {
    
    /** 
     * Define two structs
     * 
     * 
     */
    struct Product {
        uint productId;
        string productName;
        uint price;
        bool offered;
    }
     
    struct Client {
        bool isValid;
        uint time;
    }
    
    
    mapping(uint => Product) public productIndex;
    mapping(address => mapping(uint => Client)) public client;
    
    uint productCounter;
    
    address payable insOwner;
    constructor(address payable _insOwner) public{
        insOwner = _insOwner;
    }
 
    function addProduct(uint _productId, string memory _productName, uint _price ) public {
        Product memory newproduct = Product (_productId , _productName , _price ,false, msg.sender);
        insOwner[msg.sender] = newproduct;
        productId[productCounter] = newproduct;
    }
    
    
    function changeFalse(uint _productIndex) public {
               require (msg.value == productIndex[_productIndex]).changeFalse[_offered];   
    }
    function changeTrue(uint _productIndex) public {
        require (msg.value == productIndex[_productIndex]).changeTrue[_offered];   
    }
    
    function changePrice(uint _productIndex, uint _price) public {
       require (msg.value == productIndex[_productIndex]).changePrice[_price];

    }
    
    function clientSelect(uint _productIndex) public payable {
        if( isValid == true ){
            return _productIndex;
        }
    } 
    
}
