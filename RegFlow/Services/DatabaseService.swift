
import UIKit
import Firebase
import FirebaseFirestore

class DatabaseService {
    let db = Firestore.firestore()

    func saveUser(_ user: LocalUser) {
        let userRef = db.collection("users").document()
        let userData: [String: Any] = [
            "Name": user.name,
            "Date": user.date,
            "Email": user.email,
            "Password": user.password
        ]

        userRef.setData(userData) { error in
            if let error = error {
                print("Error saving user: \(error.localizedDescription)")
            } else {
                print("User saved successfully!")
            }
        }
    }

    func getUser(withId userId: String, completion: @escaping (LocalUser?) -> Void) {
        let userRef = db.collection("users").document(userId)

        userRef.getDocument { snapshot, error in
            if let error = error {
                print("Error retrieving user: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let userData = snapshot?.data() else {
                completion(nil)
                return
            }

            let user = LocalUser(
                name: userData["Name"] as? String ?? "",
                date: userData["Date"] as? String ?? "",
                email: userData["Email"] as? String ?? "",
                password: userData["Password"] as? String ?? ""
            )
            completion(user)
        }
    }
}


