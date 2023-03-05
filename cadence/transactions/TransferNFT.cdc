import CryptoPoops from 0x01cf0e2f2f715450
import NonFungibleToken from 0x179b6b1cb6755e31
// the eprson we're giving the NFT to
transaction(recipient: Address, id: UInt64) {

    // the giver of the NFT
    prepare(signer: AuthAccount) {
        let collection = signer.borrow<&CryptoPoops.Collection>(from: /storage/Collection)!

        let receiverReference = getAccount(recipient).getCapability(/public/Collection)
                                            .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
                                            ?? panic("This account does not have a Collection")

        let NFTIds = collection.getIDs();
        receiverReference.deposit(token: <- collection.withdraw(withdrawID: NFTIds[id]))

    }

    execute {
        log("transfer NFT")
    }
}