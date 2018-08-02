//
//  WeexBoxEngine.swift
//  WeexBox
//
//  Created by Mario on 2018/8/1.
//  Copyright © 2018年 Ayg. All rights reserved.
//

import Foundation
import WeexSDK

public class WeexBoxEngine {
    
    public static func initialize() {
        initWeex()
        //        Test.test()
    }
    
    private static func initWeex() {
        WXSDKEngine.initSDKEnvironment()
        WXSDKEngine.registerHandler(ImageLoader(), with: WXImgLoaderProtocol.self)
        #if DEBUG
        WXLog.setLogLevel(.all)
        #endif
    }
}
