import Foundation
import ObjectMapper

public final class CheckoutPaymentURL: Mappable {
    public var paymentURL: URL!
    
    public init?(map: ObjectMapper.Map) { }
    
    public func mapping(map: ObjectMapper.Map) {
        paymentURL <- map["payment_url"]
    }
}


