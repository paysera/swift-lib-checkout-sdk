import PayseraCommonSDK
import Alamofire

public struct CheckoutAPIClientFactory {
    public static func createCheckoutAPIClient(
        credentials: PSApiJWTCredentials,
        tokenRefresher: PSTokenRefresherProtocol? = nil,
        logger: PSLoggerProtocol? = nil
    ) -> CheckoutAPIClient {
        let interceptor = PSRequestAdapter(credentials: credentials)
        let session = Session(interceptor: interceptor)
    
        return CheckoutAPIClient(
            session: session,
            credentials: credentials,
            tokenRefresher: tokenRefresher,
            logger: logger
        )
    }
}
