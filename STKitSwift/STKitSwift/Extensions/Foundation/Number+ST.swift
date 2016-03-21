
//
//  Number+ST.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/17.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import Foundation
import UIKit

/** 1.角度转弧度 */
public func angleToRadian(angle:CGFloat) -> CGFloat{
    return angle * CGFloat(M_PI) / 180.0
}

public func angleToRadian(angle:Int) -> CGFloat{
    return CGFloat(angle) * CGFloat(M_PI) / 180.0
}

public func numberRandom(number:UInt32) -> CGFloat {
    return CGFloat(arc4random_uniform(number))
}

public func numberRandom(number:CGFloat) -> CGFloat {
    return CGFloat(arc4random_uniform(UInt32(number)))
}

public func numberRandom(number:Int) -> CGFloat {
    return CGFloat(arc4random_uniform(UInt32(number)))
}