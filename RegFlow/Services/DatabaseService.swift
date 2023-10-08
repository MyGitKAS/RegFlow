//
//  DatabaseService.swift
//  RegFlow
//
//  Created by Алексей Кухленков on 8.10.23.
//

import UIKit
import Firebase
//import FirebaseFirestore


//class DatabaseService {
//    let db = Firestore.firestore()
//
//    func saveUser(_ user: User) {
//        let userRef = db.collection("users").document()
//        let userData: [String: Any] = [
//            "Name": user.name,
//            "Date": user.date,
//            "email": user.email,
//            "Password": user.password
//        ]
//
//        userRef.setData(userData) { error in
//            if let error = error {
//                print("Error saving user: \(error.localizedDescription)")
//            } else {
//                print("User saved successfully!")
//            }
//        }
//    }
//
//    func getUser(withId userId: String, completion: @escaping (User?) -> Void) {
//        let userRef = db.collection("users").document(userId)
//
//        userRef.getDocument { snapshot, error in
//            if let error = error {
//                print("Error retrieving user: \(error.localizedDescription)")
//                completion(nil)
//                return
//            }
//
//            guard let userData = snapshot?.data() else {
//                completion(nil)
//                return
//            }
//
//            let user = User(
//                name: userData["Name"] as? String ?? "",
//                date: userData["Date"] as? String ?? "",
//                email: userData["email"] as? String ?? "",
//                password: userData["Password"] as? String ?? ""
//            )
//            completion(user)
//        }
//    }
//}



class DatabaseService {

    func saveUser(_ user: User) {
        let userRef = Database.database().reference().child("Users").childByAutoId()
        let userData: [String: Any] = [
            "Name": user.name,
            "Date": user.date,
            "Email": user.email,
            "Password": user.password
        ]
        userRef.setValue(userData)
    }

    
    func getUser(withId userId: String, completion: @escaping (User?) -> Void) {
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.observeSingleEvent(of: .value) { snapshot in
            guard let userData = snapshot.value as? [String: Any] else {
                completion(nil)
                return
            }

            let user = User(
                name: userData["Name"] as? String ?? "",
                date: userData["Date"] as? String ?? "",
                email: userData["email"] as? String ?? "",
                password: userData["Password"] as? String ?? ""
            )
            completion(user)
        }
    }
}

