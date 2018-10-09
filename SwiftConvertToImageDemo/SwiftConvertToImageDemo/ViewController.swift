//
//  ViewController.swift
//  SwiftConvertToImageDemo
//
//  Created by liyangly on 2018/10/9.
//  Copyright © 2018 liyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        convertTest()
        convertTest2()
    }
    
    func convertTest() {
        let testView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        testView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        view.addSubview(testView)
        getCurrentTimeIntervalStr()
        let testImage = UIImage.convertToImageWith(view)
        print(testImage)
        getCurrentTimeIntervalStr()
        
    }
    
    func convertTest2() {
        let scrollView = UIScrollView(frame: view.frame)
        scrollView.backgroundColor = #colorLiteral(red: 0.4, green: 0.8, blue: 1, alpha: 1)
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1300)
        view.addSubview(scrollView)
        
        let testView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        testView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        scrollView.addSubview(testView)
        
        let testView2 = UIView(frame: CGRect(x: 100, y: 1000, width: 200, height: 200))
        testView2.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        scrollView.addSubview(testView2)
        
        getCurrentTimeIntervalStr()
        let testImage = UIImage.convertToImageWith(scrollView)
        print(testImage)
        getCurrentTimeIntervalStr()
        
    }
    
    func getCurrentTimeIntervalStr() {
        let date = Date.init(timeIntervalSinceNow: 0)
//        let timeinterval = date.timeIntervalSince1970 * 1000
//        print("\(timeinterval)")
        let dataformatter = DateFormatter()
        dataformatter.dateFormat = "yyyy-MM-dd HH:mm:ss SS"
        let currentdateStr = dataformatter.string(from: date)
        print("\(currentdateStr)")
    }


}

