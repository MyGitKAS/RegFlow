
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var letsGoButton: UIButton!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var labelTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        letsGoButton.skeletonButton(title: "Let's Go!")
    }
    
    @IBAction func letsGoButtonAction(_ sender: Any) {
        let vc = EnterPhoneNumberViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
    



