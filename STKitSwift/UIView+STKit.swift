//
//  UIView+STKit.swift
//  STKitSwiftDemo
//
//  Created by 沈兆良 on 2018/12/5.
//  Copyright © 2018 沈兆良. All rights reserved.
//

import UIKit

public extension UIView {
    /// x
    public var st_x: CGFloat {
        get {
            return frame.minX
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    /// y
    public var st_y: CGFloat {
        get {
            return frame.minY
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    /// width
    public var st_width: CGFloat {
        get {
            return frame.width
        }
        set {
            frame.size.width = newValue
        }
    }
    /// height
    public var st_height: CGFloat {
        get {
            return frame.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    /// top
    public var st_top: CGFloat {
        get {
            return frame.minY
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    /// bottom
    public var st_bottom: CGFloat {
        get {
            return frame.maxY
        }
        set {
            frame.origin.y = newValue - frame.height
        }
    }
    
    /// left
    public var st_left: CGFloat {
        get {
            return frame.minX
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    /// right
    public var st_right: CGFloat {
        get {
            return frame.maxX
        }
        set {
            frame.origin.x = newValue - frame.width
        }
    }
    
    /// centerX
    public var st_centerX: CGFloat {
        get {
            return center.x
        }
        set {
            center.x = newValue
        }
    }
    
    /// centerY
    public var st_centerY: CGFloat {
        get {
            return center.y
        }
        set {
            center.y = newValue
        }
    }
    
    /// size
    public var st_size: CGSize {
        get {
            return frame.size
        }
        set {
            st_width = newValue.width
            st_height = newValue.height
        }
    }
}
