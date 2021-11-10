//
//  ViewController.swift
//  CalcApp
//
//  Created by 祐源宏行 on 2021/11/09.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var cost:Double = 0
    
    
    @IBOutlet weak var showLabel: UILabel!
    
    @IBOutlet weak var costField: UITextField!
    
    @IBOutlet weak var taxController: UISegmentedControl!
    
    
    @IBOutlet weak var itemTableView: UITableView!
    
    @IBAction func taxChanger(_ sender: Any) {
    }
    
    @IBAction func addButton(_ sender: Any) {
    }
    
}

