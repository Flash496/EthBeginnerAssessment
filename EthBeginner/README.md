
# My Token Contract

MyTokenContract is a simple smart contract written in Solidity. This contract creates a custom token with basic functionalities like minting and burning tokens. We can see the name of the Token, its abbreviation, the total supply of the  token, the balance of that token in a wallet.
## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., newfile.sol). Copy and paste the code in the myTokenContract and then complie it by pressing "ctrl+s".

Now on the Left hand side, click and open the 'Deploy and run tracsactions' tab. scroll and click deploy. After deploying it successfully, scroll in the left hand side tab and look for 'deployed contracts', now by tapping on the buttons u can view the token name, token abbreviation, total suppy of the tokens. Additionally, by using a sample address u can mint tokens or burn them.
## Added changes

There's two kinds of burn functions in the code. The 'burn' function uses conditionl statement (if-else) to burn the token when there is enough availability as the balance of tokens or total supply can't go in negative. when the value to be deducted is greater than the balance of the wallet, it simply does nothing and the burn operation is ignored.

In the second burn funtion 'burn2', it does the same but uses a require statement to revert the transaction if the balance is insufficient and gives an error message.
## Authors

- [@flash496](https://www.github.com/flash496)

