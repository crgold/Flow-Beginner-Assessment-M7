import CryptoPoops from 0x01cf0e2f2f715450
import NonFungibleToken from 0x179b6b1cb6755e31

pub fun main(account: Address, id: UInt64) {
    let publicReference = getAccount(account).getCapability(/public/Collection)
                                            .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
                                            ?? panic("This account does not have a collection")

  let NFTIds = publicReference.getIDs()
  log(publicReference.borrowAuthNFT(id: NFTIds[id]))
}
 