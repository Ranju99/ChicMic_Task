//
//  DataModel.swift
//  WeatherForecastTask
//
//  Created by ChicMic Technologies on 06/04/23.
//

import Foundation

struct Coordinate:Codable{
    var lon:Double
    var lat:Double
}

struct Weather:Codable{
    var id:Int
    var main:String?
    var description:String?
    var icon:String?
}

struct Main:Codable{
    var temp:Double?
    var feels_like:Double?
    var temp_min:Double?
    var temp_max:Double?
    var pressure:Int?
    var humidity:Int?
    var sea_level:Int?
    var grnd_level:Int?
    
}

struct Wind:Codable{
    
    var speed:Double?
    var deg:Int?
    var gust:Double?
    
}

struct Clouds:Codable{
    var all:Int?
}

struct Sys:Codable{
    var type:Int?
    var id:Int?
    var country:String?
    var sunrise:Int?
    var sunset:Int?
}

struct Rain:Codable{
    var lh:Double?
}
