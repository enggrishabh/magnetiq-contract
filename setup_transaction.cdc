import NonFungibleToken from 0x631e88ae7f1d7c20
import Magnetiq from 0x8c55fba7d7090fee
// This transaction sets up an account to use Magnetiq
// by storing an empty moment collection and creating
// a public capability for it
transaction {
    prepare(acct: auth(Storage) &Account) {
        // First, check to see if a moment collection already exists
        if acct.storage.borrow<&Magnetiq.Collection>(from: /storage/MagnetiqTokensCollection) == nil {
            // create a new Magnetiq Collection
            let collection <- Magnetiq.createEmptyCollection(nftType: Type<@Magnetiq.NFT>())
            // Put the new Collection in storage
            acct.storage.save(<-collection, to: /storage/MagnetiqTokensCollection)
        }
    }
}