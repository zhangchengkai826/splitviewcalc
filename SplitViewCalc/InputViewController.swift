//
//  InputViewController.swift
//  SplitViewCalc
//
//  Created by iqra on 2019/4/13.
//  Copyright © 2019 iqra. All rights reserved.
//

import UIKit
import MathParser

class InputViewController: UIViewController {

    @IBOutlet weak var exprDisp: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        clear(self)

        // Do any additional setup after loading the view.
    }


    @IBAction func clear(_ sender: Any) {
        exprDisp.text = ""
    }
    
    
    @IBAction func append(_ sender: UIButton) {
        if(sender.titleLabel!.text! == "x") {
            exprDisp.text?.append("$")
        }
        exprDisp.text?.append(sender.titleLabel!.text!)
        if(sender.titleLabel!.text! == "pi") {
            exprDisp.text?.append("()")
        }
    }
    
    func printErr(_ str: String?) {
        exprDisp.text = str
    }
    
    @IBAction func eval(_ sender: Any) {
        let charset = CharacterSet(charactersIn: "x")
        if(exprDisp.text!.rangeOfCharacter(from: charset) != nil) {
            printErr("Expressions with 'x' cannot be evaluated!")
            return
        }
        
        do {
            let value = try exprDisp.text!.evaluate()
            exprDisp.text = String(format: "%g", value)
        } catch {
            printErr("This expression cannot be evaluated!")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch(identifier) {
            case "Show Graph":
                if let vc = segue.destination as? GraphViewController {
                    vc.plot(exprDisp.text)
                }
            default: break
            }
        }
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
