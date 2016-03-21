//
//  ClockCAView.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/21.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class ClockCAView: UIView {

    var secondLayer : CALayer!
    var minuteLayer : CALayer!
    var hourLayer : CALayer!



    override init(frame: CGRect) {
        super.init(frame: frame)
        secondLayer = CALayer(
            color: UIColor.colorRandom(),
            anchorPoint: CGPointMake(0.5, 1),
            position: CGPointMake(self.frame.width/2, self.frame.width/2),
            bounds: CGRectMake(0, 0, 1, self.frame.width/2 - 20),
            cornerRadius: 0)

        self.layer.addSublayer(secondLayer)

        minuteLayer = CALayer(
            color: UIColor.colorRandom(),
            anchorPoint: CGPointMake(0.5, 1),
            position: CGPointMake(self.frame.width/2, self.frame.width/2),
            bounds: CGRectMake(0, 0, 4, self.frame.width/2 - 20),
            cornerRadius: 4)

        self.layer.addSublayer(minuteLayer)

        hourLayer = CALayer(
            color: UIColor.colorRandom(),
            anchorPoint: CGPointMake(0.5, 1),
            position: CGPointMake(self.frame.width/2, self.frame.width/2),
            bounds: CGRectMake(0, 0, 4, self.frame.width/2 - 25),
            cornerRadius: 4)

        self.layer.addSublayer(hourLayer)

    }

    override func drawRect(rect: CGRect) {
        UIColor.colorRandom().setFill()
        UIRectFill(rect)

        let image = UIImage(named: "time")
        image?.drawInRect(rect)
    }

    func start() {
        // 获取当前的系统的时间
        // 获取当前日历对象
        let calendar = NSCalendar.currentCalendar()
        // 获取日期的组件：年月日小时分秒
        // components:需要获取的日期组件
        // fromDate：获取哪个日期的组件
        let components = calendar.components([.Second, .Minute, .Hour], fromDate: NSDate())
        // 获取秒
        let second = components.second
        // 获取分
        let minute = components.minute
        // 获取时
        let hour = components.hour
        // 计算秒针转多少度
        let secondA = second * 6
        // 计算分针转多少度
        let minuteA = minute * 6
        // 计算时针转多少度
        let hourA : CGFloat = CGFloat(hour) * 30 + CGFloat(minute) * 0.5

        // 旋转秒时
        secondLayer.transform = CATransform3DMakeRotation(angleToRadian(secondA), 0, 0, 1)
        // 旋转分时
        minuteLayer.transform = CATransform3DMakeRotation(angleToRadian(minuteA), 0, 0, 1)
        // 旋转小时
        hourLayer.transform = CATransform3DMakeRotation(angleToRadian(hourA), 0, 0, 1)


        // 旋转秒时的动画
        let secondNuber = Float(angleToRadian(secondA))

        let animationSecond = CABasicAnimation(keyPath: "transform.rotation.z",
            repeatCount: HUGE,
            duration: 60,
            removedOnCompletion: false,
            timingFunction: CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),
            fromValue: NSNumber(float: secondNuber),
            byValue:  NSNumber(double: 2*M_PI))
        secondLayer.addAnimation(animationSecond, forKey: nil)

        // 旋转分时的动画
        let minuteNuber = Float(angleToRadian(minuteA))

        let animationMinute = CABasicAnimation(keyPath: "transform.rotation.z",
            repeatCount: HUGE,
            duration: 60 * 60,
            removedOnCompletion: false,
            timingFunction: CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),
            fromValue: NSNumber(float: minuteNuber),
            byValue:  NSNumber(double: 2*M_PI))
        minuteLayer.addAnimation(animationMinute, forKey: nil)

        // 旋转小时的动画
        let hourNuber = Float(angleToRadian(hourA))

        let animationHour = CABasicAnimation(keyPath: "transform.rotation.z",
            repeatCount: HUGE,
            duration: 60 * 60 * 12,
            removedOnCompletion: false,
            timingFunction: CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),
            fromValue: NSNumber(float: hourNuber),
            byValue:  NSNumber(double: 2*M_PI))
        hourLayer.addAnimation(animationHour, forKey: nil)


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
