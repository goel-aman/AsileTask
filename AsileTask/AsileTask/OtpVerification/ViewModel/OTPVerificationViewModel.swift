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
                    print("aman token is: \(token)")
                    viewModelToViewService?.navigateToHomeScreen()

                    // Todo: Store the value to keychain..
                    // store token to keychain
//                    let keychain = Keychain(service: "com.example.app")
//                    try? keychain.set(authToken, key: "authTokenKey")
                    viewModelToViewService?.navigateToHomeScreen()
                }
            } catch (let error) {
                print(error)
            }
        }
    }
}
