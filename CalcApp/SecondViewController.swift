//
//  SecondViewController.swift
//  CalcApp
//
//  Created by 祐源宏行 on 2021/11/10.
//

import UIKit

class SecondViewController: UIViewController {

    
    var resultArray:[Double] = []
    var sum:Double = 0
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.object(forKey: "item") != nil {
            
            resultArray = UserDefaults.standard.object(forKey: "item") as! [Double]
            print(resultArray)
            sum = resultArray.reduce(0) { (num1:Double, num2:Double) -> Double in
                return num1 + num2
            }
            resultLabel.text = String(format: "%.0f", sum)
        } else {
            resultLabel.text = "値を追加してください"
        
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
