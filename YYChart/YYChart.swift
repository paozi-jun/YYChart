
import UIKit

enum YYChartType {
    case LineType
    case BarType
    
}
class YYChart: UIView {

    var xLabels:NSArray?
    var yValues:NSArray?
    
    var lineChart:YYLineChart?
    
    var barChart:YYBarChart?
    
    var type:YYChartType?
    
    var strokeColor:UIColor?
    
    init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.clipsToBounds = false
        self.type = YYChartType.LineType
    }

    func setUpChart(){
        if self.type == YYChartType.LineType {
            self.lineChart = YYLineChart(frame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
            self.lineChart!.backgroundColor = UIColor.clearColor()
            self.addSubview(self.lineChart)
            self.lineChart!.yValues  = self.yValues
            self.lineChart!.xLabels = self.xLabels
            self.lineChart!.strokeColor = self.strokeColor
            self.lineChart!.strokeChart()
            
        }else if self.type == YYChartType.BarType{
            self.barChart = YYBarChart(frame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
            self.barChart!.backgroundColor = UIColor.clearColor()
            self.addSubview(self.barChart)
            self.barChart!.yValues = self.yValues
            self.barChart!.xLabels = self.xLabels
            self.barChart!.strokeColor = self.strokeColor
            self.barChart!.strokeChart()
            
        }
    }
    
    func strokeChart(){
        self.setUpChart()
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

}
