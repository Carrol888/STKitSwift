//
//  STProgressController.swift
//  STKitSwiftDemo
//
//  Created by mac on 2019/7/3.
//  Copyright © 2019 沈兆良. All rights reserved.
//

import UIKit
import STKitSwift

class STProgressController: UIViewController {

    // MARK: 1.lift cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.snp.makeConstraints { (maker) in
            maker.left.equalTo(50)
            maker.right.equalTo(-50)
            maker.top.equalTo(150)
            maker.height.equalTo(50)
        }
        
        progressView1.snp.makeConstraints { (maker) in
            maker.left.equalTo(50)
            maker.right.equalTo(-50)
            maker.top.equalTo(progressView.snp.bottom).offset(50)
            maker.height.equalTo(40)
        }
        
        progressView2.snp.makeConstraints { (maker) in
            maker.left.equalTo(50)
            maker.right.equalTo(-50)
            maker.top.equalTo(progressView1.snp.bottom).offset(50)
            maker.height.equalTo(20)
        }
        
        progressView3.snp.makeConstraints { (maker) in
            maker.left.equalTo(50)
            maker.right.equalTo(-50)
            maker.top.equalTo(progressView2.snp.bottom).offset(50)
            maker.height.equalTo(20)
        }
    }
    // MARK: 2.private methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        progressView.progress = CGFloat.randomCGFloatNumber(lower: 0, upper: 255) / 255
        progressView1.progress = CGFloat.randomCGFloatNumber(lower: 0, upper: 255) / 255
        progressView2.progress = CGFloat.randomCGFloatNumber(lower: 0, upper: 255) / 255
        progressView3.progress = CGFloat.randomCGFloatNumber(lower: 0, upper: 255) / 255
    }
    // MARK: 3.event response
    
    // MARK: 4.interface
    
    // MARK: 5.getter
    private lazy var progressView: STProgressView = {
        let progressView = STProgressView()
        progressView.backgroundColor = UIColor.gray
        let red = CGFloat.randomCGFloatNumber(lower: 200, upper: 255) / 255
        let green = CGFloat.randomCGFloatNumber(lower: 50, upper: 255) / 255
        let blue = CGFloat.randomCGFloatNumber(lower: 100, upper: 255) / 255
        progressView.startColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1)
        
        let red1 = CGFloat.randomCGFloatNumber(lower: 200, upper: 255) / 255
        let green1 = CGFloat.randomCGFloatNumber(lower: 0, upper: 255) / 255
        let blue1 = CGFloat.randomCGFloatNumber(lower: 0, upper: 255) / 255
        progressView.endColor = UIColor.init(red: red1, green: green1, blue: blue1, alpha: 1)
        
        progressView.cornerRadius = 25
        progressView.progress = 0.7
        view.addSubview(progressView)
        return progressView
    }()
    
    private lazy var progressView1: STProgressView = {
        let progressView = STProgressView()
        progressView.backgroundColor = UIColor.gray
        let red = CGFloat.randomCGFloatNumber(lower: 200, upper: 255) / 255
        let green = CGFloat.randomCGFloatNumber(lower: 50, upper: 255) / 255
        let blue = CGFloat.randomCGFloatNumber(lower:100, upper: 255) / 255
        progressView.startColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1)
        
        let red1 = CGFloat.randomCGFloatNumber(lower: 200, upper: 255) / 255
        let green1 = CGFloat.randomCGFloatNumber(lower: 0, upper: 255) / 255
        let blue1 = CGFloat.randomCGFloatNumber(lower: 0, upper: 255) / 255
        progressView.endColor = UIColor.init(red: red1, green: green1, blue: blue1, alpha: 1)
        
        progressView.cornerRadius = 20
        progressView.progress = 0.7
        view.addSubview(progressView)
        return progressView
    }()
    
    private lazy var progressView2: STProgressView = {
        let progressView = STProgressView()
        progressView.backgroundColor = UIColor.gray
        let red = CGFloat.randomCGFloatNumber(lower: 200, upper: 255) / 255
        let green = CGFloat.randomCGFloatNumber(lower: 50, upper: 255) / 255
        let blue = CGFloat.randomCGFloatNumber(lower: 100, upper: 255) / 255
        progressView.startColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1)
        
        let red1 = CGFloat.randomCGFloatNumber(lower: 200, upper: 255) / 255
        let green1 = CGFloat.randomCGFloatNumber(lower: 0, upper: 255) / 255
        let blue1 = CGFloat.randomCGFloatNumber(lower: 0, upper: 255) / 255
        progressView.endColor = UIColor.init(red: red1, green: green1, blue: blue1, alpha: 1)
        
        progressView.cornerRadius = 10
        progressView.progress = 0.7
        view.addSubview(progressView)
        return progressView
    }()
    
    private lazy var progressView3: STProgressView = {
        let progressView = STProgressView()
        progressView.backgroundColor = UIColor.gray
        let red = CGFloat.randomCGFloatNumber(lower: 100, upper: 255) / 255
        let green = CGFloat.randomCGFloatNumber(lower: 0, upper: 255) / 255
        let blue = CGFloat.randomCGFloatNumber(lower: 100, upper: 255) / 255
        progressView.startColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1)
        
        let red1 = CGFloat.randomCGFloatNumber(lower: 200, upper: 255) / 255
        let green1 = CGFloat.randomCGFloatNumber(lower: 0, upper: 255) / 255
        let blue1 = CGFloat.randomCGFloatNumber(lower: 0, upper: 255) / 255
        progressView.endColor = UIColor.init(red: red1, green: green1, blue: blue1, alpha: 1)
        
        progressView.cornerRadius = 10
        progressView.progress = 0.7
        view.addSubview(progressView)
        return progressView
    }()
}
