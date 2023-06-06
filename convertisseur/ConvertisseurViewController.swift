

import UIKit

class ConvertisseurViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func displayTest() {
        print(textField.text)
    }

    
    
    
    @IBOutlet weak var lbl: UILabel!
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        var secondVC: TableViewControllerFavorite = segue.destination as! TableViewControllerFavorite
        secondVC.receivedString = textField.text!
    }
}
