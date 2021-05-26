//
//  AppColors.swift
//  Yarn Today
//
//  Created by Aijaz Ali on 3/17/21.
//

import UIKit

extension UIColor {
    
    /// return UIColor(named: "lightColor")
    open class var lightColor: UIColor {
        return UIColor(named: "lightColor") ?? .white
    }
    
    /// return UIColor(named: "darkColor")
    open class var darkColor: UIColor {
        return UIColor(named: "darkColor") ?? .white
    }
    
    /// return UIColor(named: "progressBarColor")
    open class var progressBarColor: UIColor {
        return UIColor(named: "progressBarColor") ?? .white
    }
    
    /// return UIColor(named: "navigationBarColor")
    open class var navigationBarColor: UIColor {
        return UIColor(named: "navigationBarColor") ?? .white
    }
    
    
}
