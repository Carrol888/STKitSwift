//
//  STHUD.swift
//  Pods-STKitSwiftDemo
//
//  Created by mac on 2019/7/1.
//

import UIKit
import SnapKit
public class STHUD: UIView{
    
    @discardableResult
    class func show(_ title:String, completion: ((Bool) -> Void)? = nil) -> STHUD{
        let noticeView = show(title)
        noticeView.completion = completion
        return noticeView
    }
    
    @discardableResult
    public class func show(_ title: String) -> STHUD{
        let noticeView = STHUD.init(frame: UIScreen.main.bounds)
        noticeView.setupUI()
        noticeView.labelTitle.text = title
        noticeView.show()
        return noticeView
    }
    
    private func show()  {
        let window = UIApplication.shared.keyWindow!
        window.addSubview(self)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.layer.opacity = 1.0
        }) { (finished) in
            self.perform(#selector(self.remove), with: nil, afterDelay: 1)
        }
    }
    
    @objc private func remove(){
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.layer.opacity = 0
        }) { (finished) in
            self.removeFromSuperview()
            self.completion?(true)
        }
    }
    
    private func setupUI(){
        contentView.snp.makeConstraints { (maker) in
            maker.left.greaterThanOrEqualTo(50)
            maker.right.lessThanOrEqualTo(-50)
            maker.center.equalToSuperview()
        }
        
        labelTitle.snp.makeConstraints { (maker) in
            maker.left.equalTo(28)
            maker.right.equalTo(-28)
            maker.top.equalTo(14)
            maker.bottom.equalTo(-14)
        }
    }
    
    var completion: ((Bool) -> Void)? = nil
    
    private lazy var labelTitle: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.font = UIFont.systemFont(ofSize: 16)
        labelTitle.numberOfLines = 0
        labelTitle.textAlignment = .center
        contentView.addSubview(labelTitle)
        return labelTitle
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 180, height: 116))
        contentView.layer.cornerRadius = 5
        contentView.backgroundColor = UIColor.init(white: 0, alpha: 0.7)
        contentView.layer.masksToBounds = true
        addSubview(contentView)
        return contentView
    }()
}
