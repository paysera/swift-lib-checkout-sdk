import PayseraCommonSDK
import PromiseKit
import Alamofire

final public class CheckoutAPIClient: PSBaseApiClient {
    public func getPaymentTypes(
        filters: PSCheckoutPaymentTypesRequestFilters = .init(),
        locale: String
    ) -> Promise<[PSCheckoutPaymentType]> {
        let request: Promise<PSCheckoutPaymentResponse> = doRequest(
            requestRouter: CheckoutNetworkRouter.paymentTypes(
                filters: filters,
                locale: locale
            )
        )
        return request.map(\.items)
    }
    
    public func getPaymentURL(
        request: PSCheckoutURLRequest,
        locale: String
    ) -> Promise<PSCheckoutPaymentURLs> {
        doRequest(
            requestRouter: CheckoutNetworkRouter.paymentURL(
                request: request,
                locale: locale
            )
        )
    }
}
