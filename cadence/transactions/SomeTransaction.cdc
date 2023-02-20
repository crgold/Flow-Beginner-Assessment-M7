// read more about Cadence transactions here https://developers.flow.com/cadence/language/transactions
import "CryptoPoops"

transaction {
    let acc: AuthAccount

    prepare(signer: AuthAccount) {
        self.acc = signer    
    }

    pre {}

    execute {
        
    }

    post {}
}
 