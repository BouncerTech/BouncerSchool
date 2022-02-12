//
//  Colors.swift
//  Bouncer
//
//  Created by Andrew Kestler on 8/3/21.
//


import UIKit

extension UIColor{
    
    /**
            100 / 255
    */
    class func buttonFill() -> UIColor{
        return UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
    }
    
    /**
            150 / 255
    */
    class func greyBorder() -> UIColor{
        return UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
    }
    
    /**
            12 / 255
    */
    class func nearlyBlack() -> UIColor{
        return UIColor(red: 12/255, green: 12/255, blue: 12/255, alpha: 1)
    }
    
    /**
            230 / 255
    */
    class func nearlyWhite() -> UIColor{
        return UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
    }
    
    /**
            22 / 255
    */
    class func greyColor() -> UIColor{
        return UIColor(red: 22/255, green: 22/255, blue: 22/255, alpha: 1)
    }
    /**
            35 / 255
    */
    class func greyColor2() -> UIColor{
        return UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
    }
    
    /**
            40 / 255
    */
    class func lightGreyColor() -> UIColor{
        return UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
    }
    
    /**
            75 / 255
    */
    class func lightGreyColor2() -> UIColor{
        
        return UIColor(red: 75/255, green: 75/255, blue: 75/255, alpha: 1)
    }
    
    
    /**
            60 / 255
    */
    class func buttonGreyColor() -> UIColor{
    
        return UIColor(red: 60/255, green: 60/255, blue: 60/255, alpha: 1)
    }
    
    /**
            r: 255 g: 200 b: 115
    */
    
    class func lightOrange() -> UIColor{
        return UIColor(red: 255, green: 200/255, blue: 115/255, alpha: 1)
    }
   
    
    /**
        r: 0 g: 240 b: 255
    */
    class func blueMinty() -> UIColor{
        return UIColor(red: 0, green: 240/255, blue: 255/255, alpha: 1)
    }
    
    /**
        r: 255 g: 90 b: 90
    */
    class func redColor() -> UIColor{
        return UIColor.init(red: 255/255, green: 90/255, blue: 90/255, alpha: 1)
    }
    
    /**
            200/255
    */
    class func lightGreyText() -> UIColor{
        return UIColor.init(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
    }
    
    /**
            165/255
    */
    class func darkerGreyText() -> UIColor{
        return UIColor.init(red: 165/255, green: 165/255, blue: 165/255, alpha: 1)
    }
    
    class func greyButtonGradientFill() -> [CGColor] {
        var colorArray = [CGColor]()
        colorArray.append(UIColor.init(red: 60/255, green: 60/255, blue: 60/255, alpha: 1).cgColor)
        colorArray.append(UIColor.init(red: 150/255, green: 150/255, blue: 150/255, alpha: 1).cgColor)
        return colorArray
    }
    
    class func blueGradientFill() -> [CGColor] {
        var colorArray = [CGColor]()
        colorArray.append(UIColor.init(red: 50/255, green: 70/255, blue: 100/255, alpha: 1).cgColor)
        colorArray.append(UIColor.init(red: 0/255, green: 204/255, blue: 216/255, alpha: 1).cgColor)
        return colorArray
    }
    
    class func shinyGradientFill() -> [CGColor]{
        var colorArray = [CGColor]()
        colorArray.append(UIColor.init(red: 0, green: 0, blue: 0, alpha: 1).cgColor)
        colorArray.append(UIColor.init(red: 10, green: 10, blue: 10, alpha: 0.1).cgColor)
        
        
        return colorArray
    }
    
    class func grayGradientFill() -> [CGColor] {
        var colorArray = [CGColor]()
       
        colorArray.append(UIColor.init(red: 40/255, green: 40/255, blue: 40/255, alpha: 0.00).cgColor)
        colorArray.append(UIColor.init(red: 40/255, green: 40/255, blue: 40/255, alpha: 0.77).cgColor)
        colorArray.append(UIColor.init(red: 40/255, green: 40/255, blue: 40/255, alpha: 0.96).cgColor)
        colorArray.append(UIColor.init(red: 40/255, green: 40/255, blue: 40/255, alpha: 1).cgColor)
       
        return colorArray
    }
}
