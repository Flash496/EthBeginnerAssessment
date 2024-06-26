/*
Assessment Requirements
1. Create a variable that can hold a number of NFT's. What type of variable might this be?
2. Create an object inside your mintNFT function that will hold the metadata for your NFTs. 
   The metadata values will be passed to the function as parameters. When the NFT is ready, 
   you will store it in the variable you created in step 1
3. Your listNFTs() function will print all of your NFTs metadata to the console (i.e. console.log("Name: " + someNFT.name))
4. For good measure, getTotalSupply() should return the number of NFT's you have created
*/


// create a variable to hold your NFT's
let nftArr = [];


// this function will take in some values as parameters, create an
// NFT object using the parameters passed to it for its metadata, 
// and store it in the variable above.
function mintNFT (name, eyeColour, clothes , bling)      //passes the metadata as parameters
{
  const nft = {};
  nft.name = name;
  nft.eyeColour = eyeColour;
  nft.clothes = clothes;
  nft.bling = bling;

  nftArr.push(nft);                                      // to add the Nft object to the Nft array

  console.log("minted: " + name);
}



// create a "loop" that will go through an "array" of NFT's
// and print their metadata with console.log()
function listNFTs () {
  for(let i = 0; i < nftArr.length; i++) {
    console.log("_____________________________________________"); 
    console.log("NFT ID: \t" + (i+1));
    console.log("Name: \t\t" + nftArr[i].name);
    console.log("Eye Colour:\t" + nftArr[i].eyeColour);
    console.log("clothes: \t" + nftArr[i].clothes);
    console.log("Bling: \t\t" + nftArr[i].bling);
    console.log("_____________________________________________\n");
  }

}

// print the total number of NFTs we have minted to the console
function getTotalSupply() {
  console.log("Total number of Nfts created: " + nftArr.length);
}


// call your functions below this line
mintNFT( 'dave', "red", 'shirt', 'ring');                  //passing the metadata as arguments to the function
mintNFT( 'Ben', 'green', 'black-white stripes Tshirt', 'Alien tech watch');
mintNFT( 'voldemort', 'green', 'Armani', 'The Elder Wand');

listNFTs();                                                //listing the NFTs we have minted to the console

getTotalSupply();                                          //print the total number of Nfts minted
