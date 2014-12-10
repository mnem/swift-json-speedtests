import Foundation

class SwiftJSONHelperUser : Deserializable {
    var name: String?
    var handle: String?
    
    required init(data: [String: AnyObject]) {
        name <<< data["name"]
        handle <<< data["handle"]
    }
}

class SwiftJSONHelperUsers {
    private var users = [SwiftJSONHelperUser]()
    
    init(string: String) {
        users <<<<* string
    }
    
    var count : Int {
        get {
            return users.count
        }
    }
}
