import Foundation
import Alamofire
import PayseraCommonSDK

protocol NetworkRouter: URLRequestConvertible {
    var baseURL: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var parameterEncoding: ParameterEncoding { get }
}

extension NetworkRouter {
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        return try parameterEncoding.encode(urlRequest, with: parameters)
    }
}

extension NetworkRouter {
    var baseURL: URL {
        URL(string: "https://mobile-checkout-integration.paysera.com/rest/v1")!
    }
}
