//
//  ActiveMenuView.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/23.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class ActiveMenuView: UIView {
    var button : UIButton = {
        let button = UIButton(type:.Custom)
        button.frame = CGRectMake(180, 0, 20, 20)
        button.setImage(UIImage(named: "alphaClose"), forState: .Normal)
        return button
    }()

    var imageView : UIImageView = {
        let imageView = UIImageView(frame: CGRectMake(0,0, 200, 200))
        imageView.image = UIImage(named: "xiaopingguo")
        return imageView
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(button)
        button.addTarget(self, action: "hide", forControlEvents: .TouchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    class func showInPint(point:CGPoint) -> ActiveMenuView {
        let menuView = ActiveMenuView(frame: CGRectMake(0,0, 200, 200))
        menuView.center = point
        KeyWindow().addSubview(menuView)
        print("\(__FUNCTION__) \(menuView.subviews)")
        return menuView
    }

    func hide() {
        ActiveMenuView.hideInPoint(CGPointMake(44, 44)) { (Bool) -> Void in
            print("\(__FUNCTION__)")
        }
    }

    class func hideInPoint(point:CGPoint, completion: ((Bool) -> Void)?) {
        for childView in KeyWindow().subviews {
            if childView.isKindOfClass(self) {
                (childView as! ActiveMenuView).setupHideAnimation(point, completion: { () -> Void in
                    if ((completion) != nil) {
                        completion
                    }
                })
            }
        }
    }

    func setupHideAnimation(point:CGPoint, completion: () -> Void) {
        UIView.animateWithDuration(1, animations: { () -> Void in
            var transform = CGAffineTransformIdentity
            transform = CGAffineTransformTranslate(transform, point.x-self.center.x, point.y-self.center.y)
            transform = CGAffineTransformScale(transform, 0.01, 0.01)
            self.transform = transform
            }) { (finished) -> Void in
            self.removeFromSuperview()
                if (finished) {
                    completion()
            }
        }
    }
}
