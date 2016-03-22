//
//  WelcomeView.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/22.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class WelcomeView: UIView {

    @IBOutlet weak var labelText: UILabel?
    @IBOutlet weak var iconImage: UIImageView?
    @IBOutlet weak var sloginView: UIImageView?

//    class func welcomeView() -> WelcomeView  {
//        print(NSBundle.mainBundle().loadNibNamed("WelcomeView", owner: nil, options: nil).first)
//        return NSBundle.mainBundle().loadNibNamed("WelcomeView", owner: nil, options: nil).first as! WelcomeView
////        return WelcomeView()
//    }

    override func awakeFromNib() {

    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

//        self.iconImage.transform = CGAffineTransformMakeTranslation(0, 50)
        UIView.animateWithDuration(0.5, animations: { () -> Void in
//            self.sloginView.alpha = 0
            }) { (Bool) -> Void in
//                self.iconImage.hidden = false
        }

        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .CurveLinear, animations: { () -> Void in
//            self.iconImage.transform = CGAffineTransformIdentity
            }) { (Bool) -> Void in
//                self.labelText.alpha = 0
//                self.labelText.hidden = false
        }

        print(self.labelText)

//        NSBundle.mainBundle().loadNibNamed("WelcomeView", owner: nil, options: nil).last
//        print(NSBundle.mainBundle().loadNibNamed("WelcomeView", owner: nil, options: nil))

        UIView.animateWithDuration(0.5, animations: { () -> Void in
//            self.labelText.alpha = 1
            }) { (Bool) -> Void in
                self.removeFromSuperview()
        }
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
    }
}
