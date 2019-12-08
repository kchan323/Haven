//
//  SearchView.swift
//  Haven
//
//  Created by Katelin Chan on 11/19/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import UIKit
import MBProgressHUD

class SearchView: UIViewController {
    
    var topView: UIView!
    var titleLabel: UILabel!
    
    var searchBar: UISearchBar!
    
    var tableView: UITableView!
    let reuseIdentifier = "searchCellReuse"
    let cellHeight: CGFloat = 70
    var Searches: [Apartment] = []
    var filteredSearches: [Apartment] = []
    
    var refreshControl: UIRefreshControl!
    var getListingsInitial = true
    var spinner = UIActivityIndicatorView()
    //    override func viewDidAppear(_ animated: Bool) {
    //        self.getAllListings()
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
        
        topView = UIView()
        topView.backgroundColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        topView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topView)
        
        titleLabel = UILabel()
        titleLabel.text = "Hello!"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 48)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        view.bringSubviewToFront(titleLabel)
        
        searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        searchBar.placeholder = "Search for apartments."
        searchBar.isTranslucent = false
        searchBar.layer.cornerRadius = 10
        searchBar.layer.masksToBounds = true
        let textFieldInsideUISearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchBar?.textColor = .black
        searchBar.barTintColor = .white
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(getAllListings), for: .valueChanged)
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.refreshControl = refreshControl
        view.addSubview(tableView)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        spinner.color = UIColor.black
        view.addSubview(spinner)
        view.bringSubviewToFront(spinner)
        
        
        
        
        //        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        getAllListings()
        getListingsInitial = false
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            titleLabel.widthAnchor.constraint(equalToConstant: 268),
            titleLabel.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            searchBar.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spinner.widthAnchor.constraint(equalToConstant: 50),
            spinner.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    @objc func getAllListings () {
        
        if(getListingsInitial) {
            self.tableView.isHidden = true
            NetworkManager.getAllListings { apartments in
                self.Searches = apartments
                self.filteredSearches = apartments
                self.tableView.reloadData()
                self.tableView.isHidden = false
                self.spinner.stopAnimating()
            }
        }
        
        if let navController = self.navigationController {
            MBProgressHUD.showAdded(to: navController.view, animated: true)
            self.tableView.isHidden = true
            NetworkManager.getAllListings { apartments in
                self.Searches = apartments
                self.filteredSearches = apartments
                self.tableView.reloadData()
                self.tableView.isHidden = false
                MBProgressHUD.hide(for: navController.view, animated: true)
            }
        }
        refreshControl.endRefreshing()
        
    }
}

extension SearchView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText != "") {
            filteredSearches = searchText.isEmpty ? Searches : Searches.filter( { $0.title.localizedCaseInsensitiveContains(searchText) })
            if (filteredSearches.count == 0) {
                filteredSearches = Searches
            }
        }
        else {
            filteredSearches = Searches
        }
        self.tableView.reloadData()
    }
    
}

extension SearchView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredSearches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let search_cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SearchTableViewCell
        let Search = filteredSearches[indexPath.section]
        search_cell.configure(for: Search)
        search_cell.selectionStyle = .none
        return search_cell
    }
    
}

extension SearchView: UITableViewDelegate {
    
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
        let Apartment = filteredSearches[indexPath.section]
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
