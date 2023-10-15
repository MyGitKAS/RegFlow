
import UIKit

class AddImageViewController: UIViewController {

    private let widthImage = 250
    private let heightImage = 250
    
    let crossButton = UIButton()
    let sendButton = UIButton()
    let addButton: UIButton = {
          let button = UIButton()
          button.setTitle("Tap to add", for: .normal)
          button.backgroundColor = .clear
          button.layer.cornerRadius = 250 / 2
          button.setTitleColor(.black, for: .normal)
          button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
          return button
      }()
    
    let topLabel = UILabel()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 250 / 2
        imageView.layer.shadowColor = UIColor.green.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowRadius = 8
        imageView.layer.shadowOpacity = 1
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(topLabel)
        view.addSubview(imageView)
        view.addSubview(sendButton)
        view.addSubview(addButton)
        view.addSubview(crossButton)
        
        setConfiguration()
        setupConstraints()
    }
    
    func setConfiguration() {
        //
        imageView.frame.size = CGSize(width: widthImage, height: heightImage)
        imageView.layer.cornerRadius = CGFloat(widthImage / 2)
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.green.cgColor
        imageView.layer.borderWidth = 2
        imageView.lightEffect()
        //
        sendButton.isHidden = true
        sendButton.skeletonButton()
        sendButton.setTitle("Accept", for: .normal)
        //
        crossButton.crossButton()
        crossButton.addTarget(self, action: #selector(crossButtonTapped), for: .touchUpInside)
        //
        topLabel.theTopLabel(text: "Add your photo")
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
        
        crossButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = view.layoutMarginsGuide

        NSLayoutConstraint.activate([
            //
            crossButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10),
            crossButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10),
            //
            topLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            topLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -80),
            //
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -80),
            addButton.widthAnchor.constraint(equalToConstant: 250),
            addButton.heightAnchor.constraint(equalToConstant: 250),
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
