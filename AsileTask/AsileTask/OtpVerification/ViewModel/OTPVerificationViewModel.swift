//
//  OTPVerificationViewModel.swift
//  AsileTask
//
//  Created by aman on 06/11/24.
//

import Foundation

protocol OTPViewModelToViewService {
    func navigateToHomeScreen()
}

class OTPVerificationViewModel {
    
    let networkManager = NetworkManager()
    var viewModelToViewService: OTPViewModelToViewService? = nil

    func verifyOTP(_ otp: String, _ number: String) {
        Task {
            do {
                let otpVerificationModel = OTPVerificationModel(number: number, otp: otp)
                
                let response: OTPVerificationResponseModel = try await networkManager.postRequest(url: APIEndpoints.otpVerification, body: otpVerificationModel)
                if let token = response.token {
                    print("token is: \(token)")
                    
                    do {
                        try KeychainManager.save(service: "asile.com", account: "asile-app", password: token.data(using: .utf8) ?? Data())
                    } catch {
                        print(error)
                    }
                    
                    viewModelToViewService?.navigateToHomeScreen()
                }
            } catch (let error) {
                print(error)
            }
        }
    }
}
