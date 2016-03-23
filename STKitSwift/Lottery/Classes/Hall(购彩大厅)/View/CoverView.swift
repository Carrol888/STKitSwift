//
//  CoverView.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/23.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class CoverView: UIView {

    class func show() {
        let cover = CoverView(frame: SCREENBOUNDS)
        cover.backgroundColor = UIColor.blackColor()
        cover.alpha = 0.5
        KeyWindow().addSubview(cover)
    }

    class func hide() {
        for childView in KeyWindow().subviews {
            if childView.isKindOfClass(self) {
                childView.removeFromSuperview()
            }
        }

    }
}
