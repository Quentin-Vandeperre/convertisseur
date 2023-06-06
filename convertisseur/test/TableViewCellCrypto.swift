

import UIKit

class TableViewCellCrypto: UITableViewCell {

    @IBOutlet weak var imgCryptoCell: UIImageView!
    @IBOutlet weak var nameCryptoCell: UILabel!
    @IBOutlet weak var lblCurrencyCrypto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
