//
//  OTPVerificationViewController.swift
//  AsileTask
//
//  Created by aman on 06/11/24.
//

import UIKit

class OTPVerificationViewController: UIViewController {
    
    @IBOutlet weak var mobileNumber: UILabel!
    
    @IBOutlet weak var otpValue: UITextField!
    
    var number: String = ""
    let viewModel = OTPVerificationViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mobileNumber.text = number
        
        viewModel.viewModelToViewService = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func continueButtonClicked(_ sender: Any) {
        let otp = otpValue.text!
        
        viewModel.verifyOTP(otpValue.text!, number)
        
    }
    
}


extension OTPVerificationViewController: OTPViewModelToViewService {
    func navigateToHomeScreen() {
        DispatchQueue.main.async {
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.setRootViewController()
            }
        }
    }
    
    
}
