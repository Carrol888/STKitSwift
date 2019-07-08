//
//  STAreaPickerController.swift
//  STKitSwiftDemo
//
//  Created by mac on 2019/7/8.
//  Copyright © 2019 沈兆良. All rights reserved.
//

import UIKit

class STAreaPickerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.snp.makeConstraints { (maker) in
            maker.left.bottom.right.equalToSuperview()
            maker.top.equalTo(300)
        }
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        pickerView.show()
    }
    
    private lazy var pickerView: STAreaPickerView = {
        let pickerView = STAreaPickerView()
        pickerView.backgroundColor = .red
        view.addSubview(pickerView)
        return pickerView
    }()
}
