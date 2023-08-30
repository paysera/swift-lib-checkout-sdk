import Foundation

/*
 country: String? = nil,
 currency: String? = nil,
 group: String? = nil,
 */
public struct PSCheckoutPaymentTypesRequestFilters {
    public let country: String?
    public let currency: String?
    public let group: String?
    
    public init(
        country: String? = nil,
        currency: String? = nil,
        group: String? = nil
    ) {
        self.country = country
        self.currency = currency
        self.group = group
    }
}

extension PSCheckoutPaymentTypesRequestFilters {
    func toJSON() -> [String: Any] {
        var params = [String: Any]()
        params["country"] = country
        params["currency"] = currency
        params["group"] = group
        return params
    }
}
