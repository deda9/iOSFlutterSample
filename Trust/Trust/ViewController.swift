//
//  ViewController.swift
//  Trust
//
//  Created by Bassem Qoulta on 12/11/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    
    let flutterViewController = FlutterViewController()
    
    @IBAction func openFlutterApp(_ sender: Any) {
        self.present(flutterViewController, animated: false, completion: nil)
        
        //THIS When you run from existing project
        listenToSendMessageToFlutter()
        listenReceiveMessageFromFlutter()
    }
    
    private func listenToSendMessageToFlutter() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        guard let presentedViewController = window.rootViewController?.presentedViewController,
            presentedViewController is FlutterViewController else {
                return
        }
        
        let channel = FlutterMethodChannel(name: "flutter.receiveMessage",
                                                  binaryMessenger: presentedViewController as! FlutterBinaryMessenger)
        channel.setMethodCallHandler { call, resultCallback in
            if call.method == "callNativeFunction" {
                print("Sending message from native to Flutter")
                resultCallback("message is comming from Native")
            }
        }
    }
    
    private func listenReceiveMessageFromFlutter() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        guard let presentedViewController = window.rootViewController?.presentedViewController,
            presentedViewController is FlutterViewController else {
                return
        }
        
        let channel = FlutterBasicMessageChannel(name: "flutter.sendMessage",
                                                 binaryMessenger: presentedViewController as! FlutterBinaryMessenger,
                                                 codec: FlutterStringCodec.sharedInstance())
        
        channel.setMessageHandler { (result, replyCallback) in
            print("result from Flutter: ", result as? String ?? "Empty")
        }
    }
}

