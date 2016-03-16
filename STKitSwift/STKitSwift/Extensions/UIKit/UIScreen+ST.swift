//
//  UIScreen+ST.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/8.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import Foundation
import UIKit

/// 屏幕的宽度
public var SCREENWIDTH : CGFloat {
    get {
        return CGRectGetWidth(UIScreen.mainScreen().bounds)
    }
}
/// 屏幕的高度
public var SCREENHEIGHT : CGFloat {
    get {
        return CGRectGetHeight(UIScreen.mainScreen().bounds)
    }
}
