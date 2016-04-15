//
//  STButton.swift
//  uibutton
//
//  Created by 沈兆良 on 16/4/14.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

/// sizeThatFits 和 sizeToFit 两个方法没有适配
public enum STButtonTitleType : Int {
    case Up // 字体在上
    case Left // 字体在左
    case Bottom // 字体在下
    case Right // 字体在右
}

public class STButton: UIButton {
    /// 文本的位置
    public var titleType: STButtonTitleType = .Right
    /// 文本和图片的间隔
    public var margin: CGFloat = 0
}

extension STButton {


    public override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        let titleRectOrigin = super.titleRectForContentRect(contentRect)
        let imageRectOrigin = super.imageRectForContentRect(contentRect)
        var titleRect: CGRect = titleRectOrigin
        switch titleType {
            case .Up:
                titleRect.origin.x = titleRectOrigin.origin.x - imageRectOrigin.width/2
                titleRect.origin.y -= imageRectOrigin.height/2 + margin/2
                break
            case .Left:
                titleRect.origin.x = imageRectOrigin.origin.x - margin/2
                break
            case .Bottom:
                titleRect.origin.x = titleRectOrigin.origin.x - imageRectOrigin.width/2
                titleRect.origin.y += imageRectOrigin.height/2 + margin/2
                break
            case .Right:
                titleRect.origin.x += margin/2
                break
        }
        return titleRect
    }

    public override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        let titleRectOrigin = super.titleRectForContentRect(contentRect)
        let imageRectOrigin =  super.imageRectForContentRect(contentRect)
        var imageRect: CGRect = imageRectOrigin
        switch titleType {
        case .Up:
            imageRect.origin.x = imageRectOrigin.origin.x + titleRectOrigin.width/2
            imageRect.origin.y += titleRectOrigin.height/2 + margin/2
            break
        case .Left:
            imageRect.origin.x = titleRectOrigin.maxX - imageRect.size.width + margin/2
            break
        case .Bottom:
            imageRect.origin.x = imageRectOrigin.origin.x + titleRectOrigin.width/2
            imageRect.origin.y -= titleRectOrigin.height/2 + margin/2
            break
        case .Right:
            imageRect.origin.x -= margin/2
            break
        }
        return imageRect
    }
}
