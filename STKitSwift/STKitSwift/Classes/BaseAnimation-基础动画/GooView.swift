//
//  GooView.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/21.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class GooView: UIButton {

    private lazy var smallCircleView : UIView = {
        let smallCircleView = UIView()
        smallCircleView.backgroundColor = UIColor.redColor()
        return smallCircleView
    }()

    private lazy var shapeLayer : CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor =  UIColor.redColor().CGColor
        self.superview?.layer.insertSublayer(shapeLayer, below: self.layer)
        return shapeLayer
    }()

    var oriSmallRadius : CGFloat = 0
    let maxDistance : CGFloat = 80

    override init(frame: CGRect) {
        // 1.继承初始化
        super.init(frame: frame)

        // 保存初始的半径
        let width = self.bounds.width
        oriSmallRadius = width/2

        // 默认设置
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
        titleLabel?.font = UIFont.systemFontOfSize(12)
        layer.cornerRadius = width/2

        // 添加手势
        let panGesture = UIPanGestureRecognizer(target: self, action: "pan:")
        addGestureRecognizer(panGesture)

        // 设置小圆
        smallCircleView.frame = frame
        smallCircleView.layer.cornerRadius = width/2
        smallCircleView.layer.masksToBounds = true
    }

    override func layoutSubviews() {
        print(superview)
        superview?.insertSubview(smallCircleView, belowSubview: self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func pan(panGesture:UIPanGestureRecognizer) {
        // 获取偏移量
        let transP = panGesture.translationInView(self)

        // 修改Center 
        self.center.x += transP.x
        self.center.y += transP.y

        // 复位
        panGesture.setTranslation(CGPointZero, inView: self)

        // 计算圆心距离
        let distance = distanceFromTwoPoint(self.center, point1: smallCircleView.center)

        // 计算小圆的半径
        let smallRadius : CGFloat = oriSmallRadius - distance / 10

        // 计算小圆的尺寸
        smallCircleView.bounds = CGRectMake(0, 0, smallRadius * 2, smallRadius * 2)
        smallCircleView.layer.cornerRadius = smallRadius

        // 当圆心距离大于最大圆心距离
        if distance > maxDistance {
            shapeLayer.path = nil
            smallCircleView.hidden = true
        }else if (distance > 0 && smallCircleView.hidden == false) {
            shapeLayer.path = pathCircleView(smallCircle: smallCircleView, bigCircle: self).CGPath
        }

        if (panGesture.state == .Ended) {
            shapeLayer.path = nil

            if distance > maxDistance {
                print("粘球消失事件")
            }else {
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .CurveLinear, animations: { () -> Void in
                        self.center = self.smallCircleView.center
                    }, completion: { (Bool) -> Void in
                        self.smallCircleView.hidden = false
                })
            }
        }
    }
}
