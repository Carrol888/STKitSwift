//
//  UIBarButtonItem+ST.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/15.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import Foundation
import UIKit

public extension UIBarButtonItem {
    /** 1.初始化图片*/
    public convenience init(image: UIImage?, target: AnyObject?, action: Selector) {
        let image = image?.imageWithRenderingMode(.AlwaysOriginal)
        self.init(image: image, style:.Done, target: target, action: action)
    }


    public convenience init(barButtonSpaceType space: UIBarButtonSystemItem, width: CGFloat = 0.0) {
        if space == .FixedSpace || space == .FlexibleSpace {
            self.init(barButtonSystemItem: space, target: nil, action: nil)
            if space == .FixedSpace {
                self.width = width
            }
        } else {
            self.init(barButtonSystemItem:.FlexibleSpace, target: nil, action: nil)
        }
    }

    // TODO:使用runtime修改字体的颜色
    public convenience init(title: String, target: AnyObject?, action: Selector) {
        self.init(title:title, style:.Done, target: target, action: action)
    }
}