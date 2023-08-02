import Foundation
import ObjectMapper

public final class CheckoutPaymentURL: Mappable {
    public var paymentURL: URL!
    
    public init?(map: ObjectMapper.Map) {}
    
    public func mapping(map: ObjectMapper.Map) {
        do {
            let paymentURI: String = try map.value("payment_url", default: "")
            paymentURL = URL(string: paymentURI)
        } catch {}
    }
}
