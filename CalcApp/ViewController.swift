//
//  ViewController.swift
//  CalcApp
//
//  Created by 祐源宏行 on 2021/11/09.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemTableView.delegate = self
        itemTableView.dataSource = self
        costsArray.removeAll()
        costField.addTarget(self, action: #selector(costFieldDidChange), for: .editingChanged)
        costField.keyboardType = UIKeyboardType.numberPad
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "item")
    }
    
    var cost:Double = 0
    var addTaxCost:Double = 0
    var costsArray:[Double] = []
    var addTaxCostString:String = ""
    
    @IBOutlet weak var showLabel: UILabel!
    
    @IBOutlet weak var costField: UITextField!
    
    @IBOutlet weak var taxController: UISegmentedControl!
    
    @IBOutlet weak var itemTableView: UITableView!
    
    @objc func costFieldDidChange(sender: UITextField) {  //値の取得
            
            if costField.text != "" &&  Int(costField.text!) != nil {
                if taxController.selectedSegmentIndex == 0 {
                    calc(tax:1.1)
                } else {
                    calc(tax: 1.08)
                }
            } else {
                costField.text = ""
                showLabel.text = ""
            }
        }
    
    
    
    @IBAction func taxChanger(_ sender: Any) {
        //計算して結果表示
        if costField.text != "" && Int(costField.text!) != nil {
            if taxController.selectedSegmentIndex == 0 {
                calc(tax: 1.1)
            } else {
                calc(tax: 1.08)
            }
        } else {
            costField.text = ""
            showLabel.text = ""
        }
    }
    
    //メソッド作成
    func calc(tax:Double) {
        cost = Double(costField.text!)!
        addTaxCost = cost * Double(tax)
        addTaxCostString = String(format: "%.0f", addTaxCost)
        showLabel.text = addTaxCostString
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        if addTaxCost != 0 {
            print(addTaxCost)
            costsArray.append(contentsOf: [addTaxCost])
            
            UserDefaults.standard.set(costsArray, forKey: "item")
            
            addTaxCost = 0
            costField.text = ""
            showLabel.text = ""
            
            self.itemTableView.reloadData()
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return costsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "\(costsArray[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            costsArray.remove(at:  indexPath.row)
            
            UserDefaults.standard.set(costsArray, forKey: "item")
            
            itemTableView.reloadData()
        }
    }
    
    
}

