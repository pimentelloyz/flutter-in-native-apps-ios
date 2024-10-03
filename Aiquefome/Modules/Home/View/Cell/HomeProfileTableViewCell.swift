//
//  HomeProfileCollectionViewCell.swift
//  Aiquefome
//
//  Created by Maira Toth on 29/09/24.
//

import Foundation
import UIKit

protocol HomeProfileTableViewCellDelegate: AnyObject {
    func routeToCoupon()
}

class HomeProfileTableViewCell: UITableViewCell {
    
    static let identifier = "HomeProfileTableViewCell"
    var delegate: HomeProfileTableViewCellDelegate?
    
    lazy var profileImageContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        return view
    }()
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 25
        image.image = UIImage(named: "profile")
        return image
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.backgroundColor = .lightGray.withAlphaComponent(0.1)
        stackView.layer.cornerRadius = 8
        
        return stackView
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 4
        
        return stackView
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "e aí, andré"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "fominha há 2 anos"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var buttonStackView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.systemBlue.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    lazy var logoIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 25
        image.image = UIImage(named: "facebook")
        return image
    }()
    
    lazy var facebookButton: UILabel = {
        let label = UILabel()
        label.text = "continuar com o Facebook"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)

        return label
    }()
    
    lazy var actionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 4
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    
    lazy var couponStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            couponIcon,
            couponLabel
        ])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 4
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    
    lazy var couponLabel: UILabel = {
        let label = UILabel()
        label.text = "cupons"
        label.textColor = .darkGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 11, weight: .bold)

        return label
    }()
    
    lazy var couponIcon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "coupon")?.withTintColor(.purple), for: .normal)
        button.addTarget(self, action: #selector(routeToCoupon), for: .touchUpInside)
        return button
    }()
    
    lazy var deliveryStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            deliveryIcon,
            deliveryLabel
        ])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 4
        
        return stackView
    }()
    
    lazy var deliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "pombo-correios"
        label.textAlignment = .center
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 11, weight: .bold)

        return label
    }()
    
    lazy var deliveryIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "carrier-pigeon")?.withTintColor(.purple)
        return image
    }()
    
    lazy var chatStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            chatIcon,
            chatLabel
        ])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 4
        
        return stackView
    }()
    
    lazy var chatLabel: UILabel = {
        let label = UILabel()
        label.text = "falar com o aiq"
        label.textAlignment = .center
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 11, weight: .bold)

        return label
    }()
    
    lazy var chatIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "chat-bubble")?.withTintColor(.purple)
        return image
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func routeToCoupon() {
        delegate?.routeToCoupon()
    }
}

extension HomeProfileTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(profileImageContainer)
        mainStackView.addArrangedSubview(labelStackView)
        
        labelStackView.addArrangedSubview(usernameLabel)
        labelStackView.addArrangedSubview(statusLabel)
        
        profileImageContainer.addSubview(profileImage)
        
        contentView.addSubview(buttonStackView)
        buttonStackView.addSubview(logoIcon)
        buttonStackView.addSubview(facebookButton)
        contentView.addSubview(actionStackView)
        actionStackView.addArrangedSubview(couponStackView)
        actionStackView.addArrangedSubview(deliveryStackView)
        actionStackView.addArrangedSubview(chatStackView)
        contentView.addSubview(lineView)
    }
    
    func setupConstraints() {
        mainStackView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            trailing: contentView.trailingAnchor,
            paddingTop: 24,
            paddingLeft: 16,
            paddingRight: 16
        )
        
        profileImageContainer.anchor(
            width: 75,
            height: 75
        )
        
        profileImage.anchor(
            top: profileImageContainer.topAnchor,
            leading: profileImageContainer.leadingAnchor,
            bottom: profileImageContainer.bottomAnchor,
            trailing: profileImageContainer.trailingAnchor,
            paddingTop: 8,
            paddingLeft: 8,
            paddingBottom: 8,
            paddingRight: 8
        )
        
        buttonStackView.anchor(
            top: mainStackView.bottomAnchor,
            centerHorizontal: contentView.centerXAnchor,
            paddingTop: 14,
            paddingBottom: 12,
            height: 42
        )
        
        logoIcon.anchor(
            top: buttonStackView.topAnchor,
            leading: buttonStackView.leadingAnchor,
            bottom: buttonStackView.bottomAnchor,
            paddingTop: 8,
            paddingLeft: 16,
            paddingBottom: 8,
            width: 24,
            height: 24
        )
        
        facebookButton.anchor(
            top: buttonStackView.topAnchor,
            leading: logoIcon.trailingAnchor,
            bottom: buttonStackView.bottomAnchor,
            trailing: buttonStackView.trailingAnchor,
            paddingTop: 8,
            paddingLeft: 4,
            paddingBottom: 8,
            paddingRight: 18
        )
        
        actionStackView.anchor(
            top: buttonStackView.bottomAnchor,
            leading: contentView.leadingAnchor,
            trailing: contentView.trailingAnchor,
            paddingTop: 16,
            paddingLeft: 4,
            paddingBottom: 8,
            paddingRight: 24,
            height: 58
        )
        
        lineView.anchor(
            top: actionStackView.bottomAnchor,
            leading: contentView.leadingAnchor,
            bottom: contentView.bottomAnchor,
            trailing: contentView.trailingAnchor,
            paddingTop: 16,
            paddingLeft: 24,
            paddingBottom: 16,
            paddingRight: 24,
            height: 1
        )
        
        couponIcon.anchor(
            width: 24,
            height: 24
        )
        
        deliveryIcon.anchor(
            width: 24,
            height: 24
        )
        
        chatIcon.anchor(
            width: 24,
            height: 24
        )
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
        selectionStyle = .none
    }
}
