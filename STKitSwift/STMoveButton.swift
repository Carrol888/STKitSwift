//
//  STMoveButton.swift
//  STKitSwift
//
//  Created by mac on 2019/7/1.
//

import UIKit
open class STMoveButton: UIButton{
    
    // MARK: 1.lift cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addGestureRecognizer(panGesture)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: 2.private methods
    
    // MARK: 3.event response
    @objc func panClick(panGesture: UIPanGestureRecognizer) {
        switch panGesture.state {
        case .possible: break
        case .began: break
        case .changed:
            let tx:CGFloat = panGesture.location(in: self).x - frame.width/2
            let ty:CGFloat = panGesture.location(in: self).y - frame.height/2
            transform = transform.translatedBy(x: tx, y: ty)
            break
        case .ended:
            var frameButton = self.frame
            let STSCREENWIDTH = UIScreen.main.bounds.width
            let STSCREENHEIGHT = UIScreen.main.bounds.height
            
            if (frameButton.origin.y < 64 ) {
                frameButton.origin.y = 64
            }
        
            if (frameButton.origin.y > (STSCREENHEIGHT - frameButton.size.height - margin)) {
                frameButton.origin.y = (STSCREENHEIGHT - frameButton.size.height - margin)
            }
            
            if (frameButton.origin.y > STSCREENWIDTH) {
                if ((frameButton.origin.x + frameButton.size.width/2) < STSCREENWIDTH/2 ) {
                    frameButton.origin.x = margin
                    autoresizingMask = [.flexibleRightMargin, .flexibleTopMargin]
                    
                }else {
                    frameButton.origin.x = STSCREENWIDTH - frameButton.size.width - margin
                    autoresizingMask = [.flexibleLeftMargin, .flexibleTopMargin]
                }
            }else {
                if ((frameButton.origin.x + frameButton.size.width/2) < STSCREENWIDTH/2 ) {
                    frameButton.origin.x = margin
                    autoresizingMask = [.flexibleRightMargin, .flexibleBottomMargin]
                }else {
                    frameButton.origin.x = STSCREENWIDTH - frameButton.size.width - margin
                    autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
                }
            }
            
            UIView.animate(withDuration: 0.3) {
                self.frame = frameButton
            }
            break
        case .cancelled: break
        case .failed: break
        @unknown default: break
            
        }
    }
    
    // MARK: 4.interface
    private lazy var panGesture: UIPanGestureRecognizer = {
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(panClick(panGesture:)))
        return panGesture
    }()
    
    open var margin:CGFloat = 16
}



