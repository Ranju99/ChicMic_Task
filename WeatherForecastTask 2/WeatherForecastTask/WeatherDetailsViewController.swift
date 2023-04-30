//
//  WeatherDetailsViewController.swift
//  WeatherForecastTask
//
//  Created by ChicMic Technologies on 06/04/23.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var locationTextLb: UILabel!
    @IBOutlet weak var dateTextLb: UILabel!
    @IBOutlet weak var tempratureTextLb: UILabel!
    @IBOutlet weak var feelsLikeTextLb: UILabel!
    @IBOutlet weak var weatherTypeTextLb: UILabel!
    @IBOutlet weak var windSpeedTextLb: UILabel!
    @IBOutlet weak var pressureTextLb: UILabel!
    @IBOutlet weak var seaLevelTextLb: UILabel!
    @IBOutlet weak var grndLevelTextLb: UILabel!
    @IBOutlet weak var visibility: UILabel!
    @IBOutlet weak var humidityTextLb: UILabel!
    @IBOutlet weak var tempMinTextLb: UILabel!
    @IBOutlet weak var tempMaxTextLb: UILabel!
    @IBOutlet weak var sunriseTextLb: UILabel!
    @IBOutlet weak var sunsetTextLb: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    
    // MARK: Properties
    var weatherData = WeatherData()
    var timer: Timer?
    var converter = Converter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        //Change "back" button color of navigation bar
        navigationController?.navigationBar.tintColor = .black

        
        locationTextLb?.text = weatherData.name
        
        //This will call updateTime function per second
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        feelsLikeTextLb?.text = "Feels like \((weatherData.main?.feels_like!)!)°C"
        weatherTypeTextLb?.text = (weatherData.weather?[0].main)!
        tempratureTextLb?.text = "\(Int((weatherData.main?.temp!)!))°C"
        tempMinTextLb?.text = "Min:\((weatherData.main?.temp_min!)!)°C"
        tempMaxTextLb?.text = "Max:\((weatherData.main?.temp_max!)!)°C"
        windSpeedTextLb?.text = "Wind:\((weatherData.wind?.speed)!)km/h"
        pressureTextLb?.text = "Pressure:\((weatherData.main?.pressure!)!)mbar"
        seaLevelTextLb?.text = "Sea Level:\((weatherData.main?.sea_level!)!)mbar"
        grndLevelTextLb?.text = "Ground Level:\((weatherData.main?.grnd_level!)!)"
        humidityTextLb?.text = "Humidity:\((weatherData.main?.humidity!)!)%"
        visibility?.text = "Visibility:\((weatherData.visibility!)/1000)km/h"
        let (sunrise,sunset) = converter.timeConverter(weatherData.timezone!, (weatherData.sys?.sunrise)!, (weatherData.sys?.sunset)!)
        sunriseTextLb?.text = "\(sunrise)"
        sunsetTextLb?.text = "\(sunset)"
        
        
    }
    
    
    //This function will be called per second to change the time, and will show time in "MMM d, yyyy - h:mm a" format
    @objc func updateTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy - h:mm a"
        dateTextLb.text = dateFormatter.string(from: Date())
    }
    
    
}
