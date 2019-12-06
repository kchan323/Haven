//
//  LoginView.swift
//  Haven
//
//  Created by Katelin Chan on 11/23/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import UIKit

class LoginView: UIViewController {
    
    var iconImageView: UIImageView!
    var welcomeLabel: UILabel!
    var havenLabel: UILabel!
    var descriptionLabel: UILabel!
    var nameTextField: UITextField!
    var lineView: UIView!
    var nameLabel: UILabel!
    var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()

        iconImageView = UIImageView()
        iconImageView.image = UIImage (named: "appicon")
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.layer.masksToBounds = true
        view.addSubview(iconImageView)
        
        welcomeLabel = UILabel()
        welcomeLabel.text = "WELCOME TO"
        welcomeLabel.textColor = UIColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 14)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        
        havenLabel = UILabel()
        havenLabel.text = "Haven."
        havenLabel.textColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        havenLabel.font = UIFont.boldSystemFont(ofSize: 48)
        havenLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(havenLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.text = "A tool to find and post sublets."
        descriptionLabel.textColor = .black
        descriptionLabel.font = UIFont.systemFont(ofSize: 18)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        nameTextField = UITextField()
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Enter your name.")
        nameTextField.textColor = .black
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        lineView = UIView()
        lineView.backgroundColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineView)
        
        nameLabel = UILabel()
        nameLabel.text = "WHAT'S YOUR NAME?"
        nameLabel.textColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        loginButton = UIButton()
        loginButton.backgroundColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        loginButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = true
        loginButton.setTitle("LET'S BEGIN", for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.setImage(UIImage(named: "caret_white"), for: .normal)
        loginButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 185, bottom: 0, right: 0);
        loginButton.semanticContentAttribute = .forceRightToLeft
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        setupConstraints()
    }
           
    func setupConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 210),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 70),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            havenLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor),
            havenLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            havenLabel.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: havenLabel.bottomAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: havenLabel.bottomAnchor, constant: 125),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            nameTextField.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 5),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            lineView.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            nameLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 65),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            loginButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    @objc func loginButtonPressed(sender: UIButton!) {
        guard let name = nameTextField.text else { return }
        // to do network request
        NetworkManager.postUser(name: name) { (users) in
            userDefaults.set(users[0].name, forKey: "name")
            userDefaults.set(users[0].userId, forKey: "userId")
            self.loginSegue()
        }
    }
    
    func loginSegue () {
        let viewController = CustomTabBarController()
        self.navigationController?.pushViewController(viewController, animated: true)
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

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
