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

/// 统一的较小间隔 5
@available(iOS 9.0, *)
public let STMarginSmall: CGFloat = 5

/// 统一的间隔 10
@available(iOS 9.0, *)
public let STMargin: CGFloat = 10

/// 统一的较大间隔 16
@available(iOS 9.0, *)
public let STMarginBig: CGFloat = 16

/// 导航栏的最大的Y值 64
@available(iOS 9.0, *)
public let STNavigationBarY: CGFloat = 64

/// 控件的系统高度 44
@available(iOS 9.0, *)
public let STControlSystemHeight: CGFloat = 44

/// 控件的普通高度 36
@available(iOS 9.0, *)
public let STControlNormalHeight: CGFloat = 36

/// 状态栏高度值 20
@available(iOS 9.0, *)
public let STStatusBarHeight: CGFloat = 20