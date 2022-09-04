//
//  ConvertStatusViewController.swift
//  Currency-Converter
//
//  Created by Anumol Abraham Chakkungal on 03/09/2022.
//

import UIKit

class ConvertStatusViewController: UIViewController {
    
    var viewModel               = ConverterStatusViewModel()
    weak var delegate           : resetConvertionCalculatorProtocol?

    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.statusLabel.text = self.viewModel.getMessage()
    }
    
    @objc func doneTapped(sender : UIBarButtonItem) {
        
        self.delegate?.restCalculator(status: true)
        self.navigationController?.popToRootViewController(animated: true)
    }
}
