import UIKit

class Data {
    
    static func getData(completion: @escaping ([Model]) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            var data = [Model]()
            data.append(Model(title: "Steve Jobs", subTitle: "Apple", image: UIImage.init(named: "steve"), data1: "Co-Founder", data2: ""))
            data.append(Model(title: "Bill Gates", subTitle: "Microsoft", image: UIImage.init(named: "bill"), data1: "Founder", data2: ""))
            data.append(Model(title: "Mark Zuckerberg", subTitle: "Facebook", image: UIImage.init(named: "mark"), data1: "Co-Founder & CEO", data2: ""))
            data.append(Model(title: "Kevin Systrom", subTitle: "Instagram", image: UIImage.init(named: "kevin"), data1: "Co-Founder & CEO", data2: ""))
            data.append(Model(title: "Jack Dorsey", subTitle: "Twitter", image: UIImage.init(named: "jack"), data1: "Co-Founder & CEO", data2: ""))
            
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}
