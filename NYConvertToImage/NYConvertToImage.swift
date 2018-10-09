//
//  YNConvertImage.swift
//  SwiftConvertToImageDemo
//
//  Created by liyangly on 2018/10/9.
//  Copyright © 2018 liyang. All rights reserved.
//

import UIKit

extension UIImage {
    
    convenience init(_ view: UIView) {
        if view.isKind(of: UIScrollView.self) {
            let scrollView = view as! UIScrollView
            let image = UIImage.convertToImageWith(scrollView: scrollView)
            self.init(cgImage: image.cgImage!)
        } else {
            let image = UIImage.convertToImageWith(view: view)
            self.init(cgImage: image.cgImage!)
        }
    }
    
    class func convertToImageWith(view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        // method "render(in ctx: CGContext)" is faster than method "drawHierarchy"
        // UIGraphicsRenderer available(iOS 10.0, *)
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
    
    class func convertToImageWith(scrollView: UIScrollView) -> UIImage {
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
