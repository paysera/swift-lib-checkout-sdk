import Alamofire
import Foundation

enum CheckoutNetworkRouter {
    case paymentTypes(filters: PSCheckoutPaymentTypesRequestFilters, locale: String)
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
        case let .paymentTypes(_, locale):
            return locale
        case .paymentURL(_, let locale):
            return locale
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case let .paymentTypes(filters, _):
            return filters.toJSON()
        case let .paymentURL(request, _):
            return request.toJSON()
        }
    }
    
    var parameterEncoding: Alamofire.ParameterEncoding {
        URLEncoding.default
    }
}
