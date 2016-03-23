//
//  MenuItem.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/23.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class MenuItem: NSObject {
    var title : String?
    var image : UIImage?
    class func item(title:String, image:UIImage) -> MenuItem {
        let item = MenuItem()
        item.title = title
        item.image = image
        return item
    }
}
