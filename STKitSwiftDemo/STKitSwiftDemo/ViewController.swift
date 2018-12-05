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


        label.text = "test"
        label.st_width = 100
        label.st_height = 44
        label.st_left = 20
        label.st_top = 100
        label.st_
        label.backgroundColor = .red
    }


}

