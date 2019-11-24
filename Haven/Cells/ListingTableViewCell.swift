//
//  ListingTableViewCell.swift
//  Haven
//
//  Created by Katelin Chan on 11/19/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import UIKit

class ListingTableViewCell: UITableViewCell {

    var addressLabel: UILabel!
    var titleLabel: UILabel!
    var caretImageView: UIImageView!
    
    let padding: CGFloat = 16
//    let labelHeight: CGFloat = 16
//    let caretImageLength: CGFloat = 30

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white

        addressLabel = UILabel()
        addressLabel.textColor = UIColor(red: 0.0, green: 150.0 / 255.0, blue: 161.0 / 255.0, alpha: 1.0)
        addressLabel.font = UIFont.systemFont(ofSize: 12)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(addressLabel)
        
        titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        caretImageView = UIImageView(image: UIImage(named: "caret_teal"))
        caretImageView.contentMode = .scaleAspectFit
        caretImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(caretImageView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            addressLabel.heightAnchor.constraint(equalToConstant: 18),
            addressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: addressLabel.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            titleLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            caretImageView.widthAnchor.constraint(equalToConstant: 12),
            caretImageView.heightAnchor.constraint(equalToConstant: 24),
            caretImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            caretImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(for listing: Apartment) {
        addressLabel.text = listing.address
        titleLabel.text = listing.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
