import Foundation

class SwiftUser {
    var name: String?
    var handle: String?
    
    init(data: NSDictionary?) {
        if let d = data {
            name = d["name"] as? String
            handle = d["handle"] as? String
        }
    }
}

class SwiftUsers {
    private var users = [SwiftUser]()
    
    init(string: String) {
        if let raw_data = string.dataUsingEncoding(NSUTF8StringEncoding) {
            var error: NSError?
            if let raw_array = NSJSONSerialization.JSONObjectWithData(raw_data, options: NSJSONReadingOptions(0), error: &error) as? NSArray {
                for raw_user in raw_array {
                    let user = SwiftUser(data: raw_user as? NSDictionary)
                    users.append(user)
                }
            }
        }
    }
    
    var count : Int {
        get {
            return users.count
        }
    }
}
