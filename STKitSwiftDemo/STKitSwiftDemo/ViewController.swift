//
//  ViewController.swift
//  STKitSwiftDemo
//
//  Created by 沈兆良 on 2018/12/5.
//  Copyright © 2018 沈兆良. All rights reserved.
//

import UIKit
import STKitSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        view.addSubview(label)
        view.backgroundColor = .red

        let date = Date()
        print("\(date) \(date.st_year) \(date.st_month) \(date.st_day) \(date.st_hour) \(date.st_minute) \(date.st_second)")
    }

    @objc func injected(){
        print("I've been injected: \(self)")
    }
}
