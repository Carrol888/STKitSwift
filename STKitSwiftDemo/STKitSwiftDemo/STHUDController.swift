//
//  STHUDController.swift
//  STKitSwiftDemo
//
//  Created by mac on 2019/7/1.
//  Copyright © 2019 沈兆良. All rights reserved.
//

import UIKit
import STKitSwift
class STHUDController: UIViewController {

    // MARK: 1.lift cycle
    
    // MARK: 2.private methods
    
    // MARK: 3.event response
    
    @IBAction func actionButton(_ sender: UIButton) {
        STHUD.show(textView.text)
    }
    
    @IBAction func actionShow(_ sender: UIButton) {
        STHUD.show("Hello World")
    }
    // MARK: 4.interface
    @IBOutlet weak var textView: UITextView!
    // MARK: 5.getter

    @IBAction func actionImage(_ sender: UIButton) {
        STHUD.show(textView.text, image: UIImage.init(named:"icon_ok" )) { (flag) in
            
        }
    }
    
}
