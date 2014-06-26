

import UIKit
let SCREEN_WIDTH =  UIScreen.mainScreen().bounds.size.width
class MainViewController: UIViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        var lineChartLabel = UILabel(frame:CGRectMake(0, 30, SCREEN_WIDTH, 30))
        lineChartLabel.text = "Line Chart"
        lineChartLabel.textColor = YYColors.Blue
        lineChartLabel.font = UIFont.systemFontOfSize(23.0)
        lineChartLabel.textAlignment = NSTextAlignment.Center
        
        var lineChart = YYChart(frame:CGRectMake(0, 75.0, SCREEN_WIDTH, 200.0))
        lineChart.strokeColor = YYColors.Blue
        lineChart.backgroundColor = UIColor.clearColor()
        lineChart.xLabels = NSArray(objects:"SEP 1","SEP 2","SEP 3","SEP 4","SEP 5")
        lineChart.yValues = NSArray(objects:"1","10","2","6","3")
        lineChart.strokeChart()
        self.view.addSubview(lineChartLabel)
        self.view.addSubview(lineChart)
        
        
        var barChartLabel = UILabel(frame:CGRectMake(0, 300, SCREEN_WIDTH, 30))
        barChartLabel.text = "Bar Chart"
        barChartLabel.textColor = YYColors.Blue
        barChartLabel.font = UIFont.systemFontOfSize(23.0)
        barChartLabel.textAlignment = NSTextAlignment.Center
        
        var barChart = YYChart(frame:CGRectMake(0, 335.0, SCREEN_WIDTH, 200.0))
        barChart.backgroundColor = UIColor.clearColor()
        barChart.strokeColor = YYColors.Blue
        barChart.type = YYChartType.BarType
        barChart.xLabels = ["SEP 1","SEP 2","SEP 3","SEP 4","SEP 5"]
        barChart.yValues = ["1","10","2","6","3"]
        barChart.strokeChart()
        self.view.addSubview(barChartLabel)
        self.view.addSubview(barChart)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
