//
//  ViewController.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/15.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class ViewController: UIViewController, OneControllerDelegate {

    // MARK: - --- interface 接口
    var presentVC:TestController!
    // MARK: - --- lift cycle 生命周期 ---

    // loadView作用：自定义控制器的view
    // loadView什么时候调用：第一次使用控制器的view的时候调用
    // 注意：在这个方法中如果没有自定义view,就不能获取控制器的view
    // 一旦重写了这个方法，就不要调用[super loadView]
    // 如果重写了这个方法，就不会去加载storyboard描述的控制器的View
    override func loadView() {
        let viewSelf = UIView(frame: CGRectZero)
        viewSelf.backgroundColor = UIColor.whiteColor()

        let button = UIButton(frame: CGRectMake(0, 100, 100, 100))
        button.backgroundColor = UIColor.colorRandom()
        button.setTitle("PUSH", forState: .Normal)
        button.setTitleColor(UIColor.colorRandom(), forState: .Normal)
        viewSelf.addSubview(button)
        button.addTarget(self, action: "gotoOne", forControlEvents: .TouchUpInside)

        view = viewSelf
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "第一个控制器"
//        let item0 = UIBarButtonItem(title: "ST", style: UIBarButtonItemStyle.Done, target: self, action: nil)
//        let item1 = UIBarButtonItem(title: "ST", style: .Plain, target: self, action: nil)
//        let item2 = UIBarButtonItem(title: "ST", target: self, action: nil)
//        navigationItem.rightBarButtonItems = [item0, item1, item2]

        view.addSubview(button)
        view.addSubview(touchView)
        view.addSubview(quartzView)
        view.addSubview(calayerView)
        view.addSubview(clockView)
        clockView.start()

        view.addSubview(heartView)
        heartView.start()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let time:dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC))
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            self.view.backgroundColor = UIColor.colorRandom()
        }
    }

    /** 旋转屏幕时调用*/
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
    }



    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        for viewSub in (self.navigationController?.navigationBar.subviews)! {

            if viewSub.isKindOfClass(NSClassFromString("_UINavigationBarBackground")!) {
                for viewSubSub in viewSub.subviews {
                    print(viewSubSub)

                    if viewSubSub.isKindOfClass(NSClassFromString("UIImageView")!) {
                        viewSubSub.layer.backgroundColor = UIColor.redColor().CGColor
                        viewSubSub.backgroundColor = UIColor.redColor()

                    }
                }
            }

        }
    }

    // MARK: - --- delegate 视图委托 ---
    func oneControllerSelected(controller: OneController) {
        print(controller)
    }

    // MARK: - --- event response 事件相应 ---
    func gotoOne(){
        let oneVC = OneController()
        oneVC.delegate = self
        self.navigationController?.pushViewController(oneVC, animated: true)
    }

    func modalVC() {
        presentVC = TestController()
        presentVC.view.backgroundColor = UIColor.colorRandom()
        let window = UIApplication.sharedApplication().keyWindow
        window?.addSubview(presentVC.view)
        presentVC.view.transform = CGAffineTransformMakeTranslation(0, view.bounds.height)
        UIView.animateWithDuration(0.3) { () -> Void in
            self.presentVC.view.transform = CGAffineTransformIdentity
        }
    }
    // MARK: - --- private methods 私有方法 ---

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        calayerView.layer.transform = CATransform3DMakeRotation(angleToRadian(numberRandom(360)+1),0,0,1)
        calayerView.layer.position = CGPointMake(numberRandom(200)+20, numberRandom(400)+50)
        calayerView.layer.cornerRadius = CGFloat(numberRandom(50))
        calayerView.layer.backgroundColor = UIColor.colorRandom().CGColor
        calayerView.layer.borderWidth = numberRandom(10)
        calayerView.layer.borderColor = UIColor.colorRandom().CGColor
    }
    // MARK: - --- setters 属性 ---

    
    // MARK: - --- getters 属性 ---
    private lazy var button : UIButton = {
        let button = UIButton()
        button.frame = CGRectMake(100, 100, 100, 44)
        button.backgroundColor = .colorRandom()
        button.setTitle("MODAL", forState:.Normal)
        button.setTitleColor(.colorRandom(), forState: .Normal)
        button.addTarget(self, action: "modalVC", forControlEvents: .TouchUpInside)
        return button
    }()

    private lazy var touchView:TouchView = {
        let touchView = TouchView()
        touchView.frame = CGRectMake(100, 300, 100, 100)
        touchView.backgroundColor = UIColor.colorRandom()
        return touchView
    }()

    private lazy var quartzView:QuartzView = {
        let quarzView = QuartzView()
        quarzView.frame = CGRectMake(0, 300, 100, 100)
        return quarzView
    }()

    private lazy var calayerView:UIView = {
        let calayerView = UIView()
        calayerView.frame = CGRectMake(200, 100, 100, 100)
        calayerView.backgroundColor = UIColor.colorRandom()
        return calayerView
    }()

    private lazy var clockView:ClockView = {
        let clockView = ClockView(frame: CGRectMake(200, 300, 100,100))
        return clockView;
    }()

    private lazy var heartView:HeartView = {
        let heartView = HeartView(frame: CGRectMake(100, 400, 100,100))
        return heartView
    }()
}