//
//  ProfileView.swift
//  Haven
//
//  Created by Katelin Chan on 11/19/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import UIKit

class ProfileView: UIViewController {

    var titleLabel: UILabel!
    var headerLabel1: UILabel!
    var headerLabel2: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
            
        titleLabel = UILabel()
        titleLabel.text = "Me."
        titleLabel.textColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 48)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
            
        headerLabel1 = UILabel()
        headerLabel1.text = "Continue a draft."
        headerLabel1.textColor = .black
        headerLabel1.font = UIFont.boldSystemFont(ofSize: 24)
        headerLabel1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel1)
            
        headerLabel2 = UILabel()
        headerLabel2.text = "My listings."
        headerLabel2.textColor = .black
        headerLabel2.font = UIFont.boldSystemFont(ofSize: 24)
        headerLabel2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel2)
            
        setupConstraints()
    }
        
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            titleLabel.widthAnchor.constraint(equalToConstant: 268),
            titleLabel.heightAnchor.constraint(equalToConstant: 56)
        ])

        NSLayoutConstraint.activate([
            headerLabel1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            headerLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            headerLabel1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            headerLabel1.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            headerLabel2.topAnchor.constraint(equalTo: headerLabel1.bottomAnchor, constant: 24),
            headerLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            headerLabel2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            headerLabel2.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
