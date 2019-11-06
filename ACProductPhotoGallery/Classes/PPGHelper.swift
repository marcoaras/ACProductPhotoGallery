//
//  PPGHelper.swift
//  Pods-ACProductPhotoGallery
//
//  Created by Aras Cglzn on 2.11.2019.
//

import Foundation
import UIKit

public func getPromoHeight() -> CGFloat {
    
    let screenRect = UIScreen.main.bounds
    let screenWidth = screenRect.size.width
    
    let percent = (screenWidth * 100) / 1200
    let newHeight = (1800 * percent) / 100
    
    return newHeight
}

public func getBottomHeight() -> CGFloat {
    
    let height = UIScreen.main.bounds.size.height
    let topHeight = getPromoHeight()
    return CGFloat(height - topHeight)
}

public func getCellWidthHeight() -> (width: CGFloat, height: CGFloat) {
    
    var minusHeight: CGFloat = 0
    
    UIDevice().isDeviceWith_XShape ? (minusHeight = 32) : (minusHeight = 15)
    let height = getBottomHeight() - minusHeight
    let width = ( height * 2 ) / 3
    return (CGFloat(width), CGFloat(height))
    
}

extension UIDevice {
    
    var isPortrait: Bool {
        
        return UIInterfaceOrientation.portrait == .portrait
    }
    
    var isDeviceWith_XShape : Bool {
        
        if self.userInterfaceIdiom == .phone {
            
            if isPortrait
            {
                switch UIScreen.main.nativeBounds.height {
                    
                case 2436,2688,1792:
                    print("iPhone X, Xs, Xr, Xs Max")
                    return true
                default:
                    print("Any other device")
                    return false
                }
            }
            else
            {
                switch UIScreen.main.nativeBounds.width {
                    
                case 2436,2688,1792:
                    print("iPhone X, Xs, Xr, Xs Max")
                    return true
                default:
                    print("Any other device")
                    return false
                }
            }
        }
        else
        {
            return false
        }
    }
    
}

extension UIView {

    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
}
