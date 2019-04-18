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
    
    private var mExpr: String? = nil

    @IBOutlet weak var minTextField: UITextField?
    @IBOutlet weak var maxTextField: UITextField?
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
        if mExpr == nil {
            mExpr = expr;
        }
        
        var min: Double?
        var max: Double?
        if(minTextField == nil || maxTextField == nil || minTextField!.text == nil || maxTextField!.text == nil) {
            min = -1;
            max = 1;
        } else {
            min = Double(minTextField!.text!);
            max = Double(maxTextField!.text!);
            if(min == nil || max == nil || max! <= min!){
                min = -1;
                max = 1;
            }
        }

        let w = Int(self.view.frame.width)
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<w {
            let x = (max! - min!) / (Double(w) - 1) * Double(i) + min!
            let substi = ["x": x]
            do {
                let value = try mExpr!.evaluate(substi)
                let dataEntry = ChartDataEntry(x: x, y: value)
                dataEntries.append(dataEntry)
            } catch {
                printErr("cannot plot in this interval!")
                return
            }
        }
        let dataset = LineChartDataSet(entries: dataEntries, label: mExpr!)
        let data = LineChartData(dataSet: dataset)
        lineChartView.data = data
    }

    @IBAction func onReplotButtonPressed(_ sender: UIButton) {
        plot(nil);
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
