import Alamofire
import Foundation

enum CheckoutNetworkRouter {
    case paymentTypes(country: String, currency: String, locale: String)
    case paymentURL(request: CheckoutURLRequest, locale: String)
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
        case .paymentTypes(_, _, let locale):
            return locale
        case .paymentURL(_, let locale):
            return locale
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .paymentTypes(let country, let currency, _):
            return [
                "country": country,
                "currency": currency
            ]
        case .paymentURL(let request, _):
            return request.toJSON()
        }
    }
    
    var parameterEncoding: Alamofire.ParameterEncoding {
        URLEncoding.default
    }
}
