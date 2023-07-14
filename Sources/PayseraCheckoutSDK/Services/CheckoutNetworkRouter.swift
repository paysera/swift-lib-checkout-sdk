import Alamofire
import ObjectMapper

enum CheckoutNetworkRouter {
    case paymentTypes(country: String, currency: String)
    case paymentURL(request: CheckoutURLRequest)
}

extension CheckoutNetworkRouter: NetworkRouter {
    var method: Alamofire.HTTPMethod {
        .get
    }
    
    var path: String {
        switch self {
        case .paymentTypes:
            return "payment-types"
        case .paymentURL(let request):
            return "payment-url/\(request.paymentTypeId)"
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .paymentTypes(let country, let currency):
            return [
                "country": country,
                "currency": currency
            ]
        case .paymentURL(let request):
            return request.toJSON()
        }
    }
    
    var parameterEncoding: Alamofire.ParameterEncoding {
        URLEncoding.default
    }
}
