//
//  ViewController.swift
//  AsileTask
//
//  Created by aman on 05/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var continueButton: UIButton!
    
    var viewModel = ViewControllerViewModel()
    
    @IBOutlet weak var countryCode: UITextField!
    
    @IBOutlet weak var number: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
        viewModel.viewModelToViewService = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func continueButton(_ sender: Any) {
        var codePlusNumber = "\(countryCode.text!)\(number.text!)"
        viewModel.verifyNumber(codePlusNumber)
    }
    
    func setupButton() {
        continueButton.layer.cornerRadius = 20
    }
    
}

extension ViewController: ViewModelToViewService {
    func navigateToOtpVerification() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // "Main" is the storyboard name
        
        if let viewController = storyboard.instantiateViewController(withIdentifier: "OTPVerificationViewController") as? OTPVerificationViewController {
            viewController.number = "\(countryCode.text!)\(number.text!)"
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}

