import Foundation
import Alamofire

public struct CheckoutURLRequest {
    public let paymentTypeId: String
    public let amount: String
    public let currency: String
    public let account: String
    public let email: String
    public let lang: String

    public init(
        paymentTypeId: String,
        amount: String,
        currency: String,
        account: String,
        email: String,
        lang: String
    ) {
        self.paymentTypeId = paymentTypeId
        self.amount = amount
        self.currency = currency
        self.account = account
        self.email = email
        self.lang = lang
    }
}

extension CheckoutURLRequest {
    func asParameters() -> Parameters? {
        [
            "amount": amount,
            "currency": currency,
            "account": account,
            "email": email,
            "lang": lang
        ]
    }
}

