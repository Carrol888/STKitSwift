
//
//  CALayer+ST.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/21.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import Foundation
import UIKit

public extension CALayer {
    public convenience init(color:UIColor, anchorPoint:CGPoint = CGPointZero, position:CGPoint = CGPointZero, bounds:CGRect = CGRectZero, cornerRadius:CGFloat = 0) {
        self.init()
        self.backgroundColor = color.CGColor
        self.anchorPoint = anchorPoint
        self.position = position
        self.bounds = bounds
        self.cornerRadius = cornerRadius
    }
}
