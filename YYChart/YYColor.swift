
import UIKit

enum YYColors{
    static var PNGrey = UIColor(red:246.0/255.0,green:246.0/255.0,blue:246.0/255.0,alpha:1.0)
    static var PNLightBlue = UIColor(red:94.0/255.0,green:147.0/255.0,blue:196.0/255.0,alpha:1.0)
    static var PNGreen = UIColor(red:77.0/255.0,green:186.0/255.0,blue:122.0/255.0,alpha:1.0)
    static var PNTitleColor = UIColor(red:0.0/255.0,green:189.0/255.0,blue:113.0/255.0,alpha:1.0)
    static var PNButtonGrey = UIColor(red:141.0/255.0,green:141.0/255.0,blue:141.0/255.0,alpha:1.0)
    static var PNFreshGreen = UIColor(red:77.0/255.0,green:196.0/255.0,blue:122.0/255.0,alpha:1.0)
    static var PNRed   = UIColor(red:245.0/255.0,green:94.0/255.0,blue:78.0/255.0,alpha:1.0)
    static var PNMauve = UIColor(red:88.0/255.0,green:75.0/255.0,blue:103.0/255.0,alpha:1.0)
    static var PNBrown = UIColor(red:119.0/255.0,green:107.0/255.0,blue:95.0/255.0,alpha:1.0)
    static var PNBlue  = UIColor(red:82.0/255.0,green:116.0/255.0,blue:188.0/255.0,alpha:1.0)
    static var PNDarkBlue   = UIColor(red:121.0/255.0,green:134.0/255.0,blue:142.0/255.0,alpha:1.0)
    static var PNYellow     = UIColor(red:242.0/255.0,green:197.0/255.0,blue:117.0/255.0,alpha:1.0)
    static var PNWhite = UIColor(red:255.0/255.0,green:255.0/255.0,blue:255.0/255.0,alpha:1.0)
    static var PNDeepGrey   = UIColor(red:99.0/255.0,green:99.0/255.0,blue:99.0/255.0,alpha:1.0)
    static var PNPinkGrey   = UIColor(red:200.0/255.0,green:193.0/255.0,blue:193.0/255.0,alpha:1.0)
    static var PNHealYellow = UIColor(red:245.0/255.0,green:242.0/255.0,blue:238.0/255.0,alpha:1.0)
    static var PNLightGrey  = UIColor(red:225.0/255.0,green:225.0/255.0,blue:225.0/255.0,alpha:1.0)
    static var PNCleanGrey  = UIColor(red:251.0/255.0,green:251.0/255.0,blue:251.0/255.0,alpha:1.0)
    static var PNLightYellow = UIColor(red:241.0/255.0,green:240.0/255.0,blue:240.0/255.0,alpha:1.0)
    static var PNDarkYellow = UIColor(red:152.0/255.0,green:150.0/255.0,blue:159.0/255.0,alpha:1.0)
    static var PNPinkDark   = UIColor(red:170.0/255.0,green:165.0/255.0,blue:165.0/255.0,alpha:1.0)
    static var PNCloudWhite = UIColor(red:244.0/255.0,green:244.0/255.0,blue:244.0/255.0,alpha:1.0)
    static var PNBlack = UIColor(red:45.0/255.0,green:45.0/255.0,blue:45.0/255.0,alpha:1.0)
    static var PNStarYellow = UIColor(red:252.0/255.0,green:223.0/255.0,blue:101.0/255.0,alpha:1.0)
    static var PNTwitterColor = UIColor(red:0.0/255.0,green:171.0/255.0,blue:243.0/255.0,alpha:1.0)
    static var PNWeiboColor = UIColor(red:250.0/255.0,green:0.0/255.0,blue:33.0/255.0,alpha:1.0)
    static var PNiOSGreenColor = UIColor(red:98.0/255.0,green:247.0/255.0,blue:77.0/255.0,alpha:1.0)
}

class YYColor: NSObject {
    
    //static var SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
    func imageFromColor(color:UIColor)->UIImage{
        var rect = CGRectMake(0, 0, 1, 1)
        UIGraphicsBeginImageContext(rect.size)
        var context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context,
            color.CGColor)
        //  [[UIColor colorWithRed:222./255 green:227./255 blue: 229./255 alpha:1] CGColor]) ;
        CGContextFillRect(context, rect);
        var img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    
}
