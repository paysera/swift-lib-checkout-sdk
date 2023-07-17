import Foundation
import ObjectMapper
import PayseraCommonSDK

public final class CheckoutPaymentType: Mappable {
    public var name: String!
    public var key: String!
    public var countries: [String]!
    public var currencies: [String]!
    public var minTransferAmount: PSMoney!
    public var maxTransferAmount: PSMoney!
    
    public init?(map: ObjectMapper.Map) {}
    
    public func mapping(map: ObjectMapper.Map) {
        name              <- map["name"]
        key               <- map["key"]
        countries         <- map["countries"]
        currencies        <- map["currencies"]
        minTransferAmount <- map["min_transfer_amount"]
        maxTransferAmount <- map["max_transfer_amount"]
    }
}

final class CheckoutPaymentResponse: Mappable {
    var items: [CheckoutPaymentType]!
    
    init?(map: ObjectMapper.Map) {}
    
    func mapping(map: ObjectMapper.Map) {
        items <- map["items"]
    }
}
