//
//  STGradientButton.swift
//  STKitSwift
//
//  Created by mac on 2019/7/1.
//

import UIKit

open class STGradientButton: UIButton {
    // MARK: 1.lift cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(gradientLayer)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: 2.private methods
    override open func draw(_ rect: CGRect) {
        gradientLayer.frame = CGRect.init(x: 0, y: 0, width: rect.width, height: rect.height)
        print(rect)
    }
    // MARK: 3.event response
    
    // MARK: 4.interface
    open var colors: [Any]? {
        didSet {
            gradientLayer.colors = colors
        }
    }
    // MARK: 5.getter
    private lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 0)
        return gradientLayer
    }()
    
}

