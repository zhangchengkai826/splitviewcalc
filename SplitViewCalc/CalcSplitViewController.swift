//
//  CalcSplitViewController.swift
//  SplitViewCalc
//
//  Created by iqra on 2019/4/13.
//  Copyright © 2019 iqra. All rights reserved.
//

import UIKit

class CalcSplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredDisplayMode = .allVisible

        self.delegate = self;
        // Do any additional setup after loading the view.
    }
    
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
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
