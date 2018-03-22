import UIKit

class Data {
    
    static func getData(completion: @escaping ([Model]) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            var data = [Model]()
            data.append(Model(title: "Steve Jobs", subTitle: "Apple", image: UIImage.init(named: "steve"), data1: "Co-Founder", data2: ""))
            data.append(Model(title: "Bill Gates", subTitle: "Microsoft", image: UIImage.init(named: "bill"), data1: "Founder", data2: ""))
            data.append(Model(title: "Elon Musk", subTitle: "Tesla, SpaceX, Paypal", image: UIImage.init(named: "elon"), data1: "Co-Founder & CEO", data2: ""))
            
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
    
    static func get_day_and_weather(completion: @escaping (DayWeatherModel) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            let data = DayWeatherModel(day_name: "Friday", long_date: "March 23, 2018", temperature: "32º", city: "London", weather_icon: UIImage.init(named: "sunny"))
            
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}
