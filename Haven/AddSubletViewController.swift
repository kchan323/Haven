//
//  AddSubletViewController.swift
//  Haven
//
//  Created by Anika Talwar on 11/28/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import UIKit

class AddSubletViewController: UIViewController {
    
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
    //var emptyBoxImageView: UIImageView!
    //var filledBoxImageView: UIImageView!
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
    

    
    init(){
        self.pressed1 = false
        self.pressed2 = false
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = view.bounds.size
        view.addSubview(scrollView)
        
        backButton = UIButton(frame: CGRect(x: -15, y: 50, width: 100, height: 50))
        backButton.setImage(UIImage (named: "caret_purple"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        view.addSubview(backButton)
        
        titleLabel = UILabel()
        titleLabel.text = "ADD A SUBLET"
        titleLabel.textColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        generalLabel = UILabel()
        generalLabel.text = "General Information"
        generalLabel.textColor = .black
        generalLabel.font = UIFont.systemFont(ofSize: 20)
        generalLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(generalLabel)
        
        lineView1 = UIView()
        lineView1.backgroundColor = UIColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)
        lineView1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineView1)
        
        defineLabel = UILabel()
        defineLabel.text = "Define your space."
        defineLabel.textColor = .black
        defineLabel.font = UIFont.systemFont(ofSize: 12)
        defineLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(defineLabel)
        
        aptTitleTextField = UITextField()
        aptTitleTextField.attributedPlaceholder = NSAttributedString(string: "Enter Apartment Title.")
        aptTitleTextField.textColor = .black
        
        aptTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aptTitleTextField)
        
