// read more about Cadence transactions here https://developers.flow.com/cadence/language/transactions
import CryptoPoops from 0x01cf0e2f2f715450
import NonFungibleToken from 0x179b6b1cb6755e31

transaction {

    prepare(signer: AuthAccount) {

        signer.save(<- CryptoPoops.createEmptyCollection(), to: /storage/Collection) 
        signer.link<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>(/public/Collection, target: /storage/Collection) 
    }


    execute {
        log("Stored a Collection for our CryptoPoops")
    }
}
 