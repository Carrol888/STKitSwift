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
        
        tf3.snp.makeConstraints { (maker) in
            maker.left.equalTo(20)
            maker.right.equalTo(-20)
            maker.height.equalTo(30)
            maker.top.equalTo(tf2.snp.bottom).offset(20)
        }
        
    }
    // MARK: 2.private methods
    
    // MARK: 3.event response
    
    // MARK: 4.interface
    
    // MARK: 5.getter
    @IBOutlet weak var tf1: STPhoneTextField!
    
    @IBOutlet weak var tf2: STPhoneTextField!
    
    private lazy var tf3: STPhoneTextField = {
        let tf3 = STPhoneTextField()
        tf3.config.defaultConfig = STPhoneFormat.init(defaultPhoneFormat: "(####) #######")
        tf3.prefix = "+86 "
        tf3.placeholder = "format:+86 (####) #######"
        tf3.font = UIFont.systemFont(ofSize: 16)
        tf3.backgroundColor = .white
        tf3.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(tf3)
        return tf3
    }()
}
