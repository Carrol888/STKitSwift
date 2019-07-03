//
//  STProgressView.swift
//  STKitSwiftDemo
//
//  Created by mac on 2019/7/3.
//  Copyright © 2019 沈兆良. All rights reserved.
//

import UIKit

@IBDesignable public class STProgressView: UIView {
    // MARK: 1.lift cycle
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(progressLayer)
        layer.masksToBounds = true
        progressLayer.masksToBounds = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: 2.private methods
    override public func draw(_ rect: CGRect) {
        var frameprogress = rect
        frameprogress.size.width = progress * rect.width
        progressLayer.frame = frameprogress
        progressLayer.colors = [startColor.cgColor, endColor.cgColor]
        progressLayer.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
    }
    // MARK: 3.event response
    
    // MARK: 4.interface
    @IBInspectable public var startColor: UIColor = .red {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var endColor: UIColor = .yellow {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var progress: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    // MARK: 5.getter
    private lazy var progressLayer: CAGradientLayer = {
        let progressLayer = CAGradientLayer()
        progressLayer.frame = CGRect.zero
        progressLayer.locations = [0, 1]
        progressLayer.startPoint = CGPoint(x: 0, y: 1)
        progressLayer.endPoint = CGPoint(x: 1, y: 1)
        return progressLayer
    }()
}
