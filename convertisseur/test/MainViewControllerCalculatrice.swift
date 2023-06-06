import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var numberAffect: UILabel!
    var numberStart: Int = 0
    var dataEnter: Float = 0
    var dataEnterNumberTwo: Float = 0
    var result: Float = 0
    var newAttrribute: String = ""
    var firstClick: Int = 0// Pour la fonction clean

    override func viewDidLoad() {
        super.viewDidLoad()
        numberAffect.text = String(numberStart)
        
    }
    
    func clicknumber(number: Float) {
        dataEnter = dataEnter*10 + number
        numberAffect.text = String(dataEnter)
        firstClick = 0
        //button.clean("A", forState: .normal)
        
    }
    
    
    @IBAction func didTapOnNumber(sender: UIButton) {
        var number = sender.tag
        print(number)
        clicknumber(number: Float(number))
    }
    
    @IBAction func plus(_ sender: Any) {
        if newAttrribute == "=" {
            dataEnterNumberTwo = result
        }
        else {
            dataEnterNumberTwo = dataEnter
        }
        newAttrribute = "+"
        calculat()
        dataEnter = 0
        print(newAttrribute, dataEnterNumberTwo)
    }
    
    @IBAction func moins(_ sender: Any) {
        if newAttrribute == "=" {
            dataEnterNumberTwo = result
        }
        if newAttrribute != "=" && dataEnter != 0 {
            dataEnterNumberTwo = dataEnter
        }
        newAttrribute = "-"
        calculat()
        dataEnter = 0
        print(newAttrribute, dataEnterNumberTwo)
    }
    
    @IBAction func fois(_ sender: Any) {
        if newAttrribute == "=" {
            dataEnterNumberTwo = result
        }
        else {
            dataEnterNumberTwo = dataEnter
        }
        newAttrribute = "*"
        calculat()
        dataEnter = 0
    }
    
    @IBAction func division(_ sender: Any){
        if newAttrribute == "=" {
            dataEnterNumberTwo = result
        }
        else {
            dataEnterNumberTwo = dataEnter
        }
        newAttrribute = "/"
        calculat()
        dataEnter = 0
    }
    
    
    @IBAction func pourcentage(_ sender: Any) {
        if dataEnter != 0 && dataEnterNumberTwo != 0 {
            dataEnter = dataEnter / 100 * dataEnterNumberTwo
            result = dataEnter
        }
        else if dataEnter == 0 && dataEnterNumberTwo != 0 {
            dataEnterNumberTwo /= 100
            result = dataEnterNumberTwo
        }
        else if dataEnter != 0 && dataEnterNumberTwo == 0 {
            dataEnter /= 100
            result = dataEnter
        }
        numberAffect.text = String(result)
    }
    
    @IBAction func equal(_ sender: Any) {
        calculat()
        newAttrribute = "="
        numberAffect.text = String(result)
    }
    
    func calculat() {
        if newAttrribute == "-" {
            result = dataEnterNumberTwo - dataEnter
        }
        else if newAttrribute == "*" {
            result = dataEnterNumberTwo * dataEnter
        }
        else if newAttrribute == "+" {
            result = dataEnterNumberTwo + dataEnter
        }
        else if newAttrribute == "/" {
            result = dataEnterNumberTwo / dataEnter
        }
    }
    
    
    @IBAction func clean(_ sender: Any) {
        if newAttrribute == "=" {
            dataEnter = 0
            dataEnterNumberTwo = 0
            numberAffect.text = String(numberStart)
        }
        else if dataEnter != 0 && dataEnterNumberTwo != 0 {
            dataEnter = 0
            numberAffect.text = String(numberStart)
        }
        else if dataEnter != 0 && dataEnterNumberTwo == 0{
            dataEnter = 0
            numberAffect.text = String(numberStart)
        }
        else if dataEnter == 0 && dataEnterNumberTwo != 0 {
            dataEnterNumberTwo = 0
            numberAffect.text = String(numberStart)
        }
        
        print(dataEnter)
        print(dataEnterNumberTwo)
    }
    
    @IBAction func convertisseur(_ sender: Any) {
    }
}
