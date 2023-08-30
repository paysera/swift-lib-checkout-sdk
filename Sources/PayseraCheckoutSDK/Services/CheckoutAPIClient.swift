import PayseraCommonSDK
import PromiseKit
import Alamofire

final public class CheckoutAPIClient: PSBaseApiClient {
    public func getPaymentTypes(
        country: String,
        currency: String,
        locale: String
    ) -> Promise<[CheckoutPaymentType]> {
        let request: Promise<CheckoutPaymentResponse> = doRequest(
            requestRouter: CheckoutNetworkRouter.paymentTypes(
                country: country,
                currency: currency,
                locale: locale
            )
        )
        return request.map(\.items)
    }
    
    public func getPaymentURL(
        request: CheckoutURLRequest,
        locale: String
    ) -> Promise<CheckoutPaymentURLs> {
        doRequest(
            requestRouter: CheckoutNetworkRouter.paymentURL(
                request: request,
                locale: locale
            )
        )
    }
}
