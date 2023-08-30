import XCTest
import JWTDecode
import PayseraCommonSDK
@testable import PayseraCheckoutSDK

final class PayseraCheckoutSDKTests: XCTestCase {
    private lazy var checkoutAPIClient: CheckoutAPIClient = {
        let token = "insert_me"
        let credentials = PSApiJWTCredentials()
        credentials.token = try! decode(jwt: token)
        return CheckoutAPIClientFactory.createCheckoutAPIClient(credentials: credentials)
    }()
    
    func testGetPaymentTypes() throws {
        executeNonNil(
            checkoutAPIClient.getPaymentTypes(
                country: "Lithuania",
                currency: "EUR",
                locale: "en"
            ),
            description: "Should return payment types"
        )
    }
    
    func testGetPaymentURL() throws {
        executeNonNil(
            checkoutAPIClient.getPaymentURL(
                request: PSCheckoutURLRequest(
                    paymentTypeId: "",
                    amount: "100.0",
                    currency: "EUR",
                    account: "",
                    email: "test@pauysera.com"
                ),
                locale: "en"
            ),
            description: "Should return payment url"
        )
    }
}
