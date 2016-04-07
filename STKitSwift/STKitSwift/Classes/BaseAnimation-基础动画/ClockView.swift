//
//  ClockView.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/17.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class ClockView: UIView {
    var secondLayer = CALayer()
    var minuteLayer = CALayer()
    var hourLayer = CALayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        secondLayer.backgroundColor = UIColor.colorRandom().CGColor
        // 设置锚点
        secondLayer.anchorPoint = CGPointMake(0.5, 1)
        secondLayer.position = CGPointMake(self.frame.width/2, self.frame.width/2)
        secondLayer.bounds = CGRectMake(0, 0, 1, self.frame.width/2 - 20)

        self.layer.addSublayer(secondLayer)

        minuteLayer.backgroundColor = UIColor.colorRandom().CGColor
        // 设置锚点
        minuteLayer.anchorPoint = CGPointMake(0.5, 1)
        minuteLayer.position = CGPointMake(self.frame.width/2, self.frame.width/2)
        minuteLayer.bounds = CGRectMake(0, 0, 4, self.frame.width/2 - 20)
        minuteLayer.cornerRadius = 2

        self.layer.addSublayer(minuteLayer)

        hourLayer.backgroundColor = UIColor.colorRandom().CGColor
        // 设置锚点
        hourLayer.anchorPoint = CGPointMake(0.5, 1)
        hourLayer.position = CGPointMake(self.frame.width/2, self.frame.width/2)
        hourLayer.bounds = CGRectMake(0, 0, 4, self.frame.width/2 - 25)
        hourLayer.cornerRadius = 2

        self.layer.addSublayer(hourLayer)

    }

    override func drawRect(rect: CGRect) {
        UIColor.colorRandom().setFill()
        UIRectFill(rect)

        let image = UIImage(named: "clock")
        image?.drawInRect(rect)
    }


    func start() {
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector:#selector(ClockView.timeChange), userInfo: nil, repeats: true)
    }

    func timeChange() {
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
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



}
