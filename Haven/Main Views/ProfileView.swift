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
    var lineView1: UIView!
    
    var tableView1: UITableView!
    let reuseIdentifier1 = "DraftCellReuse"
    let cellHeight: CGFloat = 70
    var drafts: [Apartment] = []
    
    var headerLabel2: UILabel!
    var lineView2: UIView!
    
    var tableView2: UITableView!
    let reuseIdentifier2 = "ListingCellReuse"
    var listings: [Apartment] = []
    
    var addButton: UIButton!
    var lineView3: UIView!
    
    var spinner = UIActivityIndicatorView()
    var getDraftsInitial = true
    var getListingsInitial = true

    override func viewDidAppear(_ animated: Bool) {
        self.getMyDrafts()
        self.getMyListings()
    }

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
        
        lineView1 = UIView()
        lineView1.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 211.0 / 255.0, alpha: 1.0)
        lineView1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineView1)
        
        tableView1 = UITableView()
        tableView1.dataSource = self
        tableView1.delegate = self
        tableView1.layer.cornerRadius = 10;
        tableView1.clipsToBounds = true;
        tableView1.layer.masksToBounds = true;
        tableView1.layer.borderWidth = 1
        tableView1.layer.borderColor = UIColor.gray.cgColor
        tableView1.layer.borderColor = tableView1.layer.borderColor?.copy(alpha: 0.25)
        tableView1.backgroundColor = .white
        tableView1.showsVerticalScrollIndicator = false
        tableView1.translatesAutoresizingMaskIntoConstraints = false
        tableView1.register(DraftTableViewCell.self, forCellReuseIdentifier: reuseIdentifier1)
        view.addSubview(tableView1)
            
        headerLabel2 = UILabel()
        headerLabel2.text = "My listings."
        headerLabel2.textColor = .black
        headerLabel2.font = UIFont.boldSystemFont(ofSize: 24)
        headerLabel2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel2)
        
        lineView2 = UIView()
        lineView2.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 211.0 / 255.0, alpha: 1.0)
        lineView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineView2)
        
        tableView2 = UITableView()
        tableView2.dataSource = self
        tableView2.delegate = self
        tableView2.layer.cornerRadius = 10;
        tableView2.clipsToBounds = true;
        tableView2.layer.masksToBounds = true;
        tableView2.layer.borderWidth = 1
        tableView2.layer.borderColor = UIColor.gray.cgColor
        tableView2.layer.borderColor = tableView1.layer.borderColor?.copy(alpha: 0.25)
        tableView2.backgroundColor = .white
        tableView2.showsVerticalScrollIndicator = false
        tableView2.translatesAutoresizingMaskIntoConstraints = false
        tableView2.register(ListingTableViewCell.self, forCellReuseIdentifier: reuseIdentifier2)
        view.addSubview(tableView2)
        
        addButton = UIButton()
        addButton.setTitle("ADD SUBLET  ", for: .normal)
        addButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        addButton.setTitleColor(UIColor(red: 0.0, green: 209.0 / 255.0, blue: 199.0 / 255.0, alpha: 1.0), for: .normal)
        addButton.setImage(UIImage(named: "caret_teal"), for: .normal)
        addButton.semanticContentAttribute = .forceRightToLeft
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        
        lineView3 = UIView()
        lineView3.backgroundColor = UIColor(red: 239.0 / 255.0, green: 239.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
        lineView3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineView3)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        spinner.color = UIColor.black
        view.addSubview(spinner)
        view.bringSubviewToFront(spinner)
                
        setupConstraints()
        
        getMyDrafts()
        getMyListings()
        getDraftsInitial = false
        getListingsInitial = false

    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
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
            lineView1.topAnchor.constraint(equalTo: headerLabel1.bottomAnchor),
            lineView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            lineView1.widthAnchor.constraint(equalToConstant: 72),
            lineView1.heightAnchor.constraint(equalToConstant: 6)
        ])
        
        NSLayoutConstraint.activate([
            tableView1.topAnchor.constraint(equalTo: lineView1.bottomAnchor, constant: 24),
            tableView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            tableView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            tableView1.heightAnchor.constraint(equalToConstant: view.frame.height/4.5)
        ])
        
        NSLayoutConstraint.activate([
            headerLabel2.topAnchor.constraint(equalTo: tableView1.bottomAnchor, constant: 24),
            headerLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            headerLabel2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            headerLabel2.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            lineView2.topAnchor.constraint(equalTo: headerLabel2.bottomAnchor),
            lineView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            lineView2.widthAnchor.constraint(equalToConstant: 72),
            lineView2.heightAnchor.constraint(equalToConstant: 6)
        ])
        
        NSLayoutConstraint.activate([
            tableView2.topAnchor.constraint(equalTo: lineView2.bottomAnchor, constant: 24),
            tableView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            tableView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            tableView2.heightAnchor.constraint(equalToConstant: view.frame.height/4.5)
        ])
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: tableView2.bottomAnchor, constant: 24),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            addButton.widthAnchor.constraint(equalToConstant: 120),
            addButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            lineView3.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 24),
            lineView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            lineView3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            lineView3.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spinner.widthAnchor.constraint(equalToConstant: 50),
            spinner.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func addButtonPressed(sender: UIButton!) {
        print("pressed add sublet button")
        let viewController = AddSubletViewController()
        navigationController!.pushViewController(viewController, animated: true)
    }
    
    func getMyDrafts () {
        if(getDraftsInitial) {
            self.tableView1.isHidden = true
            NetworkManager.getMyListings(is_draft: true) { (drafts) in
                self.drafts = drafts
                self.tableView1.reloadData()
                self.tableView1.isHidden = false
                self.spinner.stopAnimating()
            }
        }

        NetworkManager.getMyListings(is_draft: true) { (drafts) in
            self.drafts = drafts
            self.tableView1.reloadData()
        }
    }
    
    func getMyListings () {
        if(getListingsInitial) {
            self.tableView2.isHidden = true
            NetworkManager.getMyListings(is_draft: true) { (drafts) in
                self.drafts = drafts
                self.tableView2.reloadData()
                self.tableView2.isHidden = false
                self.spinner.stopAnimating()
            }
        }
        
        NetworkManager.getMyListings(is_draft: false) { (listings) in
            self.listings = listings
            self.tableView2.reloadData()
        }
    }
}

extension ProfileView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == self.tableView1) {
            return drafts.count
        }
        else {
            return listings.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == self.tableView1) {
            let draft_cell = tableView1.dequeueReusableCell(withIdentifier: reuseIdentifier1, for: indexPath) as! DraftTableViewCell
            let draft = drafts[indexPath.row]
            draft_cell.configure(for: draft)
            draft_cell.selectionStyle = .none
            return draft_cell
        }
        else {
            let listing_cell = tableView2.dequeueReusableCell(withIdentifier: reuseIdentifier2, for: indexPath) as! ListingTableViewCell
            let listing = listings[indexPath.row]
            listing_cell.configure(for: listing)
            listing_cell.selectionStyle = .none
            return listing_cell
        }
    }
}

extension ProfileView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView == self.tableView1) {
            let apartment = drafts[indexPath.row]
            let viewController = DetailViewController(apartment: apartment)
            navigationController!.pushViewController(viewController, animated: true)
        }
        else {
            let apartment = listings[indexPath.row]
            let viewController = DetailViewController(apartment: apartment)
            navigationController?.pushViewController(viewController, animated: true)
        }
            
    }
}
