//
//  ViewController.swift
//  likeAnimation
//
//  Created by Danni on 12/25/18.
//  Copyright © 2018 Danni Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let bgImageView:UIImageView = {
        let image = UIImage(named: "fb_core_data_bg")
        let imageView = UIImageView(image:image )
        return imageView
    }()
    
    let iconsContainerView:UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .red
        //containerView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        return containerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bgImageView)
        bgImageView.frame = view.frame
        setupLongPressGesture()
    }
    
    fileprivate func setupLongPressGesture(){
        view.addGestureRecognizer(UILongPressGestureRecognizer(target:self , action: #selector(handleLongPress)))
    }
    
    @objc private func handleLongPress(gestureRecognizer:UILongPressGestureRecognizer){
        switch gestureRecognizer.state {
        case .began:
            view.addSubview(iconsContainerView)
            handleGestureBegan(gestureRecognizer: gestureRecognizer)
           
        case .ended:
            iconsContainerView.removeFromSuperview()
        default:
            break
        }
    }
    
    fileprivate func handleGestureBegan(gestureRecognizer:UILongPressGestureRecognizer){
        let centerX = view.center.x-100
        let pressedLocation = gestureRecognizer.location(in: view)
        self.iconsContainerView.frame = CGRect(x: pressedLocation.x, y: pressedLocation.y, width:200, height: 100)
        //            alpha
        iconsContainerView.alpha = 0
        UIView.animate(withDuration: 1, delay:0.4, usingSpringWithDamping:0.5, initialSpringVelocity: 1.2, options: .curveEaseOut, animations: {
            self.iconsContainerView.alpha = 1
            self.iconsContainerView.frame = CGRect(x: centerX, y: pressedLocation.y-100, width: 200, height: 100)
        }, completion: nil)
    }
    override var prefersStatusBarHidden: Bool{return true}

}

