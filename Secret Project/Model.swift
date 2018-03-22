import UIKit

class Model {
    var title = ""
    var subTitle = ""
    var images: [UIImage?]
    var data1 = ""
    var data2 = ""
    
    init(title: String, subTitle: String, images: [UIImage?], data1: String, data2: String) {
        self.title = title
        self.subTitle = subTitle
        self.images = images
        self.data1 = data1
        self.data2 = data2
    }
}
