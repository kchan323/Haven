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
    var Drafts: [Apartment]!
    
    var headerLabel2: UILabel!
    var lineView2: UIView!
    
    var tableView2: UITableView!
    let reuseIdentifier2 = "ListingCellReuse"
    var Listings: [Apartment]!
    
    var addButton: UIButton!
    var lineView3: UIView!

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
        
        let draft1 = Apartment(image: "apartment", title: "2-Bedroom (Spring 2020)", description: "All new, fully furnished apartment. 5 min walk to the engineering quad.", rent: 1085, address: "3002 College Ave", type: "Apartment", electricity: true, wifi: false, water: true, trash: false, heat: true)
        let draft2 = Apartment(image: "apartment", title: "Large Single in Collegtown", description: "", rent: 0, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        let draft3 = Apartment(image: "apartment", title: "Large Single in Collegtown", description: "", rent: 0, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        let draft4 = Apartment(image: "apartment", title: "Large Single in Collegtown", description: "", rent: 0, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        Drafts = [draft1, draft2, draft3, draft4]
        
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
        
        let listing1 = Apartment(image: "apartment", title: "Large Single in Collegtown", description: "", rent: 0, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        let listing2 = Apartment(image: "apartment", title: "Large Single in Collegtown", description: "", rent: 0, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        let listing3 = Apartment(image: "apartment", title: "Large Single in Collegtown", description: "", rent: 0, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        Listings = [listing1, listing2, listing3]
        
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
    }
    
    @objc func addButtonPressed(sender: UIButton!) {
        print("pressed add sublet button")
        let viewController = AddSubletViewController()
        navigationController!.pushViewController(viewController, animated: true)
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView == self.tableView1) {
            let Apartment = Drafts[indexPath.row]
            let viewController = DetailViewController(apartment: Apartment)
//            viewController.delegate = self
            navigationController!.pushViewController(viewController, animated: true)
        }
        else {
            let Apartment = Listings[indexPath.row]
            let viewController = DetailViewController(apartment: Apartment)
//            viewController.delegate = self
            navigationController?.pushViewController(viewController, animated: true)
        }
            
    }
}

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
