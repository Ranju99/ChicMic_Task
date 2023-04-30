//
//  WeatherViewModel.swift
//  WeatherForecastTask
//
//  Created by ChicMic Technologies on 04/04/23.
//

import Foundation

class WeatherViewModel {
    let apiKey = "338440437a8ecbd65f62425db6a579d3"
    static var weatherData: WeatherData?
//    var locationName: String {
//        return weatherData?.name ?? ""
//    }
//    var temperatureString: String {
//        return "\(weatherData?.main.temp ?? 0)°C"
//    }
//    var icon: UIImage? {
//        if let iconName = weatherData?.weather.first?.icon {
//            return UIImage(named: iconName)
//        }
//        return nil
//    }
    
    func fetchWeatherData(latitude: Double, longitude: Double, completion: @escaping (Error?) -> Void) {
        
        //url for fetching data through api
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {
            completion(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            //Check for errors
            guard let data = data else {
                completion(error)
                return
            }
            
            //Parse JSON
            let decoder = JSONDecoder()
            do {
                let weatherData = try decoder.decode(WeatherData.self, from: data)
                WeatherViewModel.weatherData = weatherData
                completion(nil)
            } catch let error {
                completion(error)
            }
        }
        //it triggers the network request and begins to receive the response data from the server
            dataTask.resume()
    }
}
