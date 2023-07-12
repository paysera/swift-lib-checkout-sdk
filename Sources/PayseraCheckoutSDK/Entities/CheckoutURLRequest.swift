import Foundation
import Alamofire

public struct CheckoutURLRequest {
    let paymentTypeId: String
    let amount: String
    let currency: String
    let account: String
    let email: String
    let lang: String
}

extension CheckoutURLRequest {
    func asParameters() -> Parameters? {
        return [
            "amount": amount,
            "currency": currency,
            "account": account,
            "email": email,
            "lang": lang
        ]
    }
}

