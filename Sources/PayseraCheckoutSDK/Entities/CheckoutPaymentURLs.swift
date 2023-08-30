import Foundation
import ObjectMapper

public final class CheckoutPaymentURLs: Mappable {
    public var paymentURL: URL?
    public var acceptURL: URL?
    public var cancelURL: URL?
    
    public init?(map: ObjectMapper.Map) {}
    
    public func mapping(map: ObjectMapper.Map) {
        let paymentURI: String? = try? map.value("payment_url", default: "")
        let acceptURI: String? = try? map.value("accept_url", default: "")
        let cancelURI: String? = try? map.value("cancel_url", default: "")
        
        paymentURL = paymentURI.map(URL.init(string:)).flatMap { $0 }
        acceptURL = acceptURI.map(URL.init(string:)).flatMap { $0 }
        cancelURL = cancelURI.map(URL.init(string:)).flatMap { $0 }
    }
}
