//
//  DownMenuView.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/23.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class DownMenuView: UIView {

    var items : [MenuItem] = []
    var arrayButton : [UIButton] = []

    func hide() {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.transform = CGAffineTransformMakeTranslation(0, -self.bounds.height)
            }) { (Bool) -> Void in
                self.removeFromSuperview()
        }
    }

    class func show(superView:UIView, items:[MenuItem], originY:CGFloat) -> DownMenuView {
        let count = items.count
        if count%3 > 0 {
            let exception = NSException(name: "总数不符合", reason: "传入的数组总数必须是3的倍数", userInfo: nil)
            exception.raise()
        }

        let rows = (count - 1) / 3 + 1

        let xMenu : CGFloat = 0
        let yMenu : CGFloat = originY
        let widthMenu : CGFloat = SCREENWIDTH
        let hightMenu : CGFloat = SCREENWIDTH * CGFloat(rows) / 3

        let menuView = DownMenuView(frame: CGRectMake(xMenu, yMenu, widthMenu, hightMenu))
        menuView.items = items
        menuView.setupAllButton()
        menuView.setupAllDivideView()


        let blackView = UIView(frame: menuView.frame)
        blackView.backgroundColor = UIColor.blackColor()
        superView.addSubview(blackView)

        // 动画
        menuView.transform = CGAffineTransformMakeTranslation(0, -menuView.bounds.height)
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: { () -> Void in
            menuView.transform = CGAffineTransformIdentity
            }) { (Bool) -> Void in
                blackView.removeFromSuperview()
        }

        menuView.backgroundColor = UIColor.blackColor()
        superView.addSubview(menuView)
        
        return menuView
    }

    func setupAllButton() {
        for item in items {
            let button = UIButton(type: .Custom)
            button.setTitle(item.title, forState: .Normal)
            button.setImage(item.image, forState: .Normal)
            addSubview(button)
            arrayButton.append(button)
        }
    }

    func setupAllDivideView() {
        for i in 0...1 {
            let divideView = UIView()
            divideView.backgroundColor = UIColor.whiteColor()
            let xView : CGFloat = SCREENWIDTH / 3 * CGFloat(i+1)
            let yView : CGFloat = 0
            let widthView : CGFloat = 1
            let higthView : CGFloat = self.bounds.height
            divideView.frame = CGRectMake(xView, yView, widthView, higthView)
            addSubview(divideView)
        }

        let rows = (items.count - 1) / 3 + 1

        for i in 0..<rows-1 {
            let divideView = UIView()
            divideView.backgroundColor = UIColor.whiteColor()
            let xView : CGFloat = 0
            let yView : CGFloat = SCREENWIDTH / 3 * CGFloat(i+1)
            let widthView : CGFloat = SCREENWIDTH
            let higthView : CGFloat = 1
            divideView.frame = CGRectMake(xView, yView, widthView, higthView)
            addSubview(divideView)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        // 布局所有的按钮
        let count = items.count
        var col = 0
        var row = 0
        var x : CGFloat = 0
        var y : CGFloat = 0
        let width : CGFloat = SCREENWIDTH/3
        let heigth : CGFloat = width

        for i in 0..<count {
            col = i % 3
            row = i / 3

            let button : UIButton = arrayButton[i]
            x = CGFloat(col) * width
            y = CGFloat(row) * width
            button.frame = CGRectMake(x, y, width, heigth)

        }
    }
}
