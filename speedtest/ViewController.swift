import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadJsonString() -> String? {
        if let path = NSBundle.mainBundle().pathForResource("convos", ofType: "json") {
            return String(contentsOfFile:path, encoding: NSUTF8StringEncoding, error: nil)
        } else {
            return nil
        }
    }
    
    @IBAction func handleSwiftATapped(sender: UIButton) {
        if let json_string = loadJsonString() {
            let store = SwiftJSONHelperUsers(string: json_string)
            println("Record count: \(store.count)")
        }
    }

    @IBAction func handleSwiftBTapped(sender: UIButton) {
        if let json_string = loadJsonString() {
            let store = SwiftUsers(string: json_string)
            println("Record count: \(store.count)")
        }
    }
    
    @IBAction func handleObjCTapped(sender: UIButton) {
        if let json_string = loadJsonString() {
            let store = ObjCUsers(json_string)
            println("Record count: \(store.count)")
        }
    }

}

