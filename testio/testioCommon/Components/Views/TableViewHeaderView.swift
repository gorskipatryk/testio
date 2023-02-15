import UIKit

public final class TableViewHeaderView: UIView {
    private struct Constants {
        static let labelSize: CGFloat = 12
        static let nameLabelLeadingPadding: CGFloat = 16
        static let labelsTopPadding: CGFloat = 24
        static let labelsBottomPadding: CGFloat = 8
        static let labelsPadding: CGFloat = 10
        static let distanceLabelTrailingPadding: CGFloat = 38
    }

    // MARK: - Subviews

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "SERVER"
        label.textColor = .Testio.gray
        label.font = label.font.withSize(Constants.labelSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let distanceLabel: UILabel = {
        let label = UILabel()
        label.text = "DISTANCE"
        label.textColor = .Testio.gray
        label.font = label.font.withSize(Constants.labelSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initialization

    public init() {
        super.init(frame: .zero)
        setUpLayout()
        setUpConstraints()
    }

    required init?(coder: NSCoder) { nil }

    // MARK: - Private

    private func setUpLayout() {
        backgroundColor = .Testio.headerViewBackground
        addSubview(nameLabel)
        addSubview(distanceLabel)
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.nameLabelLeadingPadding),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.labelsTopPadding),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.labelsBottomPadding)
        ])

        NSLayoutConstraint.activate([
            distanceLabel.leadingAnchor.constraint(greaterThanOrEqualTo: nameLabel.trailingAnchor, constant: Constants.labelsPadding),
            distanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.distanceLabelTrailingPadding),
            distanceLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.labelsTopPadding),
            distanceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.labelsBottomPadding)
        ])
    }
}
