//
//  STGradientButtonController.swift
//  STKitSwiftDemo
//
//  Created by mac on 2019/7/1.
//  Copyright © 2019 沈兆良. All rights reserved.
//

import UIKit
import STKitSwift
import SnapKit

class STGradientButtonController: UIViewController {
    
    // MARK: 1.lift cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientButton.snp.makeConstraints { (maker) in
            maker.width.equalTo(200)
            maker.height.equalTo(44)
            maker.center.equalToSuperview()
        }
        
    }
    // MARK: 2.private methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        gradientButton.snp.updateConstraints { (maker) in
            maker.width.equalTo(CGFloat.randomCGFloatNumber(lower: 44, upper: 300))
            maker.height.equalTo(CGFloat.randomCGFloatNumber(lower: 44, upper: 300))
        }
        gradientButton.setNeedsDisplay()
    }
    // MARK: 3.event response
    
    // MARK: 4.interface
    
    private lazy var gradientButton: STGradientButton = {
        let gradientButton = STGradientButton()
        gradientButton.startColor = .red
        gradientButton.endColor =  UIColor.init(white: 0.4, alpha: 1)
        gradientButton.setTitle("使用layer", for: .normal)
        gradientButton.layer.cornerRadius = 22
        gradientButton.layer.masksToBounds = true
        view.addSubview(gradientButton)
        return gradientButton
    }()
}

public extension CGFloat {
    static func randomCGFloatNumber(lower: CGFloat = 0,upper: CGFloat = 1) -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UInt32.max)) * (upper - lower) + lower
    }
}
