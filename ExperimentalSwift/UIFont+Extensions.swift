//
//  UIFont+Extension.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 10/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import UIKit

extension UIFont {
    
    /** Standard font sizes that can be adjusted for device size */
    enum Size: CGFloat {
        case tiny = 10
        case small = 12
        case medium = 14
        case regular = 17
        case large = 19
        case big = 20
        case bigger = 24
        case huge = 34
        case giant = 42
    }
    
    /** Standard thickness for fonts used in app */
    enum Thickness: String {
        
        case black = "Mada-Black", bold = "Mada-Bold", semiBold = "Mada-SemiBold", medium = "Mada-Medium", regular = "Mada-Regular", light = "Mada-Light", extraLight = "Mada-ExtraLight"
    }
    
    struct FontParams {
        
        let thickness: Thickness
        let size: Size
    }
    static func getFont(thickness: Thickness, size: Size) -> UIFont {
        return UIFont(name: thickness.rawValue, size: size.rawValue)!
    }
}
