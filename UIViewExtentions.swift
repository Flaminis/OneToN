//
//  ViewExtentions.swift
//  OneToN
//
//  Created by Daulet Kenzhetayev on 9/3/16.
//  Copyright © 2016 OneToN. All rights reserved.
//

import UIKit

extension UIView {
    var screenshot: UIImage {
        return captureScreenshot(ofSize: bounds.size)
    }
    
    func captureScreenshot(ofSize size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        drawViewHierarchyInRect(bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    var asImage: UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0)
        layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

}
