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
//    var rectangle: CGRect!
    
    var tableView1: UITableView!
    let reuseIdentifier1 = "DraftCellReuse"
    let cellHeight: CGFloat = 70
    var Drafts: [Apartment]!
    
    var headerLabel2: UILabel!
    
    var tableView2: UITableView!
    let reuseIdentifier2 = "ListingCellReuse"
    var Listings: [Apartment]!
    
    var addLabel: UILabel!
    var addImageView: UIImageView!

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
        
        let draft1 = Apartment(image: "", title: "Large Single in Collegtown", description: "", price: 0, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        let draft2 = Apartment(image: "", title: "Large Single in Collegtown", description: "", price: 0, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        let draft3 = Apartment(image: "", title: "Large Single in Collegtown", description: "", price: 0, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        Drafts = [draft1, draft2, draft3]
        
        tableView1 = UITableView()
        tableView1.dataSource = self
        tableView1.delegate = self
        tableView1.layer.cornerRadius = 10;
        tableView1.clipsToBounds = false;
        tableView1.layer.masksToBounds = false;
        tableView1.layer.shadowColor = UIColor.black.cgColor
        tableView1.layer.shadowOffset = CGSize(width: 0.0, height: 0.5);
        tableView1.layer.shadowOpacity = 0.5
        tableView1.layer.shadowRadius = 2.0
        tableView1.isScrollEnabled = false;
        tableView1.translatesAutoresizingMaskIntoConstraints = false
        tableView1.register(DraftTableViewCell.self, forCellReuseIdentifier: reuseIdentifier1)
        view.addSubview(tableView1)
        
//        rectangle = CGRect(x: 0, y: 0, width: 72, height: 6)
//        let color = UIColor(red: 0.0, green: 1.0, blue: 211.0 / 255.0, alpha: 1.0)
//        color.setFill()
//        UIRectFill(rectangle)
            
        headerLabel2 = UILabel()
        headerLabel2.text = "My listings."
        headerLabel2.textColor = .black
        headerLabel2.font = UIFont.boldSystemFont(ofSize: 24)
        headerLabel2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel2)
        
        let listing1 = Apartment(image: "", title: "Large Single in Collegtown", description: "", price: 0, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        let listing2 = Apartment(image: "", title: "Large Single in Collegtown", description: "", price: 0, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        let listing3 = Apartment(image: "", title: "Large Single in Collegtown", description: "", price: 0, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        Listings = [listing1, listing2, listing3]
        
        tableView2 = UITableView()
        tableView2.dataSource = self
        tableView2.delegate = self
        tableView2.layer.cornerRadius = 10;
        tableView2.clipsToBounds = false;
        tableView2.layer.masksToBounds = false;
        tableView2.layer.shadowColor = UIColor.black.cgColor
        tableView2.layer.shadowOffset = CGSize(width: 0.0, height: 0.5);
        tableView2.layer.shadowOpacity = 0.5
        tableView2.layer.shadowRadius = 2.0
        tableView2.layer.cornerRadius = 10
        tableView2.isScrollEnabled = false;
        tableView2.translatesAutoresizingMaskIntoConstraints = false
        tableView2.register(ListingTableViewCell.self, forCellReuseIdentifier: reuseIdentifier2)
        view.addSubview(tableView2)
        
        addLabel = UILabel()
        addLabel.text = "ADD SUBLET"
        addLabel.textColor = UIColor(red: 0.0, green: 209.0 / 255.0, blue: 199.0 / 255.0, alpha: 1.0)
        addLabel.font = UIFont.boldSystemFont(ofSize: 14)
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addLabel)
        
        addImageView = UIImageView(image: UIImage(named: "caret"))
        addImageView.contentMode = .scaleAspectFit
        addImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addImageView)
        
        setupConstraints()
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
            tableView1.topAnchor.constraint(equalTo: headerLabel1.bottomAnchor, constant: 30),
            tableView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            tableView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            tableView1.heightAnchor.constraint(equalToConstant: 210)
        ])
        
        NSLayoutConstraint.activate([
            headerLabel2.topAnchor.constraint(equalTo: tableView1.bottomAnchor, constant: 24),
            headerLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            headerLabel2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            headerLabel2.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            tableView2.topAnchor.constraint(equalTo: headerLabel2.bottomAnchor, constant: 30),
            tableView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            tableView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            tableView2.heightAnchor.constraint(equalToConstant: 210)
        ])
        
        NSLayoutConstraint.activate([
            addLabel.topAnchor.constraint(equalTo: tableView2.bottomAnchor, constant: 24),
            addLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -43),
            addLabel.widthAnchor.constraint(equalToConstant: 95),
            addLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            addImageView.widthAnchor.constraint(equalToConstant: 6),
            addImageView.heightAnchor.constraint(equalToConstant: 12),
            addImageView.leadingAnchor.constraint(equalTo: addLabel.trailingAnchor, constant: 0),
            addImageView.centerYAnchor.constraint(equalTo: addLabel.centerYAnchor)
        ])
    }
}

    extension ProfileView: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if(tableView == self.tableView1) {
                return Drafts.count
            }
            else {
                return Listings.count
            }
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if(tableView == self.tableView1) {
                let draft_cell = tableView1.dequeueReusableCell(withIdentifier: reuseIdentifier1, for: indexPath) as! DraftTableViewCell
                let Draft = Drafts[indexPath.row]
                draft_cell.configure(for: Draft)
                draft_cell.selectionStyle = .none
                return draft_cell
            }
            else {
                let listing_cell = tableView2.dequeueReusableCell(withIdentifier: reuseIdentifier2, for: indexPath) as! ListingTableViewCell
                let Listing = Listings[indexPath.row]
                listing_cell.configure(for: Listing)
                listing_cell.selectionStyle = .none
                return listing_cell
            }
        }
    }

    extension ProfileView: UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return cellHeight
        }

//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            let Song = Songs[indexPath.row]
//            let viewController = DetailViewController(song: Song)
//            viewController.delegate = self
//            navigationController?.pushViewController(viewController, animated: true)
//        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
