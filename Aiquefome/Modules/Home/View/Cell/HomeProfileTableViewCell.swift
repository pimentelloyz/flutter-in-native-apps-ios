//
//  HomeProfileCollectionViewCell.swift
//  Aiquefome
//
//  Created by Maira Toth on 29/09/24.
//

import Foundation
import UIKit

class HomeProfileTableViewCell: UITableViewCell {
    
    static let identifier = "HomeProfileTableViewCell"
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        logoIcon.anchor(
            width: 24,
            height: 24
        )
        
        buttonStackView.anchor(
            top: mainStackView.bottomAnchor,
            bottom: contentView.bottomAnchor,
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
            paddingBottom: 8
        )
        
        facebookButton.anchor(
            top: buttonStackView.topAnchor,
            leading: logoIcon.trailingAnchor,
            bottom: buttonStackView.bottomAnchor,
            trailing: buttonStackView.trailingAnchor,
            paddingTop: 8,
            paddingLeft: 18,
            paddingBottom: 8,
            paddingRight: 18
        )
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
        selectionStyle = .none
    }
}
