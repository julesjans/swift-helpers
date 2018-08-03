//
//  CIImage.swift
//
//  Created by Julian Jans on 11/10/2017.
//

import Foundation
import CoreImage

extension CIImage {
    
    // Create a UIImage from a CIImage with context
    func renderUIImage() -> UIImage {
        let context = CIContext()
        let cgImage = context.createCGImage(self, from: self.extent)
        return UIImage(cgImage: cgImage!)
    }
    
    //  TODO: Test the responsiveness of these two methods
    //    func renderUIImage() -> UIImage {
    //        let uiimage = UIImage(ciImage: self)
    //        UIGraphicsBeginImageContextWithOptions(uiimage.size, false, uiimage.scale)
    //        defer { UIGraphicsEndImageContext() }
    //        uiimage.draw(in: CGRect(origin: .zero, size: uiimage.size))
    //        return UIGraphicsGetImageFromCurrentImageContext()!
    //    }
    
    // Tint a CIImage from a UIColor
    func tint(_ color: UIColor) -> CIImage {
        
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        color.getRed(&r, green:&g, blue:&b, alpha:&a)
        
        let rVector = CIVector(x: r, y: 0, z: 0, w: 0)
        let gVector = CIVector(x: 0, y: g, z: 0, w: 0)
        let bVector = CIVector(x: 0, y: 0, z: b, w: 0)
        let aVector = CIVector(x: 0, y: 0, z: 0, w: a)
        
        return self.applyingFilter("CIColorMatrix", parameters: ["inputRVector": rVector, "inputGVector": gVector, "inputBVector": bVector, "inputAVector": aVector])
    }

}
