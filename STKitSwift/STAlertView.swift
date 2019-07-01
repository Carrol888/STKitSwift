//
//  STAlertView.swift
//  STKitSwift
//
//  Created by mac on 2019/7/1.
//

import UIKit

public class STAlertView: UIAlertController {

    @discardableResult
    public class func show(title:String?, message: String?, cancelTitle: String?, otherTitle: String?, completion:((Int) -> Void)? = nil) -> STAlertView{
        let alertView = STAlertView.init(title: title, message: message, preferredStyle: .alert)
        
        if let title = cancelTitle {
            let alertCancel: UIAlertAction = UIAlertAction.init(title: title, style: .cancel) { (_) in
                completion?(0)
            }
            alertView.addAction(alertCancel)
        }

        if let title = otherTitle {
            let alertOther: UIAlertAction = UIAlertAction.init(title: title, style: .default) { (_) in
                completion?(1)
            }
            alertView.addAction(alertOther)
        }
        
        let controller = UIViewController.topMost ?? UIViewController()
        controller.present(alertView, animated: true, completion: nil)
        return alertView
    }

}
