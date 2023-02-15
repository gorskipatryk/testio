import UIKit

final class ServerCell: UITableViewCell {
    private struct Constants {
        static let nameLabelLeftPadding: CGFloat = 16
        static let distanceLabelRightPadding: CGFloat = 26
        static let labelsSpacing: CGFloat = 10
    }
    // MARK: - Subviews

    let nameLabel: UILabel = {
        let label = UILabel()
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let distanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayout()
        setUpConstaints()
    }

    required init?(coder: NSCoder) { nil }

    // MARK: - Private

    private func setUpLayout() {
        selectionStyle = .none
        addSubview(nameLabel)
        addSubview(distanceLabel)
    }

    private func setUpConstaints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.nameLabelLeftPadding),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: distanceLabel.leadingAnchor, constant: -Constants.labelsSpacing),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            distanceLabel.topAnchor.constraint(equalTo: topAnchor),
            distanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.distanceLabelRightPadding),
            distanceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            distanceLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
