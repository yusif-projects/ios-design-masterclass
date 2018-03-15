import UIKit

class Data {
    
    static func getData(completion: @escaping ([Model]) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            var data = [Model]()
            data.append(Model(title: "Steve Jobs", subTitle: "Apple", image: UIImage.init(named: "steve"), data1: "Co-Founder", data2: ""))
            data.append(Model(title: "Bill Gates", subTitle: "Microsoft", image: UIImage.init(named: "bill"), data1: "Founder", data2: ""))
            data.append(Model(title: "Mark Zuckerberg", subTitle: "Facebook", image: UIImage.init(named: "mark"), data1: "Co-Founder & CEO", data2: ""))
            data.append(Model(title: "Sergey Brin", subTitle: "Google", image: UIImage.init(named: "sergey"), data1: "Co-Founder & CEO", data2: ""))
            data.append(Model(title: "Larry Page", subTitle: "Google", image: UIImage.init(named: "larry"), data1: "Co-Founder & CEO", data2: ""))
            data.append(Model(title: "Kevin Systrom", subTitle: "Instagram", image: UIImage.init(named: "kevin"), data1: "Co-Founder & CEO", data2: ""))
            data.append(Model(title: "Jack Dorsey", subTitle: "Twitter", image: UIImage.init(named: "jack"), data1: "Co-Founder & CEO", data2: ""))
            data.append(Model(title: "Drew Houston", subTitle: "Dropbox", image: UIImage.init(named: "drew"), data1: "Founder & CEO", data2: ""))
            data.append(Model(title: "Evan Spiegel", subTitle: "Snapchat", image: UIImage.init(named: "evan"), data1: "Co-Founder & CEO", data2: ""))
            data.append(Model(title: "Jeff Bezos", subTitle: "Amazon", image: UIImage.init(named: "jeff"), data1: "Co-Founder & CEO", data2: ""))
            data.append(Model(title: "Elon Musk", subTitle: "Tesla, SpaceX, Paypal", image: UIImage.init(named: "elon"), data1: "Co-Founder & CEO", data2: ""))
            
            data.sort(by: { (a, b) -> Bool in
                return a.title < b.title
            })
            
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}
