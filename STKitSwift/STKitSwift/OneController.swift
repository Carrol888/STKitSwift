//
//  OneController.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/15.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

protocol OneControllerDelegate : NSObjectProtocol {
    func oneControllerSelected(controller:OneController)
}

class OneController: UIViewController {
    // MARK: - --- interface 接口
    weak  var delegate : OneControllerDelegate?

    // MARK: - --- lift cycle 生命周期 ---

    override func loadView() {
        let viewSelf = DrawLineView()
        view = viewSelf
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.colorRandom()
        delegate!.oneControllerSelected(self)
    }
    
    // MARK: - --- delegate 视图委托 ---

    // MARK: - --- event response 事件相应 ---

    // MARK: - --- private methods 私有方法 ---

    // MARK: - --- setters 属性 ---

    // MARK: - --- getters 属性 ---
}

