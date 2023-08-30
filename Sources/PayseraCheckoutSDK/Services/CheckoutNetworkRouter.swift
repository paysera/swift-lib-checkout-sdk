import Alamofire
import Foundation

enum CheckoutNetworkRouter {
    case paymentTypes(country: String?, currency: String?, group: String?, locale: String)
    case paymentURL(request: PSCheckoutURLRequest, locale: String)
}

extension CheckoutNetworkRouter: NetworkRouter {
    var method: Alamofire.HTTPMethod {
        .get
    }
    
    var path: String {
        switch self {
        case .paymentTypes:
            return "payment-types"
        case .paymentURL(let request, _):
            return "payment-url/\(request.paymentTypeId)"
        }
    }
    
    var locale: String {
        switch self {
        case let .paymentTypes(_, _, _, locale):
            return locale
        case .paymentURL(_, let locale):
            return locale
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case let .paymentTypes(country, currency, group, _):
            var params = [String: Any]()
            params["country"] = country
            params["currency"] = currency
            params["group"] = group
            return params
        case let .paymentURL(request, _):
            return request.toJSON()
        }
    }
    
    var parameterEncoding: Alamofire.ParameterEncoding {
        URLEncoding.default
    }
}
