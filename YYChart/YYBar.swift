

import UIKit
import QuartzCore

class YYBar: UIView {

    var _grade:Float?
    var grade:Float?{
    set{
        self._grade = newValue
        var progressline = UIBezierPath()
        
        progressline.moveToPoint(CGPointMake(self.frame.size.width/2.0, self.frame.size.height))
        progressline.addLineToPoint(CGPointMake(self.frame.size.width/2.0, (1 - newValue!) * self.frame.size.height))
        
        progressline.lineWidth = 1.0
        progressline.lineCapStyle = kCGLineCapSquare
        self.chartLine!.path = progressline.CGPath
        
        if self.barColor {
            self.chartLine!.strokeColor = self.barColor!.CGColor
        }else{
            self.chartLine!.strokeColor = YYColors.Green.CGColor
        }
        
        var pathAnimation = CABasicAnimation(keyPath:"strokeEnd")
        pathAnimation.duration = 1.0
        pathAnimation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        pathAnimation.fromValue = NSNumber(float:0.0)
        pathAnimation.toValue = NSNumber(float:1.0)
        pathAnimation.autoreverses = false
        self.chartLine!.addAnimation(pathAnimation,forKey:"strokeEndAnimation")
        
        self.chartLine!.strokeEnd = 1.0
    }
    get{
        return self._grade
    }
    }
    
    var chartLine:CAShapeLayer?
    var barColor:UIColor?
    
    init(frame: CGRect) {
        super.init(frame: frame)
        self.chartLine = CAShapeLayer()
        self.chartLine!.lineCap = kCALineCapSquare
        self.chartLine!.fillColor   = UIColor.whiteColor().CGColor
        self.chartLine!.lineWidth   = self.frame.size.width
        self.chartLine!.strokeEnd   = 0.0
        self.clipsToBounds = true
        self.layer.addSublayer(self.chartLine)
        self.layer.cornerRadius = 2.0
    }
    
    override func drawRect(rect: CGRect)
    {
        var context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context,UIColor(red:238.0/255.0,green:238.0/255.0,blue:238.0/255.0,alpha:1.0).CGColor)
        CGContextFillRect(context, rect)
    }
}
