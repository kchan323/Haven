//
//  ApartmentCollectionViewCell.swift
//  Haven
//
//  Created by Katelin Chan on 11/21/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import UIKit

class ApartmentCollectionViewCell: UICollectionViewCell {

    var photoImageView: UIImageView!
    var priceLabel: UILabel!
    var titleLabel: UILabel!
    
    let padding: CGFloat = 7
    let imageLength: CGFloat = 90

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath

        photoImageView = UIImageView()
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.layer.masksToBounds = true
        contentView.addSubview(photoImageView)
        
        priceLabel = UILabel()
        priceLabel.textColor = UIColor(red: 0.0, green: 150.0 / 255.0, blue: 161.0 / 255.0, alpha: 1.0)
        priceLabel.font = UIFont.systemFont(ofSize: 18)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceLabel)
        
        titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: imageLength)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: padding),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            priceLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func configure(for apartment: Apartment) {
        photoImageView.image = UIImage(named: apartment.image)
        priceLabel.text = "$" + String(apartment.rent)
        titleLabel.text = apartment.title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
