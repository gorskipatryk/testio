import UIKit

public final class IconTextField: UITextField {
    private struct Constants {
        static let padding: CGFloat = 9
        static let textPadding = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }

    // MARK: - Initialization

    public init(imageName: String) {
        super.init(frame: .zero)
        let image = UIImage(named: imageName) ?? UIImage()
        setLeftImage(image: image)
    }

    required public init?(coder: NSCoder) { nil }

    // MARK: - Overrides

    public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += Constants.padding
        return textRect
    }

    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: Constants.textPadding)
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: Constants.textPadding)
    }
}
