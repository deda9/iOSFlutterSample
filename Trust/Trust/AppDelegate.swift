//
//  AppDelegate.swift
//  Trust
//
//  Created by Bassem Qoulta on 12/11/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GeneratedPluginRegistrant.register(with: self);
        return true
    }
}
