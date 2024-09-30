//
//  HomeMenuCollectionViewCell.swift
//  Aiquefome
//
//  Created by Maira Toth on 29/09/24.
//

import Foundation
import UIKit

class HomeMenuTableViewCell: UITableViewCell {
    
    static let identifier = "HomeMenuTableViewCell"
    
    lazy var customIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    
    lazy var  titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
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

extension HomeMenuTableViewCell {
    func configure(item: MenuItem?) {
        customIcon.image = item?.icon?.withTintColor(.purple)
        titleLabel.text = item?.menuTitle
    }
}

extension HomeMenuTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(customIcon)
        contentView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        
        customIcon.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            bottom: contentView.bottomAnchor,
            paddingTop: 12,
            paddingLeft: 16,
            paddingBottom: 12,
            width: 16,
            height: 16
        )
        
        titleLabel.anchor(
            top: contentView.topAnchor,
            leading: customIcon.leadingAnchor,
            bottom: contentView.bottomAnchor,
            trailing: contentView.trailingAnchor,
            paddingTop: 12,
            paddingLeft: 24,
            paddingBottom: 12,
            paddingRight: 16
        )
    }
    
    func setupAdditionalConfiguration() {
        selectionStyle = .none
    }
}
