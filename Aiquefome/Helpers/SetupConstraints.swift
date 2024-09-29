import Foundation
import UIKit

public extension UIView {
    func anchorInside(_ superview: UIView, inSafeArea: Bool = false, insets: UIEdgeInsets = .zero) {
        superview.addSubview(self)

        anchor(
            top: inSafeArea ? superview.safeAreaLayoutGuide.topAnchor : superview.topAnchor,
            leading: inSafeArea ? superview.safeAreaLayoutGuide.leadingAnchor : superview.leadingAnchor,
            bottom: inSafeArea ? superview.safeAreaLayoutGuide.bottomAnchor : superview.bottomAnchor,
            trailing: inSafeArea ? superview.safeAreaLayoutGuide.trailingAnchor : superview.trailingAnchor,
            paddingTop: insets.top,
            paddingLeft: insets.left,
            paddingBottom: insets.bottom,
            paddingRight: insets.right
        )
    }

    func addSubviews(subviews _: [UIView]) {
        self.subviews.forEach(self.addSubview)
    }

    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        centerVertical: NSLayoutYAxisAnchor? = nil,
        centerHorizontal: NSLayoutXAxisAnchor? = nil,
        paddingTop: CGFloat = 0,
        paddingLeft: CGFloat = 0,
        paddingBottom: CGFloat = 0,
        paddingRight: CGFloat = 0,
        width: CGFloat = 0,
        height: CGFloat = 0
    ) {
        self.translatesAutoresizingMaskIntoConstraints = false

        if let centerVertical {
            self.centerYAnchor.constraint(equalTo: centerVertical).isActive = true
        }

        if let centerHorizontal {
            self.centerXAnchor.constraint(equalTo: centerHorizontal).isActive = true
        }

        if let top {
            self.topAnchor.constraint(
                equalTo: top,
                constant: paddingTop
            ).isActive = true
        }

        if let leading {
            self.leadingAnchor.constraint(
                equalTo: leading,
                constant: paddingLeft
            ).isActive = true
        }

        if let trailing {
            self.trailingAnchor.constraint(
                equalTo: trailing,
                constant: -paddingRight
            ).isActive = true
        }

        if let bottom {
            self.bottomAnchor.constraint(
                equalTo: bottom,
                constant: -paddingBottom
            ).isActive = true
        }

        if height != 0 {
            self.heightAnchor.constraint(
                equalToConstant: height
            ).isActive = true
        }

        if width != 0 {
            self.widthAnchor.constraint(
                equalToConstant: width
            ).isActive = true
        }
    }

    func setMaxCornerRadius() {
        self.layer.cornerRadius = self.bounds.height / 2
    }
}

public protocol ConstraintBuilder: UIView {
    @discardableResult
    func setVerticalCenter(_ layoutAnchor: NSLayoutYAxisAnchor) -> ConstraintBuilder
    @discardableResult
    func setTop(_ layoutAnchor: NSLayoutYAxisAnchor, with padding: CGFloat) -> ConstraintBuilder
    @discardableResult
    func setBottom(_ layoutAnchor: NSLayoutYAxisAnchor, with padding: CGFloat) -> ConstraintBuilder
    @discardableResult
    func setHorizontalCenter(_ layoutAnchor: NSLayoutXAxisAnchor) -> ConstraintBuilder
    @discardableResult
    func setLeading(_ layoutAnchor: NSLayoutXAxisAnchor, with padding: CGFloat) -> ConstraintBuilder
    @discardableResult
    func setTrailing(_ layoutAnchor: NSLayoutXAxisAnchor, with padding: CGFloat) -> ConstraintBuilder
    @discardableResult
    func setHeight(with value: CGFloat) -> ConstraintBuilder
    @discardableResult
    func setWidth(with value: CGFloat) -> ConstraintBuilder
    @discardableResult
    func setCompressing(_ axis: NSLayoutConstraint.Axis, with priority: UILayoutPriority) -> ConstraintBuilder
    @discardableResult
    func setHugging(_ axis: NSLayoutConstraint.Axis, with priority: UILayoutPriority) -> ConstraintBuilder
}

extension ConstraintBuilder {
    public func setVerticalCenter(_ layoutAnchor: NSLayoutYAxisAnchor) -> any ConstraintBuilder {
        anchor(centerVertical: layoutAnchor)
        return self
    }

    public func setTop(_ layoutAnchor: NSLayoutYAxisAnchor, with padding: CGFloat = .zero) -> any ConstraintBuilder {
        anchor(top: layoutAnchor, paddingTop: padding)
        return self
    }

    public func setBottom(_ layoutAnchor: NSLayoutYAxisAnchor, with padding: CGFloat = .zero) -> any ConstraintBuilder {
        anchor(bottom: layoutAnchor, paddingBottom: padding)
        return self
    }

    public func setHorizontalCenter(_ layoutAnchor: NSLayoutXAxisAnchor) -> any ConstraintBuilder {
        anchor(centerHorizontal: layoutAnchor)
        return self
    }

    public func setLeading(_ layoutAnchor: NSLayoutXAxisAnchor, with padding: CGFloat = .zero) -> any ConstraintBuilder {
        anchor(leading: layoutAnchor, paddingLeft: padding)
        return self
    }

    public func setTrailing(_ layoutAnchor: NSLayoutXAxisAnchor, with padding: CGFloat = .zero) -> any ConstraintBuilder {
        anchor(trailing: layoutAnchor, paddingRight: padding)
        return self
    }

    public func setHeight(with value: CGFloat) -> any ConstraintBuilder {
        anchor(height: value)
        return self
    }

    public func setWidth(with value: CGFloat) -> any ConstraintBuilder {
        anchor(width: value)
        return self
    }

    public func setCompressing(_ axis: NSLayoutConstraint.Axis, with priority: UILayoutPriority) -> any ConstraintBuilder {
        self.setContentCompressionResistancePriority(priority, for: axis)
        return self
    }

    public func setHugging(_ axis: NSLayoutConstraint.Axis, with priority: UILayoutPriority) -> any ConstraintBuilder {
        self.setContentHuggingPriority(priority, for: axis)
        return self
    }
}

