import UIKit

class DayWeatherModel {
    var day_name = ""
    var long_date = ""
    var temperature = ""
    var city = ""
    var weather_icon: UIImage?
    
    init(day_name: String, long_date: String, temperature: String, city: String, weather_icon: UIImage?) {
        self.day_name = day_name
        self.long_date = long_date
        self.temperature = temperature
        self.city = city
        self.weather_icon = weather_icon
    }
}
