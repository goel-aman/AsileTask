//
//  APIEndpoints.swift
//  AsileTask
//
//  Created by aman on 06/11/24.
//

import Foundation

struct APIEndpoints {
    static let baseURL = "https://app.aisle.co/V1"
    
    static let OtpLoginNumberInput = "\(baseURL)/users/phone_number_login"
    
    static let otpVerification = "\(baseURL)/users/verify_otp"
    
    static let notes = "\(baseURL)/users/test_profile_list"
}
