//
//  DatePickerHelper.swift
//  RSimpleCocoapod
//
//  Created by vrinsoft on 06/11/23.
//

import Foundation

public class DatePickerHelper {
    
    public init(){}
    
    public static let shared = DatePickerHelper()
    
    public var doneClicked: ((Date) -> Void)?
    public var cancelClicked: (() -> Void)?
    var datePicker : UIDatePicker!
    var textFiled : UITextField?
        
    public func showDatePicker(txt: UITextField, selectedDate: Date? = nil, min: Date? = nil, max: Date? = nil, mode: UIDatePicker.Mode = .date) {
        
        self.textFiled = txt
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 216))
        
        // DatePicker
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = mode
        if #available(iOS 13.4, *) {
            self.datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        self.datePicker.date = selectedDate ?? Date()
        self.datePicker.minimumDate = min
        self.datePicker.maximumDate = max
        
        // 24hr & 12hr issue fixed
        if mode == .time{
            self.datePicker.locale = .init(identifier: "en_US")
            
        }
        
        self.textFiled?.inputView = self.datePicker
        self.textFiled?.inputView?.backgroundColor = .white
        
        //ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.lightGray
        toolBar.barTintColor = .white
        toolBar.sizeToFit()
        
        //Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick(btn:)))
        doneButton.tintColor = .blue
        doneButton.accessibilityIdentifier = self.textFiled?.accessibilityIdentifier
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick(btn:)))
        cancelButton.tintColor = .red
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        self.textFiled?.inputAccessoryView = toolBar
        
        self.textFiled?.becomeFirstResponder()
    }
    
    // toolbar Done button press
    @objc func doneClick(btn: UIBarButtonItem) {
        self.textFiled?.resignFirstResponder()
    }
    
    // toolbar Cancel button press
    @objc func cancelClick(btn: UIBarButtonItem) {
        self.textFiled?.resignFirstResponder()
    }
}
