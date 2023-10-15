

import UIKit
import Firebase
import FirebaseFirestore


class RealtimeDatabaseService {
    static let shared = RealtimeDatabaseService()
    
    private let database: DatabaseReference
    
    private init() {
        database = Database.database().reference()
    }
    
    func saveData(data: [String: Any], atPath path: String, completion: @escaping (Error?) -> Void) {
        database.child(path).childByAutoId().setValue(data) { error, _ in
            completion(error)
        }
    }
    
    func getData(atPath path: String, completion: @escaping ([String: Any]?, Error?) -> Void) {
        database.child(path).observeSingleEvent(of: .value) { snapshot in
            if let value = snapshot.value as? [String: Any] {
                completion(value, nil)
            } else {
                completion(nil, nil)
            }
        } withCancel: { error in
            completion(nil, error)
        }
    }
}

/*
 DatabaseService.shared.saveData(data: ["Name": "John", "Date": 30, "email": "john@example.com","Password" : "1234567899"], atPath: "users") { error in
     if let error = error {
         // Обработка ошибки при сохранении данных
         print("Ошибка сохранения данных: \(error.localizedDescription)")
     } else {
         // Данные успешно сохранены
         print("Данные успешно сохранены")
     }
 }
 */
