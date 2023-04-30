//
//  ViewController.swift
//  WeatherForecastTask
//
//  Created by ChicMic Technologies on 04/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: Outlets
    @IBOutlet weak var latitudeTextLB: UITextField!
    @IBOutlet weak var longitudeTextLb: UITextField!
    
    // MARK: Property
    var weatherViewModel = WeatherViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    // MARK: actions

    
    //Button to pass latitude and longitude
    @IBAction func showWeather(_ sender: UIButton) {
        
        //Unwrapping optionals Values
        guard let latitudeString = latitudeTextLB.text, let latitude = Double(latitudeString) else {
            // The string value of `latitudeTextLb` could not be converted to a `Double`
            print("Invalid latitude value")
            return
        }
        
        guard let longitudeString = longitudeTextLb.text, let longitude = Double(longitudeString) else  {
            // The string value of `latitudeTextLb` could not be converted to a `Double`
            print("Invalid latitude value")
            return
        }
        
        weatherViewModel.fetchWeatherData(latitude: latitude, longitude: longitude) { error in
            if let error = error {
                print("Error fetching weather data: \(error.localizedDescription)")
                return
            }
      
            
            //DispatchQueue.main.async is a method in Swift that allows you to dispatch a block of code asynchronously to the main queue of your application.
            // The async method of the DispatchQueue.main allows you to schedule a block of code to be executed on the main thread asynchronously, meaning that the code will be executed at some point in the future, but not immediately. This is useful when you have long-running or blocking tasks that should not be executed on the main thread, but need to update the UI once they are complete.
            DispatchQueue.main.async {
                
                //This will put WeatherDetailsViewController on the top.
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "WeatherDetailsViewController") as! WeatherDetailsViewController
                    vc.weatherData = WeatherViewModel.weatherData!
                    self.navigationController?.pushViewController(vc, animated: true)

            }

            
        }
        
        
    }
    

}
