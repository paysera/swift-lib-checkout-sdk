import PayseraCommonSDK
import PromiseKit
import Alamofire

final public class CheckoutAPIClient: PSBaseApiClient {
    public func getPaymentTypes(
        country: String,
        currency: String
    ) -> Promise<[CheckoutPaymentType]> {
        let request: Promise<CheckoutPaymentResponse> = doRequest(
            requestRouter: CheckoutNetworkRouter.paymentTypes(
                country: country,
                currency: currency
            )
        )
        return request.map(\.items)
    }
    
    public func getPaymentURL(request: CheckoutURLRequest) -> Promise<CheckoutPaymentURL> {
        doRequest(
            requestRouter: CheckoutNetworkRouter.paymentURL(
                request: request
            )
        )
    }
}
