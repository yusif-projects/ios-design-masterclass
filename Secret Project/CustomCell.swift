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
            let previous_views = image_stack_view.subviews
            for view in previous_views {
                view.removeFromSuperview()
            }
            for image in model.images {
                let image_view = UIImageViewX()
                image_view.heightAnchor.constraint(equalTo: image_view.widthAnchor, multiplier: 1.0/1.0).isActive = true
                image_view.image = image
                image_view.borderColor = .white
                image_view.borderWidth = 1.0
                image_view.cornerRadius = 15
                image_view.clipsToBounds = true
                
                image_stack_view.addArrangedSubview(image_view)
            }
        }
    }
}

