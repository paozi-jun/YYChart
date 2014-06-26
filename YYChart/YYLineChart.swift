

import UIKit
import QuartzCore

let chartMargin:Float = 10
let xLabelMargin:Float = 15
let yLabelMargin:Float = 15
let yLabelHeight:Float = 11

class YYLineChart: UIView {

    var _xLabels:NSArray?
    var xLabels:NSArray?{
    set{
        self._xLabels = newValue
        self.xLabelWidth = (self.frame.size.width - chartMargin - 30.0 - Float(self.xLabels!.count-1) * xLabelMargin)/5.0
        
        for labelText:AnyObject in newValue! {
            var index = self.xLabels!.indexOfObject(labelText)
            var label = YYChartLabel(frame:CGRectMake(Float(index) * (xLabelMargin + self.xLabelWidth!) + 30.0, self.frame.size.height - 30.0, self.xLabelWidth!, 20.0))
            label.textAlignment = NSTextAlignment.Center
            label.text = labelText as NSString
            self.addSubview(label)
        }
    }
    get{
        return self._xLabels
    }
    }
    
    var _yLabels:NSArray?
    var yLabels:NSArray?{
    set{
        self._yLabels = newValue
        var max:Int = 0
        for valueString:AnyObject in newValue! {
            
            var value = (valueString as String).toInt()
            if (value > max) {
                max = value!
            }
        }
        
        //Min value for Y label
        if max < 5 {
            max = 5
        }
        
        self.yValueMax = max
        
        var level = Float(max)/5.0
        
        var index = 0
        var num = self.yLabels!.count + 1
        while num > 0 {
            var chartCavanHeight = self.frame.size.height - chartMargin * 2.0 - 40.0
            var levelHeight = chartCavanHeight/5.0;
            var label = YYChartLabel(frame:CGRectMake(0.0,chartCavanHeight - Float(index) * levelHeight + (levelHeight - yLabelHeight) , 20.0, yLabelHeight))
            label.textAlignment = NSTextAlignment.Right
            label.text = NSString(format:"%1.f",level * Float(index))
            self.addSubview(label)
            index += 1
            num -= 1
        }
    }
    get{
        return self._yLabels
    }
    }
    
    var _yValues:NSArray?
    var yValues:NSArray?{
    get{
        return self._yValues
    }
    set{
        self._yValues = newValue
        var max:Int = 0
        for valueString:AnyObject in newValue! {
            
            var value = (valueString as String).toInt()
            if (value > max) {
                max = value!
            }
        }
        
        //Min value for Y label
        if max < 5 {
            max = 5
        }
        
        self.yValueMax = max
        
        var level = Float(max)/5.0
        
        var index = 0
        var num = newValue!.count + 1
        while num > 0 {
            var chartCavanHeight = self.frame.size.height - chartMargin * 2.0 - 40.0
            var levelHeight = chartCavanHeight/5.0;
            var label = YYChartLabel(frame:CGRectMake(0.0,chartCavanHeight - Float(index) * levelHeight + (levelHeight - yLabelHeight) , 20.0, yLabelHeight))
            label.textAlignment = NSTextAlignment.Right
            label.text = NSString(format:"%1.f",level * Float(index))
            self.addSubview(label)
            index += 1
            num -= 1
        }
    }
    }
    
    var xLabelWidth:Float?
    var yValueMax:Int?
    
    var chartLine:CAShapeLayer?

    var _strokeColor:UIColor?
    var strokeColor:UIColor?{
    set{
        self._strokeColor = newValue
        //self.chartLine!.strokeColor = newValue!.CGColor
    }
    get{
        return self._strokeColor
    }
    }
    
    init(frame: CGRect) {
        super.init(frame: frame)
        
        self.xLabelWidth = 0
        self.yValueMax = 0
        self.backgroundColor = UIColor.whiteColor()
        self.clipsToBounds = true
        self.chartLine = CAShapeLayer()
        self.chartLine!.lineCap = kCALineCapRound
        self.chartLine!.lineJoin = kCALineJoinBevel
        self.chartLine!.fillColor   = UIColor.whiteColor().CGColor
        self.chartLine!.lineWidth   = 3.0
        self.chartLine!.strokeEnd   = 0.0
        self.layer.addSublayer(self.chartLine)
    }

    func strokeChart(){
        //return
        var progressline = UIBezierPath()
        
        var firstValue = Float((self.yValues![0] as String).toInt()!)
        
        var xPosition:Float = xLabelMargin + self.xLabelWidth!
        
        var chartCavanHeight:Float = self.frame.size.height - chartMargin*2.0 - 40.0;
        
        var grade:Float = Float(firstValue) / Float(self.yValueMax!)
        progressline.moveToPoint(CGPointMake( xPosition, chartCavanHeight - grade * chartCavanHeight + 20.0))
        progressline.lineWidth = 3.0
        progressline.lineCapStyle = kCGLineCapRound
        progressline.lineJoinStyle = kCGLineJoinRound
        var index = 0
        for valueString:AnyObject in self.yValues! {
            var value = (valueString as String).toInt()
            
            var grade = Float(value!) / Float(self.yValueMax!)
            if index != 0 {
                progressline.addLineToPoint(CGPointMake(Float(index)*xPosition+30.0+self.xLabelWidth!/2.0, chartCavanHeight - grade*chartCavanHeight+20.0))
                
                progressline.moveToPoint(CGPointMake(Float(index)*xPosition+30.0+self.xLabelWidth!/2.0,chartCavanHeight-grade*chartCavanHeight+20.0 ))
                
                progressline.stroke()
            }
            
            index += 1;
        }
        
        self.chartLine!.path = progressline.CGPath
        if self.strokeColor {
            self.chartLine!.strokeColor = self.strokeColor!.CGColor
        }else{
            self.chartLine!.strokeColor = YYColors.Green.CGColor
        }
        
        
        var pathAnimation = CABasicAnimation(keyPath:"strokeEnd")
        pathAnimation.duration = 1.0
        pathAnimation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        pathAnimation.fromValue = NSNumber(float: 0.0)
        pathAnimation.toValue = NSNumber(float: 1.0)
        pathAnimation.autoreverses = false
        self.chartLine!.addAnimation(pathAnimation,forKey:"strokeEndAnimation")
        
        self.chartLine!.strokeEnd = 1.0
    }
    
}
