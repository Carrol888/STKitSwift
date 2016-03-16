
//
//  NSString+ST.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/15.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import Foundation
import UIKit

public func stringFromClass(cls: AnyClass)->String?{
    let string = NSStringFromClass(cls.self).componentsSeparatedByString(".").last
    return string
}