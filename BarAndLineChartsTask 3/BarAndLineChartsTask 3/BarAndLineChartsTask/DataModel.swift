//
//  DataModel.swift
//  BarAndLineChartsTask
//
//  Created by ChicMic Technologies on 31/03/23.
//

import Foundation


let monthsData = ["Jan 15","Aug 17","Sep 18","Jun 19","Oct 20"]
//,"Nov 15", "Dec 23","Nov 15", "Dec 23","Nov 15", "Dec 23"]

let salaryData:[Double] = [20500,23000,28000,36400,40000]
//                           ,34890,23678,34000,31684,26795,45067]
let incrementData:[Double] = [0,2500,5000,8400,3600]
//                              ,3900,700,1400,1893,956,2500]
let designationData = ["Jr. UI UX","Jr. UI UX","Sr. UI UX","Pr. UI UX","UX Analyst"]
//                       ,"UX Analyst","UX Analyst","UX Analyst","UX Analyst","UX Analyst","UX Analyst"]
let bandData:[Double] = [7,7,6,6,5.2]
//                         ,4,8,7,6,5.5,6.3]


class DataModel{
    
    
    var salary:Double
    var increment:Double
    var band:Double
    var month:String
    var designation:String
    
    init(salary: Double, increment: Double, band: Double, month: String, designation: String) {
        self.salary = salary
        self.increment = increment
        self.band = band
        self.month = month
        self.designation = designation
    }
    
    init(){
        self.salary=0.0
        self.increment=0.0
        self.band=0.0
        self.month=""
        self.designation=""
    }
    
    
    func dataSet() -> [DataModel]{
        var employeesData:[DataModel] = []
        
        for i in 0..<salaryData.count{
            employeesData.append(DataModel(salary: salaryData[i], increment: incrementData[i], band: bandData[i], month: monthsData[i], designation: designationData[i]))
        }
        
        return employeesData
    }
}



