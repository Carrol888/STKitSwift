
//
//  UIBezierPath+ST.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/22.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import Foundation

import UIKit

/** 1.根据两个圆绘制粘性效果的路径 */
public func pathCircleView(smallCircle circleView0:UIView, bigCircle circleView1:UIView) -> UIBezierPath {

    let center0 = circleView0.center
    let x0 = center0.x
    let y0 = center0.y
    let r0 = circleView0.bounds.width/2

    let center1 = circleView1.center
    let x1 = center1.x
    let y1 = center1.y
    let r1 = circleView1.bounds.width/2

    // 获取圆心距离
    let distance = distanceFromTwoPoint(center0, point1: center1)
    let sinθ = (x1 - x0) / distance
    let cosθ = (y1 - y0) / distance

    // 坐标系基于父控件
    let pointA = CGPointMake(x0 - r0 * cosθ , y0 + r0 * sinθ)
    let pointB = CGPointMake(x0 + r0 * cosθ , y0 - r0 * sinθ)
    let pointC = CGPointMake(x1 + r1 * cosθ , y1 - r1 * sinθ)
    let pointD = CGPointMake(x1 - r1 * cosθ , y1 + r1 * sinθ)

    let pointO = CGPointMake(pointA.x + distance * sinθ / 2 , pointA.y + distance * cosθ / 2 )
    let pointP = CGPointMake(pointB.x + distance / 2 * sinθ , pointB.y + distance / 2 * cosθ)

    let path = UIBezierPath()
    // A
    path.moveToPoint(pointA)
    // AB
    path.addLineToPoint(pointB)
    // 绘制BC曲线
    path.addQuadCurveToPoint(pointC, controlPoint: pointP)
    // CD
    path.addLineToPoint(pointD)
    // 绘制DA曲线
    path.addQuadCurveToPoint(pointA, controlPoint: pointO)
    return path
}
