//
//  UIImageExtentions.swift
//  OneToN
//
//  Created by Daulet Kenzhetayev on 9/3/16.
//  Copyright © 2016 OneToN. All rights reserved.
//

import UIKit

extension UIImage {
    var gameResultShareImage: UIImage {
        let shareImage = UIImage(named: "ShareImage")!
        let initialRect = CGRect(origin: .zero, size: size)
        let ratio = shareImage.size.width / initialRect.width
        
        let totalSize = CGSize(width: size.width, height: size.height + shareImage.size.height / ratio)
        
        let shareRect = CGRect(x: 0, y: initialRect.height, width: initialRect.width, height: shareImage.size.height / ratio)
        
        
        UIGraphicsBeginImageContextWithOptions(totalSize, true, 0)
        drawInRect(initialRect)
        shareImage.drawInRect(shareRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func resizeImage(newWidth newWidth: CGFloat) -> UIImage {
        let scale = newWidth / size.width
        let newHeight = size.height * scale
        let newSize = CGSize(width: newWidth, height: newHeight)
        UIGraphicsBeginImageContext(newSize)
        drawInRect(CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func cropped(bounds: CGRect) -> UIImage? {
        let scale = UIScreen.mainScreen().scale
        let scaledBounds = CGRect(x: bounds.origin.x * scale, y: bounds.origin.y * scale,
                                  width: bounds.width * scale, height: bounds.height * scale)
        guard let subImage = CGImageCreateWithImageInRect(CGImage, scaledBounds) else { return nil }
        return UIImage(CGImage: subImage, scale: 0, orientation: imageOrientation)
    }}
