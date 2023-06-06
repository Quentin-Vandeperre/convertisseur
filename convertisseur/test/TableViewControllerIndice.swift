
import UIKit

class TableViewControllerIndice: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var array = ["SPY500","NSQ","CAC40","DAX"]
    
    var searchedIndice = [String]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        indiceSearch.delegate = self
    }

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
           let cell = tableView.dequeueReusableCell(withIdentifier: "cellIndice") as! TableViewCellIndice
        if searching {
            cell.nameIndiceCell.text = searchedIndice[indexPath.row]
            cell.imgIndiceCell.image = UIImage (named:  searchedIndice[indexPath.row]+".png")
        } else {
            cell.nameIndiceCell.text = array[indexPath.row]
            cell.imgIndiceCell.image = UIImage (named:  array[indexPath.row]+".png")
         }
        searching = false
        return cell
       }
    
    
    @IBOutlet weak var indiceSearch: UISearchBar!
    
}

extension TableViewControllerIndice: UISearchBarDelegate {
    
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
