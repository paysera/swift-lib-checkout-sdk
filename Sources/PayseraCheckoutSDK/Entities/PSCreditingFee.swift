import Foundation
import ObjectMapper
import PayseraCommonSDK

public final class PSCredittingFee: Mappable {
    public var type: String!
    public var percentage: String!
    public var minimumAmount: PSMoney?
    public var maximumAmount: PSMoney?
    
    public init?(map: ObjectMapper.Map) {}
    
    public func mapping(map: ObjectMapper.Map) {
        type          <- map["type"]
        percentage    <- map["percentage"]
        minimumAmount <- map["minimum_amount"]
        maximumAmount <- map["maximum_amount"]
    }
}
