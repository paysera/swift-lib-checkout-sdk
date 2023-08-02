import Foundation
import ObjectMapper

public final class CheckoutPaymentURL: Mappable {
    public var paymentURL: URL?
    
    public init?(map: ObjectMapper.Map) {}
    
    public func mapping(map: ObjectMapper.Map) {
        let paymentURI: String? = try? map.value("payment_url", default: "")
        paymentURL = paymentURI.map(URL.init(string:)).flatMap { $0 }
    }
}
