//
//  STPhoneTextFieldController.swift
//  STKitSwiftDemo
//
//  Created by mac on 2019/7/2.
//  Copyright © 2019 沈兆良. All rights reserved.
//

import UIKit
import STKitSwift
class STPhoneTextFieldController: UIViewController {

    // MARK: 1.lift cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tf2.config.defaultConfig = STPhoneFormat.init(defaultPhoneFormat: "### #### ####")
    }
    // MARK: 2.private methods
    
    // MARK: 3.event response
    
    // MARK: 4.interface
    
    // MARK: 5.getter
    @IBOutlet weak var tf1: STPhoneTextField!
    
    @IBOutlet weak var tf2: STPhoneTextField!
    
}
