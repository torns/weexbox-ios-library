//
//  ScanWeex.swift
//  WeexBox
//
//  Created by Mario on 2018/11/5.
//  Copyright © 2018 Ayg. All rights reserved.
//

import Foundation
import WXDevtool

struct DebugWeex {
    
    static func openScan() {
        let topViewController = UIApplication.topViewController()
        let scannerViewController = WBScannerViewController()
        scannerViewController.scanResultBlock = { (scanResult, error) in
            scannerViewController.navigationController?.popViewController(animated: false)
            if error != nil {
                Log.e(error!)
            } else {
                openUrl(scanResult.strScanned!, top: topViewController)
            }
        }
        topViewController?.navigationController?.pushViewController(scannerViewController, animated: true)
    }
    
    static func openUrl(_ urlString: String, top: UIViewController?) {
        // 处理windows上的dev路径带有"\\"
        let params = urlString.replacingOccurrences(of: "\\", with: "/").getParameters()
        if let devtoolUrl = params["_wx_devtool"] {
            // 连服务
            WXDevTool.launchDebug(withUrl: devtoolUrl)
        } else if let tplUrl = params["_wx_tpl"] {
            // 连页面
            var router = Router()
            router.name = Router.weex
            router.url = tplUrl
            router.open(from: top as! WBBaseViewController)
        }
    }
    
    static func refresh() {
        let topViewController = UIApplication.topViewController()
        if let weexViewController = topViewController as? WBWeexViewController {
            weexViewController.refreshWeex()
        }
    }
}