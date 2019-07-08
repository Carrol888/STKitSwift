//
//  STTimerButtonController.swift
//  STKitSwiftDemo
//
//  Created by mac on 2019/7/5.
//  Copyright © 2019 沈兆良. All rights reserved.
//

import UIKit
import STKitSwift
import SnapKit

class STTimerButtonController: UIViewController {
    
    // MARK: 1.lift cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonCode.snp.makeConstraints { (maker) in
            maker.height.equalTo(44)
            maker.width.equalTo(150)
            maker.center.equalToSuperview()
        }
        
        buttonTime.snp.makeConstraints { (maker) in
            maker.height.equalTo(44)
            maker.width.equalTo(240)
            maker.centerX.equalToSuperview()
            maker.top.equalTo(buttonCode.snp.bottom).offset(20)
        }
        actionTime()
    }
    
    deinit {
        buttonCode.invalidate()
        buttonTime.invalidate()
        print("--------- STTimerButtonController deinit ---------")
    }
    // MARK: 2.private methods
    
    /// 秒数转换为时间格式 - 00:00:00
    func secondsToStr(second: Int) -> String{
        let hour = second / 3600
        let minu = (second - hour * 3600) / 60
        let sec = second - hour * 3600 - minu * 60
        let Hstr = String(format: "%02d", hour)
        let MStr = String(format: "%02d", minu)
        let SStr = String(format: "%02d", sec)
        return Hstr + ":" + MStr + ":" + SStr
    }
    
    // MARK: 3.event response
    @objc func actionCode(){
        buttonCode.startCountDown(duration: 10) { (button, type, time)  in
            print("button = \(button) type = \(type) time = \(time)")
            switch type {
            case .start:
                button.isEnabled = false
                button.setTitle(time.description + "s", for: .normal)
                button.backgroundColor = .gray
            case .ongoing:
                button.isEnabled = false
                button.setTitle(time.description + "s", for: .normal)
                button.backgroundColor = .gray
            case .finish:
                button.isEnabled = true
                button.setTitle("重新发送", for: .normal)
                button.backgroundColor = .red
            default:
                button.isEnabled = true
            }
        }
    }
    
    @objc func actionTime(){
        switch buttonTime.type {
        case .none:
            buttonTime.startTime(startTime: 22222) { [weak self] (button, type, time) in
                print("button = \(button) type = \(type) time = \(time)")
                switch type {
                case .start:
                    button.setTitle(self?.secondsToStr(second: time), for: .normal)
                case .ongoing:
                    button.setTitle(self?.secondsToStr(second: time), for: .normal)
                case .pause:
                    button.setTitle("⏸", for: .normal)
                case .finish:
                    button.isEnabled = true
                default:
                    button.isEnabled = true
                }
            }
        case .ongoing:
            buttonTime.pause()
        case .pause:
            buttonTime.resume()
        default:
            buttonTime.isEnabled = true
        }
    }
    
    // MARK: 4.interface
    
    // MARK: 5.getter

    private lazy var buttonCode: STTimerButton = {
        let buttonCode = STTimerButton()
        buttonCode.addTarget(self, action: #selector(actionCode), for: .touchUpInside)
        buttonCode.setTitle("发送验证码", for: .normal)
        buttonCode.layer.cornerRadius = 22
        buttonCode.layer.masksToBounds = true
        buttonCode.backgroundColor = .blue
        view.addSubview(buttonCode)
        return buttonCode
    }()
    
    private lazy var buttonTime: STTimerButton = {
        let buttonTime = STTimerButton()
        buttonTime.addTarget(self, action: #selector(actionTime), for: .touchUpInside)
        buttonTime.setTitle(secondsToStr(second: 22222), for: .normal)
        buttonTime.layer.cornerRadius = 22
        buttonTime.layer.masksToBounds = true
        buttonTime.backgroundColor = .blue
        view.addSubview(buttonTime)
        return buttonTime
    }()
}

