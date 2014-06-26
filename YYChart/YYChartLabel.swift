

import UIKit

class YYChartLabel: UILabel {

    init(frame: CGRect) {
        super.init(frame: frame)
        self.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.minimumScaleFactor = 11.0
        self.numberOfLines = 0
        self.font = UIFont.boldSystemFontOfSize(11.0)
        self.textColor = YYColors.PNDeepGrey
        self.backgroundColor = UIColor.clearColor()
        self.textAlignment = NSTextAlignment.Left
        self.userInteractionEnabled = true
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
