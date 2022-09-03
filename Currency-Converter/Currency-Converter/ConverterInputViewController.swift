//
//  ConverterInputViewController.swift
//  Currency-Converter
//
//  Created by Anumol Abraham Chakkungal on 03/09/2022.
//

import UIKit

class ConverterInputViewController: UIViewController{
    
    var myPicker: UIPickerView! = UIPickerView()
    let currencyAvailableArray = ["GBP", "Doller", "Euro", "Austaralian doller"]
    

    @IBOutlet weak var ToCurrencyTextField: UITextField!
    @IBOutlet weak var FromCurrencyTextField: UITextField!
    @IBOutlet weak var AmountTextFiled: UITextField!
    

    @IBAction func ConvertToCurrencyButtonAction(_ sender: Any) {
        
        self.ToCurrencyTextField.becomeFirstResponder()
    }
    @IBAction func ConverFromCurrencyButton(_ sender: Any) {
        
        self.FromCurrencyTextField.becomeFirstResponder()
    }
    
    func cancelPicker(sender:UIButton) {
        //Remove view when select cancel
        self.FromCurrencyTextField.resignFirstResponder() // To resign the inputView on clicking done.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myPicker = UIPickerView(frame: CGRect(x: 0, y: 40, width: 0, height: 0))
        self.FromCurrencyTextField.delegate = self
        self.ToCurrencyTextField.delegate = self
        self.myPicker.delegate = self
        self.myPicker.dataSource = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    
    func textField(sender: UITextField) {
        
        let toolBar1 = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar1.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar1.barStyle = UIBarStyle.default
        toolBar1.backgroundColor = UIColor.lightGray
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let okBarBtn1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(donePressed))
        toolBar1.setItems([flexSpace,flexSpace,flexSpace,okBarBtn1], animated: true)
        sender.inputAccessoryView = toolBar1
        
        
        sender.inputView = myPicker
        
    }
    
    @objc func donePressed(_ sender: Any) {
        
        self.FromCurrencyTextField.resignFirstResponder()
        self.ToCurrencyTextField.resignFirstResponder()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }


}
extension  ConverterInputViewController : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.textField(sender: textField)
    }

}
extension  ConverterInputViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK: - Delegates and data sources

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        currencyAvailableArray.count
    }
    
    //MARK: Delegates

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyAvailableArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //Your Function
        print("Hello")
    }
    
    
}

