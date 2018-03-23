import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var data1Label: UILabel!
    @IBOutlet weak var data2Label: UILabel!

    func setup(model: Model) {
        titleLabel.text = model.title
        if model.subTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" {
            subtitleLabel.removeFromSuperview()
        } else {
            subtitleLabel.text = model.subTitle
        }
        data1Label.text = model.data1
        data2Label.text = model.data2
    }
}
