//
//  OTPVerificationModel.swift
//  AsileTask
//
//  Created by aman on 06/11/24.
//


struct OTPVerificationModel: Codable {
    let number: String?
    let otp: String?
}

struct OTPVerificationResponseModel: Codable {
    let token: String?
}


