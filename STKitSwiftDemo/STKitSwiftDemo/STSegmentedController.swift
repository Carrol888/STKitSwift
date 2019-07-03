//
//  STSegmentedController.swift
//  STKitSwiftDemo
//
//  Created by mac on 2019/7/3.
//  Copyright © 2019 沈兆良. All rights reserved.
//

import UIKit
import SnapKit
import STKitSwift
class STSegmentedController: UIViewController {

    // MARK: 1.lift cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.snp.makeConstraints { (maker) in
            maker.left.right.equalToSuperview()
            maker.top.equalTo(100)
            maker.height.equalTo(36)
        }
        
        let titles = ["关注", "推荐", "国际", "娱乐", "视频", "科技", "军事", "设计", "体育", "读书"]
        segmentedControl.titles = titles
        segmentedControl.selectBlock = { (item) in
            print(item)
        }
        segmentedControl.currentIndex = 3
        
        segmentedControl1.snp.makeConstraints { (maker) in
            maker.left.right.equalToSuperview()
            maker.top.equalTo(segmentedControl.snp.bottom).offset(50)
            maker.height.equalTo(50)
        }
        
        let titles1 = ["iOS开发社区", "Swift开发社区", "flutter开发社区", "Java开发社区", "视频", "科技", "军事", "设计", "体育", "读书"]
        segmentedControl1.heightTitle = 50
        segmentedControl1.titles = titles1
        segmentedControl1.selectBlock = { (item) in
            print(item)
        }
        segmentedControl1.currentIndex = 3
    }
    
    // MARK: 2.private methods

    // MARK: 3.event response
    
    // MARK: 4.interface

    // MARK: 5.getter
    private lazy var segmentedControl: STSegmentedControl = {
        let segmentedControl = STSegmentedControl()
        view.addSubview(segmentedControl)
        return segmentedControl
    }()
    
    private lazy var segmentedControl1: STSegmentedControl = {
        let segmentedControl1 = STSegmentedControl()
        view.addSubview(segmentedControl1)
        return segmentedControl1
    }()

}
