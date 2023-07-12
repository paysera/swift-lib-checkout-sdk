import Alamofire

enum CheckoutNetworkRouter {
    case paymentTypes(country: String, currency: String)
    case paymentURL(request: CheckoutURLRequest)
}

extension CheckoutNetworkRouter: NetworkRouter {
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .paymentTypes:
            return "payment-types"
        case .paymentURL(let request):
            return "payment-url/\(request.paymentTypeId)"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .paymentTypes(let country, let currency):
            return [
                "country": country,
                "currency": currency
            ]
        case .paymentURL(let request):
            return request.asParameters()
        }
    }
    
    var parameterEncoding: Alamofire.ParameterEncoding {
        return URLEncoding.default
    }
}
