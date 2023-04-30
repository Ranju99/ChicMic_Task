//
//  ViewControllerExtension.swift
//  BarAndLineChartsTask
//
//  Created by ChicMic Technologies on 31/03/23.
//

import Foundation
import UIKit

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isVisible{
            return chartDataArray.count+1
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row==0{
            if count%2==0{
                isVisible=true
                count += 1
                dataTableView.reloadData()
                setContentViewHeight()
                
            }else{
                isVisible=false
                count += 1
                dataTableView.reloadData()
                setContentViewHeight()
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell=dataTableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! DataTableViewCell
        if indexPath.row==0{
//            rgba(12, 162, 251, 1)
            //Background color of first cell
            cell.backgroundColor = UIColor(red: 12/255, green: 162/255, blue: 251/255, alpha: 1)
            
            //Alignment of labels for first row
            cell.incrementTextLabel.textAlignment = .right
            cell.salaryTextLabel.textAlignment = .center
            cell.designationTextLabel.textAlignment = .left
            cell.bandTextLabel.textAlignment = .left
            cell.monthTextLabel.textAlignment = .left
            //Data passing to label
            cell.monthTextLabel.text="Month"
            cell.bandTextLabel.text="Band"
            cell.designationTextLabel.text="Designation"
            cell.salaryTextLabel.text="Salary"
            cell.incrementTextLabel.text="Increment"
            return cell
        }else{
            //Background color of cells
            if indexPath.row%2==0{
//                rgba(48, 128, 234, 0.1)
                cell.backgroundColor=UIColor(red: 48/255, green: 128/255, blue: 234/255, alpha: 0.1)
            }else{
//                rgba(48, 128, 234, 0.15)
                cell.backgroundColor=UIColor(red: 48/255, green: 128/255, blue: 234/255, alpha: 0.15)
            }
            
            
            //Formatting data's
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.locale = Locale.current
            let formattedSalary = formatter.string(from: NSNumber(value: Int(chartDataArray[chartDataArray.count-indexPath.row].salary)))

            var formattedIncrement:String? = ""
            if Int(chartDataArray[chartDataArray.count-indexPath.row].increment) == 0{
//              //Setting precision
                let myFormattedDouble = String(format: "%.1f", chartDataArray[chartDataArray.count-indexPath.row].increment)
//                let formattedValue = formatter.string(from: NSNumber(value: Int(myFormattedDouble) ?? 0))
//                print(myFormattedDouble)
                formattedIncrement = myFormattedDouble
            }else{
                let formattedValue = formatter.string(from: NSNumber(value: Int(chartDataArray[chartDataArray.count-indexPath.row].increment)))
                formattedIncrement=formattedValue
            }

            var band=""
            let myDouble = chartDataArray[chartDataArray.count-indexPath.row].band
            let fractionalPart = myDouble.truncatingRemainder(dividingBy: 1)
            let precisionValue = String(format: "%.1f", fractionalPart)
            if precisionValue == "0.0"{
                band=String(Int(chartDataArray[chartDataArray.count-indexPath.row].band))
            }else{
                band=String(chartDataArray[chartDataArray.count-indexPath.row].band)
            }

            
            //Data passing to label for row other than first
            cell.monthTextLabel.text=chartDataArray[chartDataArray.count-indexPath.row].month
            cell.bandTextLabel.text=band
            cell.designationTextLabel.text=chartDataArray[chartDataArray.count-indexPath.row].designation
            cell.salaryTextLabel.text = formattedSalary
            cell.incrementTextLabel.text=formattedIncrement
            return cell
        }
    
    }
    
    
    
    
}
