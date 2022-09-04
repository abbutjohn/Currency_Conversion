//
//  ConverterInputViewController.swift
//  Currency-Converter
//
//  Created by Anumol Abraham Chakkungal on 03/09/2022.
//

import UIKit


class ConverterInputViewController: UIViewController{
    
    var myPicker: UIPickerView! = UIPickerView()
    var viewMode = ConverterInPutViewModel(rateConverter: RateCalculationManager(CurrencyRateCoreDatController: CurrencyRateCoreDataManager()))

    @IBOutlet weak var ToCurrencyTextField: UITextField!
    @IBOutlet weak var FromCurrencyTextField: UITextField!
    @IBOutlet weak var AmountTextFiled: UITextField!
    

    @IBAction func ConvertToCurrencyButtonAction(_ sender: Any) {
        
        self.ToCurrencyTextField.becomeFirstResponder()
        self.viewMode.activeDropDown  = .To
    }
    @IBAction func ConverFromCurrencyButton(_ sender: Any) {
        
        self.FromCurrencyTextField.becomeFirstResponder()
        self.viewMode.activeDropDown  = .from
    }
    
    @IBAction func ConvertAndGoToResult(_ sender: Any) {
        
        if  let fromText  = FromCurrencyTextField.text , let toText = ToCurrencyTextField.text, let amountDoubleValue = Double (AmountTextFiled.text ?? "0.0") {
            self.viewMode.convertedRate(currency: fromText, to: toText, amount: amountDoubleValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myPicker = UIPickerView(frame: CGRect(x: 0, y: 40, width: 0, height: 0))
        self.FromCurrencyTextField.delegate = self
        self.ToCurrencyTextField.delegate = self
        self.myPicker.delegate = self
        self.myPicker.dataSource = self
        self.viewMode.delegate = self
                
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    
    func textField(sender: UITextField) {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = UIBarStyle.default
        toolBar.backgroundColor = UIColor.lightGray
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let okBarBtn1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(donePressed))
        toolBar.setItems([flexSpace,flexSpace,flexSpace,okBarBtn1], animated: true)
        sender.inputAccessoryView = toolBar
        
        
        sender.inputView = self.myPicker
        
    }
    
    @objc func donePressed(_ sender: Any) {
        
        self.FromCurrencyTextField.resignFirstResponder()
        self.ToCurrencyTextField.resignFirstResponder()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func cancelPicker(sender:UIButton) {
        self.FromCurrencyTextField.resignFirstResponder() // To resign the inputView on clicking done.
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
        self.viewMode.currencyAvailableArray.count
    }
    
    //MARK: Delegates

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.viewMode.currencyAvailableArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch self.viewMode.activeDropDown {
        case .from:
            FromCurrencyTextField.text = viewMode.currencyAvailableArray [row]
        case .To:
            ToCurrencyTextField.text = viewMode.currencyAvailableArray [row]
        }
    }
    
}
extension ConverterInputViewController : convertionInputProtocol{
    
    func getConvertionRate(rate: Double, currency: String) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let outpuViewController = storyBoard.instantiateViewController(withIdentifier: "ConvertOutPutViewController") as! ConvertOutPutViewController
        outpuViewController.viewModel   = ConverterOutPutViewModel(gotAmount: rate.rounded(toPlaces: 3),
                                                                   sendAmount: Double(AmountTextFiled.text ?? "0.0") ?? 0.0,
                                                                   sendCurrency: FromCurrencyTextField.text ?? "",
                                                                   gotCurrency: ToCurrencyTextField.text ?? "")
        outpuViewController.delegate = self
        self.navigationController?.pushViewController(outpuViewController, animated: true)

    }
 
}
extension ConverterInputViewController : resetConvertionCalculatorProtocol{
    
    func restCalculator(status: Bool) {
        
        AmountTextFiled.text        = ""
        FromCurrencyTextField.text  = ""
        ToCurrencyTextField.text    = ""
    }
}
