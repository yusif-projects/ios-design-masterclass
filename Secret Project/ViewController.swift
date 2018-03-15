import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menu_view: UIViewX!
    @IBOutlet weak var tableView: UITableView!
    
    var tableData: [Model] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        Data.getData { (data) in
            self.tableData = data
            self.tableView.reloadData()
        }
        
        menu_view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
    }
    
    @IBAction func button_pressed(_ sender: Floating_Action_Button) {
        UIView.animate(withDuration: 0.3) {
            if self.menu_view.transform == .identity {
                self.menu_view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            } else {
                self.menu_view.transform = .identity
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell
        cell.setup(model: tableData[indexPath.row])
        return cell
    }
}
