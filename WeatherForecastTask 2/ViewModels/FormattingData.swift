//
//  FormattingData.swift
//  WeatherForecastTask
//
//  Created by ChicMic Technologies on 06/04/23.
//

import Foundation

//let weatherData: WeatherData = WeatherData(metric: true)
//
//
//func tempConversion(_ temp : Double){
//    let temperature = 25.0 // Temperature in Celsius
//    let measurement = Measurement(value: temperature, unit: UnitTemperature.celsius)
//
//    let formatter = MeasurementFormatter()
//    formatter.unitStyle = .short
//    formatter.unitOptions = .providedUnit
//    formatter.numberFormatter.maximumFractionDigits = 0
//    formatter.unitSystem = .metric // Set to Celsius
//
//    let temperatureString = formatter.string(from: measurement)
//    print(temperatureString) // Outputs: 25°C
//
//}


class Converter{
    
    
    func timeConverter(_ timezone:Int, _ sunrise:Int, _ sunset:Int)-> (sunrise:String,sunset:String){
        let timeZone = TimeZone(identifier: String(timezone))
        let sunriseTime = Date(timeIntervalSince1970: Double((sunrise)))
        let sunsetTime = Date(timeIntervalSince1970: Double(sunset))

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = "h:mm a"

        let localSunriseTime = dateFormatter.string(from: sunriseTime)
        let localSunsetTime = dateFormatter.string(from: sunsetTime)

        return (localSunriseTime,localSunsetTime)
    }
    
}
