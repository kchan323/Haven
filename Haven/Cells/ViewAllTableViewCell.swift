//
//  ViewAllTableViewCell.swift
//  Haven
//
//  Created by Katelin Chan on 12/6/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import UIKit

class ViewAllTableViewCell: UITableViewCell {

    var aptImageView: UIImageView!
    var addressLabel: UILabel!
    var titleLabel: UILabel!
    var priceLabel: UILabel!
    
    let padding: CGFloat = 16
    let imageLength: CGFloat = 160

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        
        aptImageView = UIImageView()
        aptImageView.translatesAutoresizingMaskIntoConstraints = false
        aptImageView.contentMode = .scaleAspectFill
        aptImageView.layer.masksToBounds = true
        contentView.addSubview(aptImageView)
        
        addressLabel = UILabel()
        addressLabel.textColor = UIColor(white: 151.0 / 255.0, alpha: 1.0)
        addressLabel.font = UIFont.systemFont(ofSize: 14)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(addressLabel)
        
        titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        priceLabel = UILabel()
        priceLabel.backgroundColor = UIColor(red: 0.0, green: 209.0 / 255.0, blue: 199.0 / 255.0, alpha: 1.0)
        priceLabel.layer.cornerRadius = 10
        priceLabel.layer.masksToBounds = true
        priceLabel.textColor = .white
        priceLabel.textAlignment = .center;
        priceLabel.font = UIFont.systemFont(ofSize: 18)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            aptImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            aptImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            aptImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            aptImageView.heightAnchor.constraint(equalToConstant: imageLength)
        ])
        
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: aptImageView.bottomAnchor, constant: padding),
            addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            addressLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            priceLabel.widthAnchor.constraint(equalToConstant: 75),
            priceLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configure(for search: Apartment) {
        aptImageView.image = UIImage (named: search.image)
        addressLabel.text = search.address
        titleLabel.text = search.title
        priceLabel.text = "$" + String(search.rent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
