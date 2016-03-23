//
//  UIImage+ST.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/23.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import Foundation
import UIKit


public extension UIImage {

    /** 原图，没有渲染过 */
    public class func imageOriginal(imageName:String) -> UIImage {
        let image = UIImage(named: imageName)
        return (image?.imageWithRenderingMode(.AlwaysOriginal))!
    }

    /** 图片伸展 */
    public class func imageStretch(imageName:String) -> UIImage {
        let image = UIImage(named: imageName)
        let width : Int = Int((image?.size.width)!)
        let height : Int = Int((image?.size.height)!)
        return (image?.stretchableImageWithLeftCapWidth(width / 2 , topCapHeight: height/2))!
    }
}
