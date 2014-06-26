

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
        lineChartLabel.textColor = YYColors.Green
        lineChartLabel.font = UIFont.systemFontOfSize(23.0)
        lineChartLabel.textAlignment = NSTextAlignment.Center
        
        var lineChart = YYChart(frame:CGRectMake(0, 75.0, SCREEN_WIDTH, 200.0))
        lineChart.backgroundColor = UIColor.clearColor()
        lineChart.xLabels = NSArray(objects:"SEP 1","SEP 2","SEP 3","SEP 4","SEP 5")
        lineChart.yValues = NSArray(objects:"1","10","2","6","3")
        lineChart.strokeChart()
        self.view.addSubview(lineChartLabel)
        self.view.addSubview(lineChart)
        
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
