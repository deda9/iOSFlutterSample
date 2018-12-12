import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(_ application: UIApplication,
                              didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //THIS In case you run the project from the flutter Runner
        guard let controller = window?.rootViewController as? FlutterViewController else {
            fatalError("rootViewController is not type FlutterViewController")
        }
        let batteryChannel = FlutterMethodChannel(name: "com.yeay.womWallet",
                                                  binaryMessenger: controller)
        batteryChannel.setMethodCallHandler { re, call in
            print("result.", "sd")
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
