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
    @IBOutlet weak var day_label: UILabel!
    @IBOutlet weak var date_label: UILabel!
    @IBOutlet weak var temp_label: UILabel!
    @IBOutlet weak var city_label: UILabel!
    @IBOutlet weak var weather_icon: UIImageView!
    @IBOutlet weak var date_view: UIStackView!
    @IBOutlet weak var weather_view: UIStackView!
    
    var tableData: [Model] = []
    var day_weather_data: DayWeatherModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        Data.get_day_and_weather { (data) in
            if let data = data {
                self.day_label.text = data.day_name
                self.date_label.text = data.long_date
                self.temp_label.text = data.temperature
                self.city_label.text = data.city
                self.weather_icon.image = data.weather_icon
            }
        }
        
        Data.getData { (data) in
            self.tableData = data
            self.tableView.reloadData()
        }
        
        close_menu()
        setup_animated_controls()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.4, delay: 0.4, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.date_view.transform = .identity
        })
        UIView.animate(withDuration: 0.4, delay: 0.5, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.weather_view.transform = .identity
        })
    }
    
    @IBAction func button_pressed(_ sender: Floating_Action_Button) {
        UIView.animate(withDuration: 0.2) {
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
    
    func setup_animated_controls() {
        self.date_view.transform = CGAffineTransform(translationX: -(date_view.frame.width) - 50, y: 0)
        self.weather_view.transform = CGAffineTransform(translationX: weather_view.frame.width + 50, y: 0)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = tableData[indexPath.row]
        var cell: CustomCell!
        
        if model.images.count > 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell_2") as! CustomCell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell_1") as! CustomCell
        }
        
        cell.setup(model: tableData[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = tableData[indexPath.row]
        if model.images.count > 0 {
            return 120
        } else {
            return 80
        }
    }
}
