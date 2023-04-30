//
//  ViewController.swift
//  BarAndLineChartsTask
//
//  Created by ChicMic Technologies on 30/03/23.
//

import UIKit
import Charts


private let ITEM_COUNT = 5

class ViewController: UIViewController,ChartViewDelegate, AxisValueFormatter{

    @IBOutlet weak var chartsView: CombinedChartView!
    
    
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var dataTableView: UITableView!
    
    var isVisible=true
    var count=1
    
    var chartDataArray:[DataModel]=[]
    var dataModel=DataModel()
    
    let leftAxisLabel = ["","10k","20k","30k","40k","50k","60k","70k"]
    let rightAxisLabel = ["","10%","20%","30%","40%","50%","60%","70%","80%","90%","100%",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        //Fetching data from datamodel
        chartDataArray=dataModel.dataSet()
        print("Chart data array count:\(chartDataArray.count)")
        dataTableView.layer.cornerRadius=10
        
                chartsView.delegate = self
        chartsView.setScaleEnabled(false)
                chartsView.chartDescription.enabled = true

                chartsView.drawBarShadowEnabled = true
                chartsView.highlightFullBarEnabled = true
        chartsView.layer.cornerRadius=20


        chartsView.drawOrder = [DrawOrder.bar.rawValue,DrawOrder.line.rawValue]
//
                let l = chartsView.legend
                l.wordWrapEnabled = true
                l.horizontalAlignment = .center
                l.verticalAlignment = .bottom
                l.orientation = .horizontal
                l.drawInside = false
                l.enabled=false
        
        //Setting right axis
                let rightAxis = chartsView.rightAxis
                rightAxis.drawGridLinesEnabled=false
                rightAxis.axisLineWidth=0
                rightAxis.axisMinimum=0
                rightAxis.axisMaximum=11
                rightAxis.labelCount=rightAxisLabel.count
                rightAxis.valueFormatter = IndexAxisValueFormatter(values: rightAxisLabel)
                rightAxis.labelFont = UIFont.systemFont(ofSize: 15)
        
        
            //Setting left axis
                let leftAxis = chartsView.leftAxis
                leftAxis.drawGridLinesEnabled=false
                leftAxis.axisLineWidth=0
                leftAxis.labelPosition = .outsideChart

        // Set up the left axis
               leftAxis.axisMinimum = 0
               leftAxis.axisMaximum = 8
               leftAxis.labelCount = leftAxisLabel.count
               leftAxis.valueFormatter = IndexAxisValueFormatter(values: leftAxisLabel)
               leftAxis.labelFont = UIFont.systemFont(ofSize: 15)
    
        
        let xAxis = chartsView.xAxis
            xAxis.labelPosition = .bottom
            xAxis.granularity = 1
            xAxis.valueFormatter = self
            xAxis.drawGridLinesEnabled = false
        xAxis.labelFont=UIFont.systemFont(ofSize: 15)

            // Add space only between left axis and first bar and right axis and last bar
            xAxis.spaceMin = 0.5
            xAxis.spaceMax = 0.5


        
        let marker: BalloonMarker = BalloonMarker(color: UIColor.white, font: .systemFont(ofSize: 12, weight: .bold), textColor: .label, insets: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 15.0, right: 8.0))
                marker.minimumSize = CGSize(width: 140, height: 100)
                chartsView.marker = marker
        
        
        setContentViewHeight()
                self.updateChartData()
        dataTableView.reloadData()
    }

 
    // MARK: methods
    func setContentViewHeight() {
        let chartHeight = chartsView.frame.height + 24
        let tableHeight = isVisible ? dataTableView.rowHeight * CGFloat(chartDataArray.count) : dataTableView.rowHeight + 10
        contentViewHeight.constant = chartHeight + tableHeight + dataTableView.rowHeight
        dataTableView.reloadData()
    }
    
     func updateChartData() {
//            if self.shouldHideData {
//                chartsView.data = nil
//                return
//            }
            
            self.setChartData()
        }
    func setChartData() {
            let data = CombinedChartData()
            data.lineData = generateLineData()
            data.barData = generateBarData()
            chartsView.xAxis.axisMaximum = data.xMax + 0.25
            chartsView.data = data
        
        //Maximum bar visibility in view
        chartsView.setVisibleXRangeMaximum(5)
        
        }
    
    func generateLineData() -> LineChartData {
            let entries = (0..<ITEM_COUNT).map { (i) -> ChartDataEntry in
                let inc = chartDataArray[i].increment/(chartDataArray[i].salary-chartDataArray[i].increment)*100
//                print(i)
//                print(salary[i])
//                print(increment[i])
//                print(inc)
                return ChartDataEntry(x: Double(i), y: inc/10)
            }

            let set = LineChartDataSet(entries: entries)
//        rgba(254, 196, 114, 1)
            set.setColor(UIColor(red: 254/255, green: 196/255, blue: 114/255, alpha: 1))
            set.lineWidth = 2.5
//        rgba(253, 196, 114, 1)
        let circleColor1=UIColor(red: 254/255, green: 196/255, blue: 114/255, alpha: 1)
//            rgba(1, 188, 92, 1)
        let circleColor2=UIColor(red: 1/255, green: 188/255, blue: 92/255, alpha: 1)
        set.circleColors=[circleColor1,circleColor2]
//            set.setCircleColor(UIColor(red: 253/255, green: 196/255, blue: 114/255, alpha: 1))
            set.circleRadius = 10
            set.circleHoleRadius = 10
//            set.fillColor = UIColor(red: 253/255, green: 196/255, blue: 114/255, alpha: 1)
//            set.mode = .cubicBezier
            set.drawValuesEnabled = false
        set.highlightLineWidth=0
//        set.remov
//            set.valueFont = .systemFont(ofSize: 10)
//

        // Ye entries ke dependencies ko left axis se set kar rha hai, matlab ye data ko left wale axis ke data ke through show karega
            set.axisDependency = .right

            return LineChartData(dataSet: set)
        }
        
        func generateBarData() -> BarChartData {
            let entries = (0..<ITEM_COUNT).map { i -> BarChartDataEntry in
//                print("i of barchart::")
//                print(i)
//                print(salary[i])
                return BarChartDataEntry(x: Double(i), y: chartDataArray[i].salary/10000)
            }
            //rgba(134, 118, 255, 1)
//            rgba(134, 118, 255, 1)
            let set = BarChartDataSet(entries: entries)
            set.setColor(UIColor(red: 134/255, green: 118/255, blue: 255/255, alpha: 0.5))
            
//            set1.valueTextColor = UIColor(red: 60/255, green: 220/255, blue: 78/255, alpha: 1)
//            set1.valueFont = .systemFont(ofSize: 10)
            set.axisDependency = .left
            set.drawValuesEnabled = false
            
//            let groupSpace = 0.0
//            let barSpace = 0.8  // x2 dataset
//            let barWidth = 0.1 // x2 dataset
            // (0.45 + 0.02) * 2 + 0.06 = 1.00 -> interval per "group"
            
//            let data: BarChartData = [set1, set2]
            let data: BarChartData = [set]
            data.barWidth = 0.1
            
            // make this BarData object grouped
//            data.groupBars(fromX: 0, groupSpace: Double(groupSpace), barSpace: barSpace)
            
            return data
        }
    
    
   
      
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return chartDataArray[Int(value) % chartDataArray.count].month
    }
    
}

//extension ViewController: AxisValueFormatter {
//    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
//        return months[Int(value) % months.count]
//    }
//}



