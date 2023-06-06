

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameCountryCell: UILabel!
    @IBOutlet weak var imgCountryCell: UIImageView!
    @IBOutlet weak var valueExchangeCell: UILabel!
    @IBOutlet weak var nameCurencyCell : UILabel!
    @IBOutlet weak var signCurrencyCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
