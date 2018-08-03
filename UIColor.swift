//
//  UIColor.swift
//
//  Created by Julian Jans on 27/06/2018.
//  Copyright © 2018 Julian Jans. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init?(hex:String) {
        guard let int = Int(hex, radix: 16) else {
            return nil
        }
        self.init(red:(int >> 16) & 0xff, green:(int >> 8) & 0xff, blue:int & 0xff)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    static func randomColor(_ alpha: CGFloat) -> UIColor {
        
        let time = UInt32(NSDate().timeIntervalSinceReferenceDate)
        srand48(Int(time))
        
        let randomR:CGFloat = CGFloat(drand48())
        let randomG:CGFloat = CGFloat(drand48())
        let randomB:CGFloat = CGFloat(drand48())
        return UIColor(red: randomR, green: randomG, blue: randomB, alpha: alpha)
    }
    
    func adjust(_ red: CGFloat, green: CGFloat, blue: CGFloat, alpha:CGFloat) -> UIColor{
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return UIColor(red: r+red, green: g+green, blue: b+blue, alpha: a+alpha)
    }

}
