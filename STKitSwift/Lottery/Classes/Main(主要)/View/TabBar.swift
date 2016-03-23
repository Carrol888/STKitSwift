//
//  TabBar.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/23.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

@objc
protocol TabBarDelegate : NSObjectProtocol {
    optional func tabBarClick(tabBar:TabBar, index:Int)
}

class TabBar: UIView {

    var items : Array<UITabBarItem>!
        {
        didSet {

            for  item in items {
                let button = UIButton(type: .Custom)
                button.tag = self.subviews.count
                button.setBackgroundImage(item.image, forState: .Normal)
                button.setBackgroundImage(item.selectedImage, forState: .Selected)
                button.addTarget(self, action: "buttonClick:", forControlEvents: .TouchDown)
                self.addSubview(button)

                if subviews.count == 1 {
                    buttonClick(button)
                }
            }
        }
    }

    weak var buttonSelected = UIButton()

    weak var delegate : TabBarDelegate?

    func buttonClick(button:UIButton) {
        buttonSelected?.selected = false
        button.selected = true
        buttonSelected = button

        delegate?.tabBarClick!(self, index: button.tag)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let count = self.subviews.count
        var x:CGFloat = 0
        let y:CGFloat = 0
        let w:CGFloat = UIScreen.mainScreen().bounds.width / CGFloat(count)
        let h:CGFloat = self.bounds.height

        for i in 0 ..< count {
            let button: UIButton = subviews[i] as! UIButton
            x = CGFloat(i) * w
            button.frame = CGRectMake(x, y, w, h)

        }
    }
}
