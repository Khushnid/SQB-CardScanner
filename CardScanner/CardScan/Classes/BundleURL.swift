import UIKit

public struct BundleURL {
    // If you change the bundle name make sure to set these before
    // initializing the library
    public static var bundleName = "JOYDA"
    public static var extensionName = "bundle"
    public static var cardScanBundle = Bundle(identifier: "com.uzpsb.olam")
    
    // Public for testing
    public static func bundle() -> Bundle? {
        if cardScanBundle != nil {
            return cardScanBundle
        }
        
        guard let bundleUrl = Bundle(for: ScanViewController.self).url(forResource: bundleName, withExtension: extensionName) else {
            return nil
        }
            
        guard let bundle = Bundle(url: bundleUrl) else {
            return nil
        }
        
        return bundle
    }
    
    static func compiledModel(forResource: String, withExtension: String) -> URL? {
        guard let bundle = bundle() else {
            return nil
        }
        
        guard let modelcUrl = bundle.url(forResource: forResource, withExtension: withExtension) else {
//            print("Could not find named \"\(forResource).\(withExtension)\"")
            return nil
        }
        
        return modelcUrl
    }
}
