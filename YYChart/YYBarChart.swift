

import UIKit

class YYBarChart: UIView {
    
    var _xLabels:NSArray?
    var xLabels:NSArray?{
    set{
        self._xLabels = newValue
        self.xLabelWidth = (self.frame.size.width - chartMargin*2)/5.0
        
        for labelText:NSString in (newValue! as NSString[]) {
            var index = newValue!.indexOfObject(labelText)
            var label = YYChartLabel(frame:CGRectMake((Float(index)*self.xLabelWidth!+chartMargin), self.frame.size.height-30.0,self.xLabelWidth!, 20.0))
            label.textAlignment = NSTextAlignment.Center
            label.text = labelText
            self.addSubview(label)
        }
    }
    get{
        return self._xLabels
    }
    }
    
    var _yValues:NSArray?
    var yValues:NSArray?{
    set{
        self._yValues = newValue
        self.setYLabels(newValue)
    }
    get{
        return self._yValues
    }
    }
    
    var xLabelWidth:Float?
    var yValueMax:Float?
    
    var strokeColor:UIColor?
    
    init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.clipsToBounds = true
        // Initialization code
    }

    
    func setYLabels(newValue:NSArray?){
        var max = 0
        for valueString:NSString in newValue! as NSString[] {
            var value = valueString.integerValue
            if value > max {
                max = value
            }
            
        }
        
        //Min value for Y label
        if max < 5 {
            max = 5;
        }
        
        self.yValueMax = Float(max)
    }
    
    func strokeChart(){
        var chartCavanHeight = self.frame.size.height - chartMargin*2.0 - 40.0
        var index = 0
        
        for valueString:NSString in self.yValues as NSString[] {
            var value = valueString.floatValue
            
            var grade = Float(value) / Float(self.yValueMax!)
            
            var bar = YYBar(frame:CGRectMake((Float(index)*self.xLabelWidth! + chartMargin + self.xLabelWidth! * 0.25), self.frame.size.height - chartCavanHeight - 30.0, self.xLabelWidth! * 0.5, chartCavanHeight))
            bar.barColor = self.strokeColor
            bar.grade = grade
            self.addSubview(bar)
            index += 1
        }
    }
}
