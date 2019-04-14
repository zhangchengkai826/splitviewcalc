//
//  GraphViewController.swift
//  SplitViewCalc
//
//  Created by iqra on 2019/4/13.
//  Copyright © 2019 iqra. All rights reserved.
//

import UIKit
import Charts
import MathParser

class GraphViewController: UIViewController {
    

    @IBOutlet weak var lineChartView: LineChartView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func printErr(_ str: String) {
        lineChartView.data = nil
        lineChartView.noDataText = str
    }
    
    public func plot(_ expr: String?){
        let w = Int(self.view.frame.width)
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<w {
            let substi = ["x": i]
            do {
                let value = try expr!.evaluate(substi)
                let dataEntry = ChartDataEntry(x: Double(i), y: value)
                dataEntries.append(dataEntry)
            } catch {
                printErr("cannot plot in this interval!")
                return
            }
        }
        let dataset = LineChartDataSet(entries: dataEntries, label: expr!)
        let data = LineChartData(dataSet: dataset)
        lineChartView.data = data
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
