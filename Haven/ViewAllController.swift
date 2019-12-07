//
//  ViewAllController.swift
//  Haven
//
//  Created by Katelin Chan on 12/4/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import UIKit

class ViewAllController: UIViewController {
    
    var backButton: UIButton!
    var titleLabel: UILabel!
    
    var tableView: UITableView!
    let reuseIdentifier = "viewAllCellReuse"
    let cellHeight: CGFloat = 70
    var Searches: [Apartment]!
    var filteredSearches: [Apartment]!
    
    var collection: Collection
    
    init(collection: Collection) {
        self.collection = collection
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.isNavigationBarHidden = false
        view.backgroundColor = .white
//        self.hideKeyboardWhenTappedAround()
        
        backButton = UIButton()
        backButton.setImage(UIImage (named: "caret_green"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        titleLabel = UILabel()
        titleLabel.text = collection.title.uppercased()
        titleLabel.textColor = UIColor(red: 0.0, green: 150.0 / 255.0, blue: 161.0 / 255.0, alpha: 1.0)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ViewAllTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
                
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
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func backButtonPressed(sender: UIButton!) {
        navigationController?.popViewController(animated: true)
    }
}

extension ViewAllController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return collection.apartments.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let search_cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ViewAllTableViewCell
        let Search = collection.apartments[indexPath.section]
        search_cell.configure(for: Search)
        search_cell.selectionStyle = .none
        return search_cell
    }
    
}

extension ViewAllController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Apartment = collection.apartments[indexPath.section]
        let viewController = DetailViewController(apartment: Apartment)
        navigationController!.pushViewController(viewController, animated: true)
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