        lineView2 = UIView()
        lineView2.backgroundColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        lineView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineView2)
        
        aptTitleLabel = UILabel()
        aptTitleLabel.text = "TITLE"
        aptTitleLabel.textColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        aptTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        aptTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aptTitleLabel)
        
        locationTextField = UITextField()
        locationTextField.attributedPlaceholder = NSAttributedString(string: "Enter Apartment Location.")
        locationTextField.textColor = .black
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(locationTextField)
        
        lineView3 = UIView()
        lineView3.backgroundColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        lineView3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineView3)
        
        locationLabel = UILabel()
        locationLabel.text = "LOCATION"
        locationLabel.textColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        locationLabel.font = UIFont.boldSystemFont(ofSize: 14)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(locationLabel)
        
        describeLabel = UILabel()
        describeLabel.text = "Describe your space."
        describeLabel.textColor = .black
        describeLabel.font = UIFont.systemFont(ofSize: 12)
        describeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(describeLabel)
        
        aptLabel = UILabel()
        aptLabel.text = "Apartment"
        aptLabel.textColor = .lightGray
        aptLabel.font = UIFont.systemFont(ofSize: 12)
        aptLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aptLabel)
        
        houseLabel = UILabel()
        houseLabel.text = "House"
        houseLabel.textColor = .lightGray
        houseLabel.font = UIFont.systemFont(ofSize: 12)
        houseLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(houseLabel)
        
        boxButton1 = UIButton(frame: CGRect(x: 355, y: 368, width: 20, height: 20))
        boxButton1.layer.borderWidth = 2
        boxButton1.layer.cornerRadius = 4
        boxButton1.layer.borderColor = UIColor.lightGray.cgColor
        boxButton1.addTarget(self, action: #selector(button1Pressed), for: .touchUpInside)
        view.addSubview(boxButton1)
        
        boxButton2 = UIButton(frame: CGRect(x: 355, y: 397, width: 20, height: 20))
        boxButton2.layer.borderWidth = 2
        boxButton2.layer.cornerRadius = 4
        boxButton2.layer.borderColor = UIColor.lightGray.cgColor
        boxButton2.addTarget(self, action: #selector(button2Pressed), for: .touchUpInside)
        view.addSubview(boxButton2)
        
        rentLabel = UILabel()
        rentLabel.text = "Rent"
        rentLabel.textColor = .black
        rentLabel.font = UIFont.systemFont(ofSize: 20)
        rentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rentLabel)
        
        lineView4 = UIView()
        lineView4.backgroundColor = UIColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)
        lineView4.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineView4)
        
        setLabel = UILabel()
        setLabel.text = "Set your price."
        setLabel.textColor = .black
        setLabel.font = UIFont.systemFont(ofSize: 12)
    setLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(setLabel)
        
        priceView = UIView()
        priceView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 255.0 / 255.0, blue: 211.0 / 255.0, alpha: 0.2)
        priceView.layer.cornerRadius = 10
        priceView.layer.masksToBounds = true
        priceView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceView)
        
        priceTextField = UITextField()
        priceTextField.attributedPlaceholder = NSAttributedString(string: "Set Rent.")
        priceTextField.textColor = UIColor(red: 0.0, green: 150.0 / 255.0, blue: 161.0 / 255.0, alpha: 1.0)
        priceTextField.textAlignment = .right
        priceTextField.font = UIFont.systemFont(ofSize: 24)
        priceTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceTextField)
        //view.bringSubviewToFront(priceTextField)
        
        perMonthLabel = UILabel()
        perMonthLabel.textColor = UIColor.gray
        perMonthLabel.text = "PER MONTH"
        priceTextField.font = UIFont.systemFont(ofSize: 20)
        
        perMonthLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(perMonthLabel)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            generalLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            generalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            generalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            generalLabel.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            lineView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            lineView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            lineView1.topAnchor.constraint(equalTo: generalLabel.bottomAnchor),
            lineView1.heightAnchor.constraint(equalToConstant: 1)
        ])
        NSLayoutConstraint.activate([
            defineLabel.leadingAnchor.constraint(equalTo: generalLabel.leadingAnchor),
            defineLabel.trailingAnchor.constraint(equalTo: generalLabel.trailingAnchor),
            defineLabel.topAnchor.constraint(equalTo: lineView1.bottomAnchor, constant: 15),
            defineLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            aptTitleTextField.topAnchor.constraint(equalTo: defineLabel.bottomAnchor, constant: 12),
            aptTitleTextField.leadingAnchor.constraint(equalTo: defineLabel.leadingAnchor, constant: 10),
            aptTitleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            aptTitleTextField.heightAnchor.constraint(equalToConstant: 27)
        ])
        
        NSLayoutConstraint.activate([
            lineView2.topAnchor.constraint(equalTo: aptTitleTextField.bottomAnchor),
            lineView2.leadingAnchor.constraint(equalTo: aptTitleTextField.leadingAnchor),
            lineView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            lineView2.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        NSLayoutConstraint.activate([
            aptTitleLabel.topAnchor.constraint(equalTo: lineView2.bottomAnchor),
            aptTitleLabel.leadingAnchor.constraint(equalTo: lineView2.leadingAnchor),
            aptTitleLabel.trailingAnchor.constraint(equalTo: lineView2.trailingAnchor),
            aptTitleLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        
        
        NSLayoutConstraint.activate([
            locationTextField.topAnchor.constraint(equalTo: aptTitleLabel.bottomAnchor, constant: 20),
            locationTextField.leadingAnchor.constraint(equalTo: aptTitleLabel.leadingAnchor),
            locationTextField.trailingAnchor.constraint(equalTo: aptTitleLabel.trailingAnchor),
            locationTextField.heightAnchor.constraint(equalToConstant: 27)
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
            locationLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        NSLayoutConstraint.activate([
            describeLabel.leadingAnchor.constraint(equalTo: defineLabel.leadingAnchor),
            describeLabel.trailingAnchor.constraint(equalTo: defineLabel.trailingAnchor),
            describeLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 15),
            describeLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            aptLabel.leadingAnchor.constraint(equalTo: describeLabel.leadingAnchor, constant: 10),
            aptLabel.trailingAnchor.constraint(equalTo: describeLabel.trailingAnchor),
            aptLabel.topAnchor.constraint(equalTo: describeLabel.bottomAnchor, constant: 15),
            aptLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            houseLabel.leadingAnchor.constraint(equalTo: aptLabel.leadingAnchor),
            houseLabel.trailingAnchor.constraint(equalTo: aptLabel.trailingAnchor),
            houseLabel.topAnchor.constraint(equalTo: aptLabel.bottomAnchor, constant: 15),
            houseLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
       NSLayoutConstraint.activate([
            rentLabel.topAnchor.constraint(equalTo: houseLabel.bottomAnchor, constant: 24),
            rentLabel.leadingAnchor.constraint(equalTo: describeLabel.leadingAnchor),
            rentLabel.trailingAnchor.constraint(equalTo: describeLabel.trailingAnchor),
            rentLabel.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            lineView4.leadingAnchor.constraint(equalTo: rentLabel.leadingAnchor),
            lineView4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            lineView4.topAnchor.constraint(equalTo: rentLabel.bottomAnchor),
        lineView4.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            setLabel.leadingAnchor.constraint(equalTo: rentLabel.leadingAnchor),
            setLabel.trailingAnchor.constraint(equalTo: rentLabel.trailingAnchor),
            setLabel.topAnchor.constraint(equalTo: lineView4.bottomAnchor, constant: 15),
        setLabel.heightAnchor.constraint(equalToConstant: 15)
               ])
        
        NSLayoutConstraint.activate([
                   priceView.topAnchor.constraint(equalTo: setLabel.bottomAnchor, constant: 14),
                   priceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -38),
                   priceView.widthAnchor.constraint(equalToConstant: 168),
                   priceView.heightAnchor.constraint(equalToConstant: 48)
               ])
        
        NSLayoutConstraint.activate([
                   priceTextField.topAnchor.constraint(equalTo: priceView.topAnchor, constant: 12),
                   priceTextField.leadingAnchor.constraint(equalTo: priceView.leadingAnchor, constant: -8),
                   priceTextField.trailingAnchor.constraint(equalTo: priceView.trailingAnchor, constant: -12),
                   priceTextField.heightAnchor.constraint(equalToConstant: 20)
               ])
        
        NSLayoutConstraint.activate([
            perMonthLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 272),
            perMonthLabel.trailingAnchor.constraint(equalTo: priceView.trailingAnchor),
            perMonthLabel.topAnchor.constraint(equalTo: priceView.bottomAnchor),
        perMonthLabel.heightAnchor.constraint(equalToConstant: 32)
               ])

        
        
    }
    
    @objc func backButtonPressed(sender: UIButton!) {
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
    
}


