//
//  ViewController.swift
//  OneToN
//
//  Created by Daulet Kenzhetayev on 9/3/16.
//  Copyright © 2016 OneToN. All rights reserved.
//

import UIKit
import SnapKit
import Sugar
import Neon

class ViewController: UIViewController {

    lazy var shareButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("print")
        setup()
    }

    func setup(){
        shareButton.setTitle("Share", forState: .Normal)
        shareButton.backgroundColor = UIColor.grayColor()
        shareButton.addTarget(self, action: #selector(share), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(shareButton)
        updateViewConstraints()
    }
    
    func share(sender: UIButton){
        let screenshotSize = CGSize(width: self.view.width, height: self.view.height)
        let screenshotBounds = CGRect(x: 0, y: 0, width: screenshotSize.width, height: screenshotSize.height)
        
        guard let screenshot = self.view
            .captureScreenshot(ofSize: screenshotSize)
            .cropped(screenshotBounds) else { return }
        
        let shareText = "Я казах"
        
        let activityVC = UIActivityViewController(activityItems: [screenshot.gameResultShareImage, shareText],
            applicationActivities: nil).then {
                $0.popoverPresentationController?.sourceView = sender
        }
        presentViewController(activityVC, animated: true, completion: nil)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        shareButton.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp_centerX)
            make.centerY.equalTo(self.view.snp_centerY)
            make.width.equalTo(120)
            make.height.equalTo(44)
        }
    }

}

