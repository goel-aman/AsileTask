//
//  ViewControllerViewModel.swift
//  AsileTask
//
//  Created by aman on 05/11/24.
//

import Foundation

protocol ViewModelToViewService {
    func navigateToOtpVerification()
}

class ViewControllerViewModel {
    let networkManager = NetworkManager()
    var viewModelToViewService: ViewModelToViewService? = nil
    
    func verifyNumber(_ number: String) {
        Task {
            do {
                let number = Number(number: number)
                let response: Status = try await networkManager.postRequest(url: APIEndpoints.OtpLoginNumberInput, body: number)
                if let status = response.status {
                    if status == true {
                        print("success status received....")
                        viewModelToViewService?.navigateToOtpVerification()
                    }
                }
            } catch (let error) {
                print(error)
            }
        }
    }
}
