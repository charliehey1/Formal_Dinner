//
//  ViewController.swift
//  FormalDinnerSeating
//
//  Created by Charlie Heyman on 2/13/20.
//  Copyright © 2020 Cate. All rights reserved.
//

import UIKit
var request = Request()

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var tableNumber: UILabel!
    @IBOutlet weak var tableMates: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
       
        
        
        let request = Request()
        
        // call python api and return student data object
            request.getStudents {  [weak self] result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let students):
                    //list of students is full list, subset at this point is full list. may be filtered by search
                    let list = students
                    print(students)
                }
            }
  
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
       
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        } else {
            textField.placeholder = "Type Something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = ""
    }
}

