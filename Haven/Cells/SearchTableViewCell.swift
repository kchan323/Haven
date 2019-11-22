//
//  SearchViewCell.swift
//  Haven
//
//  Created by Anika Talwar on 11/20/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import UIKit
class SearchTableViewCell: UITableViewCell {
    
    var aptImageView: UIImageView!
    var titleLabel: UILabel!
    var priceLabel: UILabel!
    var addressLabel: UILabel!

    
//    let padding: CGFloat = 16
//    let labelHeight: CGFloat = 16
//    let caretImageLength: CGFloat = 30

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        aptImageView = UIImageView(frame: CGRect(x: 0,y: 0,width: 10, height: 10))
        //var aptImage = UIImage(named: "large single")
        //aptImageView.image = aptImage
        aptImageView.contentMode = .scaleAspectFill
        aptImageView.translatesAutoresizingMaskIntoConstraints = false
        //aptImageView.layer.masksToBounds = true
        contentView.addSubview(aptImageView)
        
        titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        priceLabel = UILabel()
        priceLabel.textColor = .black
        priceLabel.font = UIFont.systemFont(ofSize: 14)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceLabel)
        
        addressLabel = UILabel()
        addressLabel.textColor = UIColor.lightGray
        addressLabel.font = UIFont.systemFont(ofSize: 12)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(addressLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            //aptImageView.widthAnchor.constraint(equalToConstant: 16),
            //aptImageView.heightAnchor.constraint(equalToConstant: 100),
            aptImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            aptImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            aptImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: addressLabel.leadingAnchor),
            //titleLabel.heightAnchor.constraint(equalToConstant: 24),
            titleLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 6)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,  constant: 0),
            priceLabel.heightAnchor.constraint(equalToConstant: 18),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            addressLabel.heightAnchor.constraint(equalToConstant: 18),
            addressLabel.topAnchor.constraint(equalTo: aptImageView.bottomAnchor, constant: 6)
        ])
       
    }
    
    func configure(for search: Apartment) {
        aptImageView.image = UIImage(named: search.image)
        titleLabel.text = search.title
        priceLabel.text = String(search.price)
        addressLabel.text = search.address
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

