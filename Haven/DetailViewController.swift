//
//  DetailViewController.swift
//  Haven
//
//  Created by Katelin Chan on 11/19/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var backButton: UIButton!
    var titleLabel1: UILabel!
    var apartmentImageView: UIImageView!
    var addressLabel: UILabel!
    var titleLabel2: UILabel!
    var apartmentLabel: UILabel!
    var descriptionLabel: UILabel!
    var rentLabel: UILabel!
    var lineView: UIView!
    var priceView: UIView!
    var priceLabel: UILabel!
    var monthLabel: UILabel!
    
    var apartment: Apartment
    
    var centerY: NSLayoutConstraint!
    var width: NSLayoutConstraint!
    
    init(apartment: Apartment) {
        self.apartment = apartment
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        backButton = UIButton()
        backButton.setImage(UIImage (named: "caret_purple"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        titleLabel1 = UILabel()
        titleLabel1.text = apartment.title.uppercased()
        titleLabel1.textColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        titleLabel1.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel1.textAlignment = .center
        titleLabel1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel1)
        
        apartmentImageView = UIImageView()
        if let image = apartment.imageReceived {
            apartmentImageView.image = image
        } else {
            apartmentImageView.image = UIImage(named: "placeholder")
            NetworkManager.getImage(listingId: apartment.id) { [weak self] image in
                guard let self = self else { return }
                self.apartment.imageReceived = image
                self.apartmentImageView.image = image
            }
        }
        
        apartmentImageView.contentMode = .scaleAspectFit
        apartmentImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(apartmentImageView)
        
        addressLabel = UILabel()
        addressLabel.text = apartment.address
        addressLabel.textColor = UIColor(white: 151.0 / 255.0, alpha: 1.0)
        addressLabel.font = UIFont.systemFont(ofSize: 14)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addressLabel)
        
        titleLabel2 = UILabel()
        titleLabel2.text = apartment.title
        titleLabel2.textColor = .black
        titleLabel2.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        titleLabel2.numberOfLines = 0
        view.addSubview(titleLabel2)
        
        apartmentLabel = UILabel()
        apartmentLabel.text = "APARTMENT"
        apartmentLabel.textColor = UIColor(red: 146.0 / 255.0, green: 97.0 / 255.0, blue: 1.0, alpha: 1.0)
        apartmentLabel.font = UIFont.boldSystemFont(ofSize: 14)
        apartmentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(apartmentLabel)
        
        descriptionLabel = UILabel()
        let description = apartment.description
        let descriptionArray = description.components(separatedBy: ". ")
        descriptionLabel.text = descriptionArray.map { "\($0)" }.joined(separator:"\n")
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .black
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        rentLabel = UILabel()
        rentLabel.text = "Rent"
        rentLabel.textColor = .black
        rentLabel.font = UIFont.systemFont(ofSize: 24)
        rentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rentLabel)
        
        lineView = UIView()
        lineView.backgroundColor = UIColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineView)
        
        priceView = UIView()
        priceView.backgroundColor = UIColor(red: 0.0, green: 150.0 / 255.0, blue: 161.0 / 255.0, alpha: 1.0)
        priceView.layer.cornerRadius = 10
        priceView.layer.masksToBounds = true
        priceView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceView)
        
        priceLabel = UILabel()
        priceLabel.text = "$" + String(apartment.rent)
        priceLabel.textColor = .white
        priceLabel.textAlignment = .right
        priceLabel.font = UIFont.systemFont(ofSize: 24)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceLabel)
        view.bringSubviewToFront(priceLabel)
        
        monthLabel = UILabel()
        monthLabel.text = "PER MONTH"
        monthLabel.textColor = UIColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)
        monthLabel.textAlignment = .right;
        monthLabel.font = UIFont.boldSystemFont(ofSize: 14)
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(monthLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            backButton.heightAnchor.constraint(equalToConstant: 35),
            backButton.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            titleLabel1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            titleLabel1.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel1.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            apartmentImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            apartmentImageView.heightAnchor.constraint(equalToConstant: 300),
            apartmentImageView.topAnchor.constraint(equalTo: titleLabel1.bottomAnchor, constant: 15),
            apartmentImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: apartmentImageView.bottomAnchor, constant: 25),
            addressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            addressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            addressLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel2.topAnchor.constraint(equalTo: addressLabel.bottomAnchor),
            titleLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            apartmentLabel.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor),
            apartmentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            apartmentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            apartmentLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: apartmentLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            rentLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            rentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            rentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            rentLabel.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            lineView.topAnchor.constraint(equalTo: rentLabel.bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            priceView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 14),
            priceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -38),
            priceView.widthAnchor.constraint(equalToConstant: 168),
            priceView.heightAnchor.constraint(equalToConstant: 48)
        ])
               
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: priceView.topAnchor, constant: 8),
            priceLabel.bottomAnchor.constraint(equalTo: priceView.bottomAnchor, constant: -8),
            priceLabel.trailingAnchor.constraint(equalTo: priceView.trailingAnchor, constant: -16),
            priceLabel.widthAnchor.constraint(equalToConstant: 80),
        ])
        
        NSLayoutConstraint.activate([
            monthLabel.topAnchor.constraint(equalTo: priceView.bottomAnchor),
            monthLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -38),
            monthLabel.widthAnchor.constraint(equalToConstant: 132),
            monthLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    @objc func backButtonPressed(sender: UIButton!) {
        navigationController?.popViewController(animated: true)
    }


}
