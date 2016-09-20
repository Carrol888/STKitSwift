//
//  CustomController.swift
//  STKitSwift
//
//  Created by ST on 16/9/19.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

enum PanDirections: Int {
    case Right
    case Left
    case Bottom
    case Top
    case TopLeftToBottomRight
    case TopRightToBottomLeft
    case BottomLeftToTopRight
    case BottomRightToTopLeft
}

class CustomController: UIViewController {
    var gradientLayer: CAGradientLayer!
    var panDirection: PanDirections!
    var colorSets = [[CGColor]]()
    var currentColorSet: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createColorSets()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGestureRecognizer(_:)))
        self.view.addGestureRecognizer(panGestureRecognizer)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        createGradientLayer()
    }
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = colorSets[currentColorSet]
//        gradientLayer.locations = [0.5, 0.35]
        gradientLayer.startPoint = CGPointMake(0.0, 0.5)
        gradientLayer.endPoint = CGPointMake(1.0, 0.5)
        
//        gradientLayer.colors = [UIColor.redColor().CGColor, UIColor.yellowColor().CGColor]
//        gradientLayer.colors = [UIColor.redColor().CGColor, UIColor.orangeColor().CGColor, UIColor.blueColor().CGColor, UIColor.magentaColor().CGColor, UIColor.yellowColor().CGColor]
        
        self.view.layer.addSublayer(gradientLayer)
    }
    
    func createColorSets() {
        colorSets.append([UIColor.redColor().CGColor, UIColor.yellowColor().CGColor])
        colorSets.append([UIColor.greenColor().CGColor, UIColor.magentaColor().CGColor])
        colorSets.append([UIColor.grayColor().CGColor, UIColor.lightGrayColor().CGColor])
        
        currentColorSet = 0
    }
    
    func handleTapGesture(gestureRecognizer: UITapGestureRecognizer) {
        if currentColorSet < colorSets.count - 1 {
            currentColorSet! += 1
        }else {
            currentColorSet = 0
        }
        
        let colorChangeAnimation = CABasicAnimation(keyPath: "colors")
        colorChangeAnimation.duration = 2.0
        colorChangeAnimation.toValue = colorSets[currentColorSet]
        colorChangeAnimation.fillMode = kCAFillModeForwards
        colorChangeAnimation.removedOnCompletion = false
        gradientLayer.addAnimation(colorChangeAnimation, forKey: "colorChange")
    }
    

    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
//        super.animationDidStop(anim, finished: flag)
        if flag {
            gradientLayer.colors = colorSets[currentColorSet]
        }
    }
    
    
    func handlePanGestureRecognizer(gestureRecognizer: UIPanGestureRecognizer) {
        let velocity = gestureRecognizer.velocityInView(self.view)
        
        if gestureRecognizer.state == UIGestureRecognizerState.Changed {
            if velocity.x > 300.0 {
                // 水平向右的情况
                // 之后检测竖直方向上的速度
                
                if velocity.y > 300.0 {
                    // 从左上到右下
                    panDirection = PanDirections.TopLeftToBottomRight
                }
                else if velocity.y < -300.0 {
                    // 从左下到右上
                    panDirection = PanDirections.BottomLeftToTopRight
                }
                else {
                    // 水平向右
                    panDirection = PanDirections.Right
                }
            }
            else if velocity.x < -300.0 {
                // 水平方向想左的情况
                // 之后检测数值方向上的速度
                
                if velocity.y > 300.0 {
                    // 从右上到左下
                    panDirection = PanDirections.TopRightToBottomLeft
                }
                else if velocity.y < -300.0 {
                    // 从右下到左上
                    panDirection = PanDirections.BottomRightToTopLeft
                }
                else {
                    // 水平向左
                    panDirection = PanDirections.Left
                }
            }
            else {
                // 只有竖直方向上的状态（向上或向下）
                
                if velocity.y > 300.0 {
                    // 竖直向下
                    panDirection = PanDirections.Bottom
                }
                else if velocity.y < -300.0 {
                    // 竖直向上
                    panDirection = PanDirections.Top
                }
                else {
                    // 无手势
                    panDirection = nil
                }
            }
        }
        else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            changeGradientDirection()
        }
        }
        
        func changeGradientDirection() {
            if panDirection != nil {
                switch panDirection.rawValue {
                case PanDirections.Right.rawValue:
                    gradientLayer.startPoint = CGPointMake(0.0, 0.5)
                    gradientLayer.endPoint = CGPointMake(1.0, 0.5)
                    
                case PanDirections.Left.rawValue:
                    gradientLayer.startPoint = CGPointMake(1.0, 0.5)
                    gradientLayer.endPoint = CGPointMake(0.0, 0.5)
                    
                case PanDirections.Bottom.rawValue:
                    gradientLayer.startPoint = CGPointMake(0.5, 0.0)
                    gradientLayer.endPoint = CGPointMake(0.5, 1.0)
                    
                case PanDirections.Top.rawValue:
                    gradientLayer.startPoint = CGPointMake(0.5, 1.0)
                    gradientLayer.endPoint = CGPointMake(0.5, 0.0)
                    
                case PanDirections.TopLeftToBottomRight.rawValue:
                    gradientLayer.startPoint = CGPointMake(0.0, 0.0)
                    gradientLayer.endPoint = CGPointMake(1.0, 1.0)
                    
                case PanDirections.TopRightToBottomLeft.rawValue:
                    gradientLayer.startPoint = CGPointMake(1.0, 0.0)
                    gradientLayer.endPoint = CGPointMake(0.0, 1.0)
                    
                case PanDirections.BottomLeftToTopRight.rawValue:
                    gradientLayer.startPoint = CGPointMake(0.0, 1.0)
                    gradientLayer.endPoint = CGPointMake(1.0, 0.0)
                    
                default:
                    gradientLayer.startPoint = CGPointMake(1.0, 1.0)
                    gradientLayer.endPoint = CGPointMake(0.0, 0.0)
                }
            }
        }

}