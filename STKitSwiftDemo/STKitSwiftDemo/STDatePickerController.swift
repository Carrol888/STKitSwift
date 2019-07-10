//
//  STDatePickerController.swift
//  STKitSwiftDemo
//
//  Created by mac on 2019/7/10.
//  Copyright © 2019 沈兆良. All rights reserved.
//

import UIKit
import STKitSwift
class STDatePickerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        STDatePickerView.show(minimumDateStr: "1900-01-01",
                              maximumDateStr: "3000-01-01",
                              currentDateStr: "2019-06-04")
        { (year, month, day)in
            print("year = \(year)  month = \(month)  day = \(day)")
        }
    }
}
