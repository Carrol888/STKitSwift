//
//  STAreaPickerController.swift
//  STKitSwiftDemo
//
//  Created by mac on 2019/7/8.
//  Copyright © 2019 沈兆良. All rights reserved.
//

import UIKit
import STKitSwift
class STAreaPickerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        label.snp.makeConstraints { (maker) in
            maker.width.equalTo(300)
            maker.center.equalToSuperview()
        }
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        STAreaPickerView.show(inView: view) { [weak self](provinceName, provinceCode, cityName, cityCode, areaName, areaCode) in
            self?.label.text = "provinceName = \(provinceName ?? "")\nprovinceCode = \(provinceCode ?? "")\ncityName = \(cityName ?? "")\ncityCode = \(cityCode ?? "")\nareaName = \(areaName ?? "")\nareaCode = \(areaCode ?? "")"
        }
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.numberOfLines = 0
        view.addSubview(label)
        return label
    }()
}
