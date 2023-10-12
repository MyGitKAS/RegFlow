//
//  AuthService.swift
//  RegFlow
//
//  Created by Алексей Кухленков on 9.10.23.
//

import FirebaseAuth
import UIKit

class FirebaseAuthPhoneService {
    
    static let shared = FirebaseAuthPhoneService()
    private var verificationID: String?
    
    func sendVerificationCode(to phoneNumber: String, completion: @escaping (Result<String, Error>) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if let verificationID = verificationID {
                self.verificationID = verificationID
                completion(.success(verificationID))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func signIn(with verificationCode: String, completion: @escaping (Result<User, Error>) -> Void) {
        
        guard let verificationID = verificationID else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Verification ID not found"])))
            return
        }
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if let user = authResult?.user {
                        completion(.success(user))
                    } else if let error = error {
                        completion(.failure(error))
                    }
        }
    }
}



