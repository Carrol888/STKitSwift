//
//  STTimer.swift
//  STKitSwiftDemo
//
//  Created by mac on 2019/7/8.
//  Copyright © 2019 沈兆良. All rights reserved.
//

import UIKit

class STTimer: NSObject {
    
    private(set) var _timer: Timer?
    fileprivate weak var _aTarget: AnyObject?
    fileprivate var _aSelector: Selector?
    var fireDate: Date {
        get{
            return _timer?.fireDate
        }
        set{
            _timer?.fireDate = newValue
        }
    }
    
    class func scheduledTimer(timeInterval ti: TimeInterval, target aTarget: AnyObject, selector aSelector: Selector, userInfo: Any?, repeats yesOrNo: Bool) -> STTimer {
        let timer = STTimer()
        
        timer._aTarget = aTarget
        timer._aSelector = aSelector
        timer._timer = Timer.scheduledTimer(timeInterval: ti, target: timer, selector: #selector(STTimer.st_timerRun), userInfo: userInfo, repeats: yesOrNo)
        return timer
    }
    
    func fire() {
        _timer.fire()
    }
    
    func invalidate() {
        _timer.invalidate()
    }
    
    @objc func st_timerRun() {
        _ = _aTarget.perform(_aSelector)
    }
    
    deinit {
        print("计时器已销毁")
    }
}
