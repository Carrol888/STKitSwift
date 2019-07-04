//
//  STMoveButtonController.swift
//  STKitSwiftDemo
//
//  Created by mac on 2019/7/1.
//  Copyright © 2019 沈兆良. All rights reserved.
//

import UIKit
import STKitSwift
import SnapKit
class STMoveButtonController: UIViewController {

    // MARK: 1.lift cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        moveButton.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(-100)
            maker.right.equalTo(-16)
        }
    }
    // MARK: 2.private methods
    
    // MARK: 3.event response
    
    // MARK: 4.interface
    
    // MARK: 5.getter
    private lazy var moveButton: STMoveButton = {
        let moveButton = STMoveButton()
        moveButton.setImage(UIImage.init(named: "icon_wheel"), for: .normal)
        view.addSubview(moveButton)
        return moveButton
    }()

}
