//
//  WeatherData.swift
//  WeatherForecastTask
//
//  Created by ChicMic Technologies on 04/04/23.
//

import Foundation

struct WeatherData:Codable{
    
    var coord:Coordinate?
    var weather:[Weather]?
    var base:String?
    var main:Main?
    var visibility:Int?
    var wind:Wind?
    var rain:Rain?
    var clouds:Clouds?
    var dt:Int?
    var sys:Sys?
    var timezone:Int?
    var id:Int?
    var name:String?
    var cod:Int?
    
    
}

