import Foundation
//import Alamofire
import ObjectMapper

public struct CheckoutURLRequest: Mappable {
    public var paymentTypeId: String
    public var amount: String
    public var currency: String
    public var account: String
    public var email: String
    public var lang: String
    
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
    
    public init?(map: ObjectMapper.Map) {
        do {
            paymentTypeId = ""
            amount = try map.value("amount")
            currency = try map.value("currency")
            account = try map.value("account")
            email = try map.value("email")
            lang = try map.value("lang")
        } catch {
            return nil
        }
    }
    
    public mutating func mapping(map: ObjectMapper.Map) {
        amount   <- map["amount"]
        currency <- map["currency"]
        account  <- map["account"]
        email    <- map["email"]
        lang     <- map["lang"]
    }
}
