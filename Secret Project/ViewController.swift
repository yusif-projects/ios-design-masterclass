import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menu_view: UIViewX!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var clock_button: UIButton!
    @IBOutlet weak var messages_button: UIButton!
    @IBOutlet weak var pencil_button: UIButton!
    @IBOutlet weak var floating_button: Floating_Action_Button!
    @IBOutlet weak var search_button: UIButton!
    @IBOutlet weak var menu_button: UIButton!
    
    var tableData: [Model] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        Data.getData { (data) in
            self.tableData = data
            self.tableView.reloadData()
        }
        
        close_menu()
    }
    
    @IBAction func button_pressed(_ sender: Floating_Action_Button) {
        UIView.animate(withDuration: 0.3) {
            if self.menu_view.transform == .identity {
                self.close_menu()
            } else {
                self.menu_view.transform = .identity
            }
        }
        UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            if self.menu_view.transform == .identity {
                self.pencil_button.transform = .identity
                self.messages_button.transform = .identity
                self.clock_button.transform = .identity
            }
        })
    }
    
    func close_menu() {
        self.menu_view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.pencil_button.transform = CGAffineTransform(translationX: 0, y: 15)
        self.messages_button.transform = CGAffineTransform(translationX: 10, y: 10)
        self.clock_button.transform = CGAffineTransform(translationX: 15, y: 0)
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
