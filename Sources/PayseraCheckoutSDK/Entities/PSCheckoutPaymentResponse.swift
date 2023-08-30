import Foundation
import ObjectMapper
import PayseraCommonSDK

public final class PSCheckoutPaymentType: Mappable {
    public var name: String!
    public var key: String!
    public var group: String!
    public var groupDescription: String!
    public var countries: [String]!
    public var currencies: [String]!
    public var minTransferAmount: PSMoney?
    public var maxTransferAmount: PSMoney?
    public var logoUrl: String!
    public var creditingFee: PSCredittingFee?
    public var creditingTime: String?
    public var supportedCards: [String]?
    
    public init?(map: ObjectMapper.Map) {}
    
    public func mapping(map: ObjectMapper.Map) {
        name              <- map["name"]
        key               <- map["key"]
        group             <- map["group"]
        groupDescription  <- map["group_description"]
        countries         <- map["countries"]
        currencies        <- map["currencies"]
        minTransferAmount <- map["min_transfer_amount"]
        maxTransferAmount <- map["max_transfer_amount"]
        logoUrl           <- map["logo_url"]
        creditingFee      <- map["crediting_fee"]
        creditingTime     <- map["crediting_time"]
        supportedCards    <- map["supported_cards"]
    }
}

final class PSCheckoutPaymentResponse: Mappable {
    var items: [PSCheckoutPaymentType]!
    
    init?(map: ObjectMapper.Map) {}
    
    func mapping(map: ObjectMapper.Map) {
        items <- map["items"]
    }
}
