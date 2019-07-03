//
//  String+STKit.swift
//  STKitSwiftDemo
//
//  Created by mac on 2019/7/2.
//  Copyright © 2019 沈兆良. All rights reserved.
//

import UIKit

public extension String {
    func st_getWidth(font: UIFont, height: CGFloat = 15) -> CGFloat {
        let rect = NSString(string: self).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.width)
    }
    
}
