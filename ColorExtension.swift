//
//  ColorExtension.swift
//
//  Created by Jason Philpy on 2/6/16.
//  Copyright © 2016 Jason Philpy. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(hexString: String) {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        let hexColor = hexString.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        if hexColor.count == 8 {
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
            }
        } else if hexColor.count == 6 {
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                b = CGFloat(hexNumber & 0x0000ff) / 255
                a = 1
            }
        }
        self.init(red: r, green: g, blue: b, alpha: a)
        return
    }
}
