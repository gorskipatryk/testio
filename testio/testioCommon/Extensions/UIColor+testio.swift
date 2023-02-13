import UIKit

public extension UIColor {
    struct Testio {
        public static let textFieldBackgroundColor = UIColor.color(red: 118, green: 118, blue: 128, alpha: 0.12)
        public static let buttonBackgroundColor = UIColor.color(red: 70, green: 135, blue: 255, alpha: 1)
        public static let white = UIColor.color(red: 255, green: 255, blue: 255, alpha: 1)
    }

    private static func color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
}
