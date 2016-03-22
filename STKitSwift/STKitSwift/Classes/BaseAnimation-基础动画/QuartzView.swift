//
//  QuartzView.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/17.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit



class QuartzView: UIView {

    override func drawRect(rect: CGRect) {
        // Quartz2D的原点是左下角，UIKit的原点是左上角
//        let path = NSBundle.mainBundle().pathForResource("icon0", ofType: "jpg")
//        let image = UIImage(contentsOfFile: path!)
        let image = UIImage(named: "icon0")
        let imageCG = image?.CGImage
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)


        // 变换的顺序不同，效果不同
        // 平移变换
        CGContextTranslateCTM(context, 0, (image?.size.height)! + 0)
        // 转换坐标 使用X轴变换(1,-1), Y轴变换(-1,1), 原点变换(-1,-1)
        CGContextScaleCTM(context, 1, -1)

        // 缩放变换
//        CGContextScaleCTM(context, 0.5, 0.5)

        // 旋转变换
        CGContextRotateCTM(context, CGFloat(-45 * M_PI / 180.0))


        let touchRect = CGRectMake(0, 0, (image?.size.width)!, (image?.size.height)!)
        CGContextDrawImage(context, touchRect, imageCG)
        CGContextRestoreGState(context)
    }
}
