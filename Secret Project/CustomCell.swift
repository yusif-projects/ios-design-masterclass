import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var data1Label: UILabel!
    @IBOutlet weak var data2Label: UILabel!
    @IBOutlet weak var image_stack_view: UIStackView!
    
    func setup(model: Model) {
        titleLabel.text = model.title
        if model.subTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" {
            subtitleLabel.removeFromSuperview()
        } else {
            subtitleLabel.text = model.subTitle
        }
        data1Label.text = model.data1
        data2Label.text = model.data2
        
        if model.images.count > 0 {
            for image in model.images {
                let image_view = UIImageView(frame: CGRect(x: 0, y: 0, width: 31.5, height: 31.5))
                image_view.image = image
                self.image_stack_view.addArrangedSubview(image_view)
            }
        }
    }
}

