//
//  DrawImageView.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/21.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class DrawImageView: UIView {

    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRectMake(0, 0, 100,150)
        return imageView
    }()
    var times = 1

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.colorRandom()
        addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        if (times == 4) {
            times = 1
        }

        let image = UIImage(named: String(times))
        imageView.image = image
        times++

        let animation = CATransition()
        animation.type = "pageCurl"
        animation.duration = 1
        imageView.layer.addAnimation(animation, forKey: nil)
    }
    
}
