// read more about Cadence transactions here https://developers.flow.com/cadence/language/transactions
import CryptoPoops from 0x01cf0e2f2f715450
import NonFungibleToken from 0x179b6b1cb6755e31

transaction(account: Address, name: String, favoriteFood: String, luckyNumber: ) {

    prepare(signer: AuthAccount) {
        let minter = signer.borrow<&CryptoPoops.Minter>(from: /storage/Minter)


        let publicReference = getAccount(account).getCapability(/public/Collection)
                                            .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
                                            ?? panic("This account does not have a collection")
  
        publicReference.deposit(token: <- minter?.createNFT(name: name, favoriteFood: favoriteFood, luckyNumber: luckyNumber)!)

    }
    execute {
        log("Stored newly minted NFT into Collection")
    }
}
 