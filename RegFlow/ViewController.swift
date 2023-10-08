//
//  ViewController.swift
//  RegFlow
//
//  Created by Алексей Кухленков on 24.09.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var letsGoButton: UIButton!
    @IBOutlet weak var topLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        letsGoButton.skeletonButton()
    }

    @IBAction func letsGoButtonAction(_ sender: Any) {
        let vc = EnterPhoneNumberViewController()
        navigationController?.pushViewController(vc, animated: true)
        
        
        
     
        
//        let vc = VerifyCodeViewController()
//          present(vc, animated: true)
//
//                let vc = AddImageViewController()
//                    present(vc, animated: true)
            }
        
    }
    



