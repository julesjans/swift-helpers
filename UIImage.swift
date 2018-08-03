//
//  UIImage.swift
//
//  Created by Julian Jans on 02/08/2018.
//  Copyright © 2018 Julian Jans. All rights reserved.
//

import Foundation

extension UIImage {
    
    func averageColor() -> UIColor {
        
        let context = CIContext(options: nil)
        
        let ciImage = CIImage(image: self)
        
        guard let filter = CIFilter(name: "CIAreaAverage") else {
            return UIColor.clear
        }
        
        filter.setValue(ciImage, forKey: kCIInputImageKey)
        
        guard let processImage = filter.outputImage else { return UIColor.clear }
        
        guard let cgImage = context.createCGImage(processImage, from: processImage.extent) else { return UIColor.clear }
        
        guard let pixelData = cgImage.dataProvider?.data else { return UIColor.clear }
        
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let r = CGFloat(data[0]) / CGFloat(255.0)
        let g = CGFloat(data[1]) / CGFloat(255.0)
        let b = CGFloat(data[2]) / CGFloat(255.0)
        let a = CGFloat(data[3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
