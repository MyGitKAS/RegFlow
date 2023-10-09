
import UIKit

class AddImageViewController: UIViewController {

    private let widthImage = 250
    private let heightImage = 250
    
    let crossButton: UIButton = {
          let button = UIButton()
          button.setImage(UIImage(named: "cross_icon"), for: .normal)
          button.addTarget(self, action: #selector(crossButtonTapped), for: .touchUpInside)

          button.translatesAutoresizingMaskIntoConstraints = false
          return button
      }()
    
    let sendButton: UIButton = {
          let button = UIButton()
          button.setTitle("Click Me", for: .normal)
          button.backgroundColor = .green
          button.layer.cornerRadius = 10
          button.setTitleColor(.black, for: .normal)
          button.translatesAutoresizingMaskIntoConstraints = false
          return button
      }()
    
    let addButton: UIButton = {
          let button = UIButton()
          button.setTitle("Tap to add", for: .normal)
          button.backgroundColor = .clear
          button.layer.cornerRadius = 250 / 2
          button.setTitleColor(.black, for: .normal)
          button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
          button.translatesAutoresizingMaskIntoConstraints = false
          return button
      }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Add your photo"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 250 / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.addSubview(label)
        view.addSubview(imageView)
        view.addSubview(sendButton)
        view.addSubview(addButton)
        view.addSubview(crossButton)
        
        setConfig()
        setupConstraints()
    }
    
    func setConfig() {
        //
        imageView.frame.size = CGSize(width: widthImage, height: heightImage)
        imageView.layer.cornerRadius = CGFloat(widthImage / 2)
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.green.cgColor
        imageView.layer.borderWidth = 2
        //
        sendButton.isHidden = true
        //
        crossButton.frame(forAlignmentRect: CGRect(x: self.view.bounds.width + 300, y: 100, width: 40, height: 40))
    }
    
    @objc func addButtonTapped() {
        let imagePickerController = UIImagePickerController()
         imagePickerController.delegate = self
         imagePickerController.sourceType = .photoLibrary // Or .camera To use the camera
         present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc func crossButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension AddImageViewController {
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            //
            label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -80),
            //
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -80),
            addButton.widthAnchor.constraint(equalToConstant: 250),
            addButton.heightAnchor.constraint(equalToConstant: 250),
            //
            crossButton.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 170),
            crossButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -400),
            crossButton.widthAnchor.constraint(equalToConstant: 30),
            crossButton.heightAnchor.constraint(equalToConstant: 230),
            //
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -80),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            //
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            sendButton.widthAnchor.constraint(equalToConstant: 250),
            sendButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension AddImageViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            let originalImage = image
            let newSize = CGSize(width: 250, height: 250)

            if let resizedImage = originalImage.resizeImage(to: newSize) {
                      imageView.image = resizedImage
                      sendButton.isHidden = false
                addButton.isHidden = true
            } else {
                // Handle error
            }
            // Use the resulting image
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
