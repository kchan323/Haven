//
//  AddSubletViewController.swift
//  Haven
//
//  Created by Anika Talwar on 11/28/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class AddSubletViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var contentView: UIView!
    var scrollView: UIScrollView!
    
    var backButton: UIButton!
    var titleLabel: UILabel!
    var generalLabel: UILabel!
    var lineView1: UIView!
    var defineLabel: UILabel!
    var lineView2: UIView!
    var aptTitleLabel: UILabel!
    var aptTitleTextField: UITextField!
    var lineView3: UIView!
    var locationLabel: UILabel!
    var locationTextField: UITextField!
    var describeLabel: UILabel!
    var aptLabel: UILabel!
    var houseLabel: UILabel!
    
    var boxButton1: UIButton!
    var pressed1: Bool
    var boxButton2: UIButton!
    var pressed2: Bool
    
    var rentLabel: UILabel!
    var lineView4: UIView!
    var setLabel: UILabel!
    var priceView: UIView!
    var priceTextField: UITextField!
    var perMonthLabel: UILabel!
    
    var moreInfoLabel: UILabel!
    var lineView5: UIView!
    var addCaptionLabel: UILabel!
    var captionTextView: UITextView!
    var addPhotoButton: UIButton!
    var selectedImageView: UIImageView!
    var postSubletButton: UIButton!
    
    init(){
        self.pressed1 = false
        self.pressed2 = false
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = .white
        scrollView.autoresizingMask = .flexibleHeight
        scrollView.showsVerticalScrollIndicator = true
        scrollView.bounces = true
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 300)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        contentView = UIView()
        contentView.backgroundColor = .white
        contentView.frame.size = CGSize(width: view.frame.width, height: view.frame.height + 300)
        scrollView.addSubview(contentView)
        
        backButton = UIButton()
        backButton.setImage(UIImage (named: "caret_purple"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)

        titleLabel = UILabel()
        titleLabel.text = "ADD A SUBLET"
        titleLabel.textColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        generalLabel = UILabel()
        generalLabel.text = "General Information"
        generalLabel.textColor = .black
        generalLabel.font = UIFont.systemFont(ofSize: 24)
        generalLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(generalLabel)

        lineView1 = UIView()
        lineView1.backgroundColor = UIColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)
        lineView1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lineView1)

        defineLabel = UILabel()
        defineLabel.text = "Define your space."
        defineLabel.textColor = .black
        defineLabel.font = UIFont.systemFont(ofSize: 14)
        defineLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(defineLabel)

        aptTitleTextField = UITextField()
        aptTitleTextField.attributedPlaceholder = NSAttributedString(string: "Enter Apartment Title.", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)])
        aptTitleTextField.textColor = .black
        aptTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(aptTitleTextField)

        lineView2 = UIView()
        lineView2.backgroundColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        lineView2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lineView2)

        aptTitleLabel = UILabel()
        aptTitleLabel.text = "TITLE"
        aptTitleLabel.textColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        aptTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        aptTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(aptTitleLabel)

        locationTextField = UITextField()
        locationTextField.attributedPlaceholder = NSAttributedString(string: "Enter Apartment Location.", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)])
        locationTextField.textColor = .black
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(locationTextField)

        lineView3 = UIView()
        lineView3.backgroundColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        lineView3.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lineView3)

        locationLabel = UILabel()
        locationLabel.text = "LOCATION"
        locationLabel.textColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        locationLabel.font = UIFont.boldSystemFont(ofSize: 14)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(locationLabel)

        describeLabel = UILabel()
        describeLabel.text = "Describe your space."
        describeLabel.textColor = .black
        describeLabel.font = UIFont.systemFont(ofSize: 14)
        describeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(describeLabel)

        aptLabel = UILabel()
        aptLabel.text = "Apartment"
        aptLabel.textColor = .lightGray
        aptLabel.font = UIFont.systemFont(ofSize: 14)
        aptLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(aptLabel)

        houseLabel = UILabel()
        houseLabel.text = "House"
        houseLabel.textColor = .lightGray
        houseLabel.font = UIFont.systemFont(ofSize: 14)
        houseLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(houseLabel)

        boxButton1 = UIButton()
        boxButton1.layer.borderWidth = 2
        boxButton1.layer.cornerRadius = 4
        boxButton1.layer.borderColor = UIColor.lightGray.cgColor
        boxButton1.addTarget(self, action: #selector(button1Pressed), for: .touchUpInside)
        boxButton1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(boxButton1)

        boxButton2 = UIButton()
        boxButton2.layer.borderWidth = 2
        boxButton2.layer.cornerRadius = 4
        boxButton2.layer.borderColor = UIColor.lightGray.cgColor
        boxButton2.addTarget(self, action: #selector(button2Pressed), for: .touchUpInside)
        boxButton2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(boxButton2)

        rentLabel = UILabel()
        rentLabel.text = "Rent"
        rentLabel.textColor = .black
        rentLabel.font = UIFont.systemFont(ofSize: 24)
        rentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(rentLabel)

        lineView4 = UIView()
        lineView4.backgroundColor = UIColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)
        lineView4.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lineView4)

        setLabel = UILabel()
        setLabel.text = "Set your price."
        setLabel.textColor = .black
        setLabel.font = UIFont.systemFont(ofSize: 14)
        setLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(setLabel)

        priceView = UIView()
        priceView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 255.0 / 255.0, blue: 211.0 / 255.0, alpha: 0.2)
        priceView.layer.cornerRadius = 10
        priceView.layer.masksToBounds = true
        let color = UIColor(red: 0.0, green: 150.0 / 255.0, blue: 161.0 / 255.0, alpha: 1.0)
        priceView.layer.masksToBounds = true
        priceView.layer.borderWidth = 2
        priceView.layer.borderColor = color.cgColor
        priceView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceView)

        priceTextField = UITextField()
        priceTextField.attributedPlaceholder = NSAttributedString(string: "Rent.", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)])
        priceTextField.textColor = UIColor(red: 0.0, green: 150.0 / 255.0, blue: 161.0 / 255.0, alpha: 1.0)
        priceTextField.textAlignment = .right
        priceTextField.font = UIFont.systemFont(ofSize: 24)
        priceTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceTextField)

        perMonthLabel = UILabel()
        perMonthLabel.textColor = UIColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)
        perMonthLabel.text = "PER MONTH"
        perMonthLabel.textAlignment = .right
        perMonthLabel.font = UIFont.boldSystemFont(ofSize: 14)
        perMonthLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(perMonthLabel)

        moreInfoLabel = UILabel()
        moreInfoLabel.text = "More Information"
        moreInfoLabel.textColor = .black
        moreInfoLabel.font = UIFont.systemFont(ofSize: 24)
        moreInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(moreInfoLabel)

        lineView5 = UIView()
        lineView5.backgroundColor = UIColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)
        lineView5.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lineView5)

        addCaptionLabel = UILabel()
        addCaptionLabel.text = "Add a description for your apartment."
        addCaptionLabel.textColor = .black
        addCaptionLabel.font = UIFont.systemFont(ofSize: 14)
        addCaptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(addCaptionLabel)

        captionTextView = UITextView()
        captionTextView.textColor = UIColor.black
        captionTextView.backgroundColor = .white
        let color2 = UIColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)
        captionTextView.layer.masksToBounds = true
        captionTextView.layer.borderWidth = 1
        captionTextView.layer.borderColor = color2.cgColor
        captionTextView.layer.cornerRadius = 5.0
        captionTextView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(captionTextView)

        addPhotoButton = UIButton()
        addPhotoButton.layer.borderWidth = 2
        addPhotoButton.layer.cornerRadius = 4
        addPhotoButton.layer.borderColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0).cgColor
        addPhotoButton.layer.backgroundColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0).cgColor
        addPhotoButton.setTitle("ADD PHOTO", for: UIControl.State.normal)
        addPhotoButton.addTarget(self, action: #selector(addPhotos), for: .touchUpInside)
        addPhotoButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(addPhotoButton)
        
        selectedImageView = UIImageView()
        selectedImageView.image = UIImage (named: "placeholder")
        selectedImageView.layer.borderWidth = 1
        selectedImageView.layer.cornerRadius = 4
        selectedImageView.layer.borderColor = UIColor.black.cgColor
        selectedImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(selectedImageView)
        
        postSubletButton = UIButton()
        postSubletButton.layer.borderWidth = 2
        postSubletButton.layer.cornerRadius = 4
        postSubletButton.layer.borderColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0).cgColor
        postSubletButton.layer.backgroundColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0).cgColor
        postSubletButton.setTitle("POST SUBLET", for: UIControl.State.normal)
        postSubletButton.addTarget(self, action: #selector(postSublet), for: .touchUpInside)
        postSubletButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postSubletButton)
        
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
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            generalLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            generalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            generalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            generalLabel.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            lineView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            lineView1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            lineView1.topAnchor.constraint(equalTo: generalLabel.bottomAnchor),
            lineView1.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            defineLabel.leadingAnchor.constraint(equalTo: generalLabel.leadingAnchor),
            defineLabel.trailingAnchor.constraint(equalTo: generalLabel.trailingAnchor),
            defineLabel.topAnchor.constraint(equalTo: lineView1.bottomAnchor, constant: 12),
            defineLabel.heightAnchor.constraint(equalToConstant: 24)
        ])

        NSLayoutConstraint.activate([
            aptTitleTextField.topAnchor.constraint(equalTo: defineLabel.bottomAnchor, constant: 12),
            aptTitleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            aptTitleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            aptTitleTextField.heightAnchor.constraint(equalToConstant: 32)
        ])

        NSLayoutConstraint.activate([
            lineView2.topAnchor.constraint(equalTo: aptTitleTextField.bottomAnchor),
            lineView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            lineView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            lineView2.heightAnchor.constraint(equalToConstant: 2)
        ])

        NSLayoutConstraint.activate([
            aptTitleLabel.topAnchor.constraint(equalTo: lineView2.bottomAnchor),
            aptTitleLabel.leadingAnchor.constraint(equalTo: lineView2.leadingAnchor),
            aptTitleLabel.trailingAnchor.constraint(equalTo: lineView2.trailingAnchor),
            aptTitleLabel.heightAnchor.constraint(equalToConstant: 32)
        ])

        NSLayoutConstraint.activate([
            locationTextField.topAnchor.constraint(equalTo: aptTitleLabel.bottomAnchor, constant: 12),
            locationTextField.leadingAnchor.constraint(equalTo: aptTitleLabel.leadingAnchor),
            locationTextField.trailingAnchor.constraint(equalTo: aptTitleLabel.trailingAnchor),
            locationTextField.heightAnchor.constraint(equalToConstant: 32)
        ])

        NSLayoutConstraint.activate([
            lineView3.topAnchor.constraint(equalTo: locationTextField.bottomAnchor),
            lineView3.leadingAnchor.constraint(equalTo: locationTextField.leadingAnchor),
            lineView3.trailingAnchor.constraint(equalTo: locationTextField.trailingAnchor),
            lineView3.heightAnchor.constraint(equalToConstant: 2)
        ])

        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: lineView3.bottomAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: lineView3.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: lineView3.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 32)
        ])

        NSLayoutConstraint.activate([
            describeLabel.leadingAnchor.constraint(equalTo: defineLabel.leadingAnchor),
            describeLabel.trailingAnchor.constraint(equalTo: defineLabel.trailingAnchor),
            describeLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 12),
            describeLabel.heightAnchor.constraint(equalToConstant: 24)
        ])

        NSLayoutConstraint.activate([
            aptLabel.leadingAnchor.constraint(equalTo: describeLabel.leadingAnchor, constant: 15),
            aptLabel.trailingAnchor.constraint(equalTo: describeLabel.trailingAnchor),
            aptLabel.topAnchor.constraint(equalTo: describeLabel.bottomAnchor, constant: 12),
            aptLabel.heightAnchor.constraint(equalToConstant: 24)
        ])

        NSLayoutConstraint.activate([
            houseLabel.leadingAnchor.constraint(equalTo: aptLabel.leadingAnchor),
            houseLabel.trailingAnchor.constraint(equalTo: aptLabel.trailingAnchor),
            houseLabel.topAnchor.constraint(equalTo: aptLabel.bottomAnchor, constant: 12),
            houseLabel.heightAnchor.constraint(equalToConstant: 24)
        ])

        NSLayoutConstraint.activate([
            boxButton1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            boxButton1.topAnchor.constraint(equalTo: aptLabel.topAnchor),
            boxButton1.heightAnchor.constraint(equalToConstant: 20),
            boxButton1.widthAnchor.constraint(equalToConstant: 20)
        ])

        NSLayoutConstraint.activate([
            boxButton2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            boxButton2.topAnchor.constraint(equalTo: houseLabel.topAnchor),
            boxButton2.heightAnchor.constraint(equalToConstant: 20),
            boxButton2.widthAnchor.constraint(equalToConstant: 20)
        ])

       NSLayoutConstraint.activate([
            rentLabel.topAnchor.constraint(equalTo: houseLabel.bottomAnchor, constant: 10),
            rentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            rentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            rentLabel.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            lineView4.leadingAnchor.constraint(equalTo: rentLabel.leadingAnchor),
            lineView4.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            lineView4.topAnchor.constraint(equalTo: rentLabel.bottomAnchor),
            lineView4.heightAnchor.constraint(equalToConstant: 1)
        ])

        NSLayoutConstraint.activate([
            setLabel.leadingAnchor.constraint(equalTo: rentLabel.leadingAnchor),
            setLabel.trailingAnchor.constraint(equalTo: rentLabel.trailingAnchor),
            setLabel.topAnchor.constraint(equalTo: lineView4.bottomAnchor, constant: 12),
            setLabel.heightAnchor.constraint(equalToConstant: 24)
        ])

        NSLayoutConstraint.activate([
            priceView.topAnchor.constraint(equalTo: setLabel.bottomAnchor, constant: 12),
            priceView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            priceView.widthAnchor.constraint(equalToConstant: 168),
            priceView.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            priceTextField.topAnchor.constraint(equalTo: priceView.topAnchor, constant: 8),
            priceTextField.leadingAnchor.constraint(equalTo: priceView.leadingAnchor, constant: 12),
            priceTextField.trailingAnchor.constraint(equalTo: priceView.trailingAnchor, constant: -12),
            priceTextField.bottomAnchor.constraint(equalTo: priceView.bottomAnchor, constant: -8)
        ])

        NSLayoutConstraint.activate([
            perMonthLabel.widthAnchor.constraint(equalToConstant: 132),
            perMonthLabel.trailingAnchor.constraint(equalTo: priceView.trailingAnchor),
            perMonthLabel.topAnchor.constraint(equalTo: priceView.bottomAnchor),
            perMonthLabel.heightAnchor.constraint(equalToConstant: 32)
        ])

        NSLayoutConstraint.activate([
            moreInfoLabel.topAnchor.constraint(equalTo: perMonthLabel.bottomAnchor, constant: 10),
            moreInfoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            moreInfoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            moreInfoLabel.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            lineView5.leadingAnchor.constraint(equalTo: rentLabel.leadingAnchor),
            lineView5.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            lineView5.topAnchor.constraint(equalTo: moreInfoLabel.bottomAnchor),
            lineView5.heightAnchor.constraint(equalToConstant: 1)
        ])

        NSLayoutConstraint.activate([
            addCaptionLabel.leadingAnchor.constraint(equalTo: rentLabel.leadingAnchor),
            addCaptionLabel.trailingAnchor.constraint(equalTo: rentLabel.trailingAnchor),
            addCaptionLabel.topAnchor.constraint(equalTo: lineView5.bottomAnchor, constant: 12),
            addCaptionLabel.heightAnchor.constraint(equalToConstant: 24)
        ])

        NSLayoutConstraint.activate([
            captionTextView.topAnchor.constraint(equalTo: addCaptionLabel.bottomAnchor, constant: 12),
            captionTextView.leadingAnchor.constraint(equalTo: addCaptionLabel.leadingAnchor),
            captionTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            captionTextView.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            addPhotoButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            addPhotoButton.topAnchor.constraint(equalTo: captionTextView.bottomAnchor, constant: 12),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 40),
            addPhotoButton.widthAnchor.constraint(equalToConstant: 120)
        ])

        NSLayoutConstraint.activate([
            selectedImageView.leadingAnchor.constraint(equalTo: addPhotoButton.trailingAnchor, constant: 24),
            selectedImageView.heightAnchor.constraint(equalToConstant: 100),
            selectedImageView.topAnchor.constraint(equalTo: addPhotoButton.topAnchor),
            selectedImageView.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            postSubletButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            postSubletButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            postSubletButton.topAnchor.constraint(equalTo: selectedImageView.bottomAnchor, constant: 12),
            postSubletButton.heightAnchor.constraint(equalToConstant: 40),
            postSubletButton.widthAnchor.constraint(equalToConstant: 320)
        ])
        
    }
    
    @objc func postDraft() {
        
        if let img = selectedImageView.image?.pngData() as NSData?,
            let title = aptTitleTextField.text,
            let description = captionTextView.text,
            let address = locationTextField.text,
            let rentString = priceTextField.text,
            let rent = Int(rentString) {
            if let _ = Int(title), let _ = Int(description), let _ = Int(address) {
                return
            } else {
                let apartment = Apartment(title: title, description: description, rent: rent, address: address, is_draft: true)
                apartment.image = Image.encodeImage(imageData: img)
                apartment.imageReceived = selectedImageView.image!
                apartment.posted = true
                NetworkManager.postSublet(apartment: apartment)
            }
        }
        navigationController?.popViewController(animated: true)
    
    }
    
    @objc func postSublet(sender: UIButton!) {
        
        if let img = selectedImageView.image?.pngData() as NSData?,
            let title = aptTitleTextField.text,
            let description = captionTextView.text,
            let address = locationTextField.text,
            let rentString = priceTextField.text,
            let rent = Int(rentString) {
            if let _ = Int(title), let _ = Int(description), let _ = Int(address) {
                return
            } else {
                let apartment = Apartment(title: title, description: description, rent: rent, address: address, is_draft: false)
                apartment.image = Image.encodeImage(imageData: img)
                NetworkManager.postSublet(apartment: apartment)
            }
        }
        navigationController?.popViewController(animated: true)
    
    }

    @objc func backButtonPressed(sender: UIButton!) {
        self.postDraft()
        navigationController?.popViewController(animated: true)
    }
    
    @objc func button1Pressed(sender: UIButton!) {
        if pressed1{
            boxButton1.layer.backgroundColor = UIColor.white.cgColor
            aptLabel.textColor = UIColor.lightGray
            pressed1 = false
        }
        else{
            boxButton1.layer.backgroundColor = UIColor(red: 146.0 / 255.0, green: 97.0 / 255.0, blue: 1.0, alpha: 1.0).cgColor
            aptLabel.textColor = UIColor(red: 146.0 / 255.0, green: 97.0 / 255.0, blue: 1.0, alpha: 1.0)
            pressed1 = true
        }
    }
    
    @objc func button2Pressed(sender: UIButton!) {
        if pressed2{
            boxButton2.layer.backgroundColor = UIColor.white.cgColor
            houseLabel.textColor = UIColor.lightGray
            pressed2 = false
        }
        else{
            boxButton2.layer.backgroundColor = UIColor(red: 146.0 / 255.0, green: 97.0 / 255.0, blue: 1.0, alpha: 1.0).cgColor
            houseLabel.textColor = UIColor(red: 146.0 / 255.0, green: 97.0 / 255.0, blue: 1.0, alpha: 1.0)
            pressed2 = true
        }
    }
    
    @objc func addPhotos(sender: UIButton!){
        
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        guard let photo = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        selectedImageView.image = photo
    }
    
}
