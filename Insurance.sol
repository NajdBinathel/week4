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
    constructor(address payable _insOwner) public ERC721("Elite", "code"){
      insOwner = _insOwner;
    }
 
    function addProduct(uint _productId, string memory _productName, uint _price ) public {
        Product memory newproduct = Product (_productId , _productName , _price ,false, msg.sender);
        insOwner[msg.sender] = newproduct;
        productId[productCounter++] = newproduct;
    }
    
    
    function changeFalse(uint _productIndex) public {
               require(msg.sender == insOwner, "sorry");
        return productIndex[_productIndex].offered == false;   
    }
    function changeTrue(uint _productIndex) public {
           require(msg.sender == insOwner, "Approve ");
        return productIndex[_productIndex].offered ==true;  
    }
    
    function changePrice(uint _productIndex, uint _price) public {
      require(productIndex[_productIndex].price >= 1, "eror not valid" );
        productIndex[_productIndex].price== _price;

    }
    
    function clientSelect(uint _productIndex) public payable {
        require(productIndex[_productIndex].price == msg.value, "eror" );
        require( productIndex[_productIndex].price == 0, "eroor number index");
        
        Client memory newClient;
        newClient.isValid = true;
        newClient.time = block.number;
        client[msg.sender][_productIndex] = newClient;
        insOwner.transfer(msg.value);
        }
    } 
     function setPriceByOwner (uint _price) public {
        uint price = _price;
        require(insOwner == msg.sender, "eror, just the owner can set");
    }
    
}
