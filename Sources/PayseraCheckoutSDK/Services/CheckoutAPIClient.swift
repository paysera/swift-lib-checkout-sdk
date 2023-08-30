import PayseraCommonSDK
import PromiseKit
import Alamofire

final public class CheckoutAPIClient: PSBaseApiClient {
    public func getPaymentTypes(
        country: String? = nil,
        currency: String? = nil,
        group: String? = nil,
        locale: String
    ) -> Promise<[PSCheckoutPaymentType]> {
        let request: Promise<PSCheckoutPaymentResponse> = doRequest(
            requestRouter: CheckoutNetworkRouter.paymentTypes(
                country: country,
                currency: currency,
                group: group,
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
