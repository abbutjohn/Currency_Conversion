//
//  ConvertOutPutViewController.swift
//  Currency-Converter
//
//  Created by Anumol Abraham Chakkungal on 03/09/2022.
//

import UIKit

class ConvertOutPutViewController: UIViewController, ConverterOutPutProtocol {
  
    var viewModel               = ConverterOutPutViewModel()
    weak var delegate           : resetConvertionCalculatorProtocol?

    @IBOutlet weak var fromCurrencyLabel: UILabel!
    @IBOutlet weak var toCurrencylabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.self.viewModel.delegate = self
        fromCurrencyLabel.text  = self.viewModel.getSendlabel()
        toCurrencylabel.text    = self.viewModel.gotlabel()
      
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        self.self.viewModel.timer?.invalidate()
    }
    
    @IBAction func convertButtonAction(_ sender: Any) {
        
        self.gotToNext()
    }
    
    func gotToNext()  {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let statusViewController = storyBoard.instantiateViewController(withIdentifier: "ConvertStatusViewController") as! ConvertStatusViewController
        statusViewController.self.viewModel  = ConverterStatusViewModel(gotAmount: self.viewModel.gotAmount,
                                                                    sendAmount: self.viewModel.sendAmount,
                                                                    sendCurrency: self.viewModel.sendCurrency,
                                                                    gotCurrency: self.viewModel.gotCurrency)
        statusViewController.delegate = self.delegate
        self.navigationController?.pushViewController(statusViewController, animated: true)
    }
    
}
extension ConvertOutPutViewController{
    
    func updateTimeLabel(message: String) {
        
        self.timerLabel.text = message
    }
    
    func gotoStatusScreen(status: Bool) {
        
        if status {
            
            self.gotToNext()
        }
    }
}
