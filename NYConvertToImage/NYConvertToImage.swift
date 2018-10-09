//
//  YNConvertImage.swift
//  SwiftConvertToImageDemo
//
//  Created by liyangly on 2018/10/9.
//  Copyright © 2018 liyang. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func convertToImageWith(_ view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        // compare with next code, its less efficiency
        if #available(iOS 10.0, *) {
            view.layer.render(in: UIGraphicsGetCurrentContext() ?? UIGraphicsRendererContext().cgContext)
        } else {
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let image = image {
            return image
        }
        return UIImage()
    }
    
    class func convertToImageWith(_ scrollView: UIScrollView) -> UIImage {
        return UIImage.convertToImageWith(scrollView, 0.0)
    }
    
    class func convertToImageWith(_ scrollView: UIScrollView, _ scale: CGFloat) -> UIImage {
        // we should set scrollView contentSize already unless view autolayout
        UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, false, scale);
        
        let savedContentOffset = scrollView.contentOffset;
        let savedFrame = scrollView.frame;
        scrollView.contentOffset = CGPoint.zero;
        scrollView.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height)
        
        if #available(iOS 10.0, *) {
            scrollView.layer.render(in: UIGraphicsGetCurrentContext() ?? UIGraphicsRendererContext().cgContext)
        } else {
            scrollView.drawHierarchy(in: scrollView.frame, afterScreenUpdates: true)
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        scrollView.contentOffset = savedContentOffset
        scrollView.frame = savedFrame
        UIGraphicsEndImageContext()
        
        if let image = image {
            return image
        }
        return UIImage()
    }
}
