import Foundation

public struct PSCheckoutURLRequest {
    public let paymentTypeId: String
    public let amount: String
    public let currency: String
    public let account: String
    public let email: String
    
    public init(
        paymentTypeId: String,
        amount: String,
        currency: String,
        account: String,
        email: String
    ) {
        self.paymentTypeId = paymentTypeId
        self.amount = amount
        self.currency = currency
        self.account = account
        self.email = email
    }
}

extension PSCheckoutURLRequest {
    func toJSON() -> [String: Any] {
        [
            "amount": amount,
            "currency": currency,
            "account": account,
            "email": email
        ]
    }
}
