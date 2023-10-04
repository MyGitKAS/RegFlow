//
//  ViewController.swift
//  RegFlow
//
//  Created by Алексей Кухленков on 24.09.23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func regButtonAction(_ sender: UIButton) {
        let vc = EnterPhoneNumberViewController()
        navigationController?.pushViewController(vc, animated: true)
        
        
        
//
//
//        let vc = VerifyCodeViewController()
//        present(vc, animated: true)
    }
    
}

