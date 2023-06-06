import UIKit


class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    var searchedCountry = [String]()
    var searching = false
    var select = false
    var indexOfA = 0
    
    var arrayNameCountry = ["EUR", "JPY", "USD", "AUD", "GBP", "CHF"]
    var arrayNameCurrency = ["Euro", "Yen Japonais", "Dollar Americain", "Dollar Australien", "Livre Sterling", "Franc Suiss"]
    var arraySignCurrency = ["€", "¥", "$", "$", "£", "CHF"]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var imgCountryReference: UIImageView!
    @IBOutlet weak var nameCountryReference: UILabel!
    @IBOutlet weak var signCurrencyReference: UILabel!
    @IBOutlet weak var nameCurrencyReference: UILabel!
    @IBOutlet var textField: UITextField!
    
    @IBAction func convertir() {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell2.valueExchangeCell.text = textField.text!
        tableView.reloadData()
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        countrySearch.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedCountry.count
        } else {
            return arrayNameCountry.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        if searching {
            cell.nameCountryCell.text = searchedCountry[indexPath.row]
            cell.imgCountryCell.image = UIImage (named:  searchedCountry[indexPath.row]+".png")
            cell.nameCurencyCell.text = arrayNameCurrency[indexOfA]
            cell.signCurrencyCell.text = arraySignCurrency[indexOfA]
            cell.valueExchangeCell.text = textField.text
        } else {
            cell.nameCountryCell.text = arrayNameCountry[indexPath.row]
            cell.imgCountryCell.image = UIImage (named: arrayNameCountry[indexPath.row]+".png")
            cell.nameCurencyCell.text = arrayNameCurrency[indexPath.row]
            cell.signCurrencyCell.text = arraySignCurrency[indexPath.row]
            cell.valueExchangeCell.text = textField.text
        }
        searching = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if select {
            nameCountryReference.text = arrayNameCountry[indexOfA]
            imgCountryReference.image = UIImage(named: arrayNameCountry[indexOfA]+".png")
            nameCurrencyReference.text = arrayNameCurrency[indexOfA]
            signCurrencyReference.text = arraySignCurrency[indexOfA]
            select = false
        }
        else {
            nameCountryReference.text = arrayNameCountry[indexPath.row]
            imgCountryReference.image = UIImage(named: arrayNameCountry[indexPath.row]+".png")
            nameCurrencyReference.text = arrayNameCurrency[indexPath.row]
            signCurrencyReference.text = arraySignCurrency[indexPath.row]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sideMenuButton(_ sender: UIBarButtonItem) {
        
    }
    
    
    @IBOutlet weak var countrySearch: UISearchBar!
    
    
    var favorit = false
    
    @IBAction func transData(_ sender: Any) {
        
    }
    
    
    
}

extension TableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedCountry = arrayNameCountry.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        select = true
        var searchedCountrySansCrochet = searchedCountry[0]
        indexOfA = arrayNameCountry.firstIndex(of: "\(searchedCountrySansCrochet)") ?? 1
        // pour obtenir l'index de l'élément rechercher
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
}



