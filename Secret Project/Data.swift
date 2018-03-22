import UIKit

class Data {
    
    static func getData(completion: @escaping ([Model]) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            var data = [Model]()
            
            data.append(Model(title: "Finish Home Screen", subTitle: "Web App", images: [], data1: "8", data2: "AM"))
            data.append(Model(title: "Lunch Break", subTitle: "", images: [], data1: "11", data2: "AM"))
            data.append(Model(title: "Design Stand Up", subTitle: "Hangouts", images: [], data1: "2", data2: "PM"))
            
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
    
    static func get_images() -> [UIImage] {
        var result = [UIImage]()
        
        result.append(UIImage.init(named: "steve")!)
        result.append(UIImage.init(named: "elon")!)
        result.append(UIImage.init(named: "bill")!)
        
        return result
    }
    
    static func get_day_and_weather(completion: @escaping (DayWeatherModel?) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            let data = DayWeatherModel(day_name: "Friday", long_date: "March 23, 2018", temperature: "32º", city: "London", weather_icon: UIImage.init(named: "sunny"))
            
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}
