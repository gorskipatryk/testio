import UIKit

extension UITextField {
    func setLeftImage(image: UIImage) {
        leftViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        leftView = imageView
    }
}
