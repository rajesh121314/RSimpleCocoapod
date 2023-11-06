//
//  ViewController.swift
//  RSimpleCocoapod
//
//  Created by imrajeshcoder on 11/06/2023.
//  Copyright (c) 2023 imrajeshcoder. All rights reserved.
//

import UIKit
import RSimpleCocoapod

class ViewController: UIViewController {

    let objDP = DatePickerHelper()
    
    @IBOutlet weak var txtDatePicker: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAction_DatePickerClick(_ sender: UIButton) {
        objDP.showDatePicker(txt: txtDatePicker)
    }
    
}

