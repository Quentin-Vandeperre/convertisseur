

import UIKit

class TableViewControllerCrypto: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var labelTest: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var array = ["BITCOIN","ETHEREUM","LITECOIN","XRP"]
    
    var searchedIndice = [String]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        indiceSearch.delegate = self
    }
    
    @IBOutlet weak var selectcurrency: UISegmentedControl!
    var numberForCurrencySelect = "0"
    
    @IBAction func currency(_ sender: UISegmentedControl) {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cellCrypto") as! TableViewCellCrypto
        switch selectcurrency.selectedSegmentIndex {
            case 0: cell2.lblCurrencyCrypto.text = "1";
            case 1: cell2.lblCurrencyCrypto.text = "2";
            case 2: cell2.lblCurrencyCrypto.text = "3";
            default: break;
        }
        tableView.reloadData()
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cellCrypto") as! TableViewCellCrypto
//        if numberForCurrencySelect == 1 {
//            cell2.lblCurrencyCrypto.text = "1"
//            print("1")
//        }
//        else if numberForCurrencySelect == 2 {
//            cell2.lblCurrencyCrypto.text = "2"
//            print("2")
//        }
//        else {
//            cell2.lblCurrencyCrypto.text = "3"
//            print("3")
//        }
//        tableView.reloadData()
//        return cell2
//    }
//
//
//            switch sender.selectedSegmentIndex {
//            case 0: cell2.lblCurrencyCrypto.text = "1"
//                print("1")
//            case 1:
//                cell2.lblCurrencyCrypto.text = "2"
//                print("2")
//            case 2:
//                cell2.lblCurrencyCrypto.text = "3"
//                print("3")
//            default:
//                break
//            }
//            tableView.reloadData()
//            return cell2
//        }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedIndice.count
        } else {
            return array.count
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cellCrypto") as! TableViewCellCrypto
        if searching {
            cell.nameCryptoCell.text = searchedIndice[indexPath.row]
            cell.imgCryptoCell.image = UIImage (named:  searchedIndice[indexPath.row]+".png")
        } else {
            cell.nameCryptoCell.text = array[indexPath.row]
            cell.imgCryptoCell.image = UIImage (named:  array[indexPath.row]+".png")
         }
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?){
            if segue.identifier == "segue" {
                let secondVC = segue.destination as! TableViewControllerFavorite
                secondVC.receivedString = array[indexPath.row]
                print(array[indexPath.row])
                print("quentin")
            }
        }
        searching = false
        return cell
    }
    
    @IBOutlet weak var indiceSearch: UISearchBar!
    
    
    
    
}

extension TableViewControllerCrypto: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedIndice = array.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
}

