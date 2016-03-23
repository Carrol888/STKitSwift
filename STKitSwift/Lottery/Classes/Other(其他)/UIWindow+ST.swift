
//
//  UIWindow+ST.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/23.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import Foundation
import UIKit

private var sendEventExchanged : Bool = false

/** 1.Show touch on screen */
public func ShowTouchOnScreen() {
    UIApplication.sharedApplication().keyWindow?.activateTouch()
}

/** 2.Hide touch on screen */
public func HideTouchOnScreen() {
    UIApplication.sharedApplication().keyWindow?.deactivateTouch()
}

/** 3.主窗口 */
public func KeyWindow() -> UIWindow {
    return UIApplication.sharedApplication().keyWindow!
}

public extension UIWindow {
    /** 1.show touch on screen */
    private func activateTouch() {
        if sendEventExchanged {
            return
        }

        let sendEvent = class_getInstanceMethod(object_getClass(self), "sendEvent:")
        let exchangedSendEvent = class_getInstanceMethod(object_getClass(self), "exchangedSendEvent:")
        method_exchangeImplementations(sendEvent, exchangedSendEvent)

        sendEventExchanged = true
    }

    private func deactivateTouch() {
        if !sendEventExchanged {
            return
        }

        let sendEvent = class_getInstanceMethod(object_getClass(self), "sendEvent:")
        let exchangedSendEvent = class_getInstanceMethod(object_getClass(self), "exchangedSendEvent:")
        method_exchangeImplementations(sendEvent, exchangedSendEvent)

        sendEventExchanged = false
    }
}