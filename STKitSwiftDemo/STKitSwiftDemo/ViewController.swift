//
//  ViewController.swift
//  STKitSwiftDemo
//
//  Created by 沈兆良 on 2018/12/5.
//  Copyright © 2018 沈兆良. All rights reserved.
//

import UIKit.UIViewController
import STKitSwift

import class UIKit.UITableView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        view.addSubview(label)
        view.backgroundColor = .red

        let date = Date()
        print("\(date) \(date.st_year) \(date.st_month) \(date.st_day) \(date.st_hour) \(date.st_minute) \(date.st_second)")

        //编译通过
//        let foo = Foo()
//
//        foo.ob
//        let observer = foo.observe(\.value, options: [.new]) { (foo, change) in
//            print(change.newValue)
//        }
////        let observer = foo.observe(.value, options: [.new]) { (foo, change) in
//            print(change.newValue)
//        }
    }

    @objc func injected(){
        print("I've been injected: \(self)")
    }
}



//会触发警告
class Foo: NSObject {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {}

    @objc dynamic func myFonction(){

    }

    internal func myInf(){

    }
}

