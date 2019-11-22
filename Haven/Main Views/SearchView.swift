//
//  SearchView.swift
//  Haven
//
//  Created by Katelin Chan on 11/19/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import UIKit

class SearchView: UIViewController {
    
    var titleLabel: UILabel!
    
    //var searchBar = UISearchBar()
    let searchController = UISearchController(searchResultsController: nil)
    var tableView: UITableView!
    let reuseIdentifier = "SearchCellReuse"
    let cellHeight: CGFloat = 70
    var Searches: [Apartment]!
    var filteredSearches: [Apartment]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
            
        titleLabel = UILabel()
        titleLabel.text = "Hello!"
        titleLabel.textColor = UIColor(red: 84.0 / 255.0, green: 0.0, blue: 218.0 / 255.0, alpha: 1.0)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 48)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
            
        
        let search1 = Apartment(image: "large single", title: "Large Single in Collegtown", description: "", price: 1100, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        let search2 = Apartment(image: "1-bedroom", title: "1-Bedroom (Spring 2020)", description: "", price: 1085, address: "319 College Ave", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        Searches = [search1, search2]
        filteredSearches = Searches
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor.white
        definesPresentationContext = true
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.layer.cornerRadius = 10;
        tableView.clipsToBounds = false;
        tableView.layer.masksToBounds = false;
        tableView.layer.shadowColor = UIColor.black.cgColor
        tableView.layer.shadowOffset = CGSize(width: 0.0, height: 0.5);
        tableView.layer.shadowOpacity = 0.5
        tableView.layer.shadowRadius = 2.0
        tableView.isScrollEnabled = false;
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableHeaderView = searchController.searchBar
        view.addSubview(tableView)
        
        
        
        
//        searchBar.searchBarStyle = UISearchBar.Style.prominent
//        searchBar.placeholder = " Search..."
//        searchBar.sizeToFit()
//        searchBar.translatesAutoresizingMaskIntoConstraints = false
//        searchBar.isTranslucent = false
//        searchBar.backgroundImage = UIImage()
//        searchBar.delegate = self
//        view.addSubview(searchBar)
        
//        rectangle = CGRect(x: 0, y: 0, width: 72, height: 6)
//        let color = UIColor(red: 0.0, green: 1.0, blue: 211.0 / 255.0, alpha: 1.0)
//        color.setFill()
//        UIRectFill(rectangle)
            
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.widthAnchor.constraint(equalToConstant: 268),
            titleLabel.heightAnchor.constraint(equalToConstant: 56)
        ])
        
//        NSLayoutConstraint.activate([
//            searchBar.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 15),
//            searchBar.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: 20),
//
//        ])

       
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}

    extension SearchView: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if searchController.isActive && searchController.searchBar.text != "" {
                return filteredSearches.count
            }
            return Searches.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let search_cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SearchTableViewCell
            if searchController.isActive && searchController.searchBar.text != ""{
                let Search = filteredSearches[indexPath.row]
                search_cell.configure(for: Search)
            } else {
                let Search = Searches[indexPath.row]
                search_cell.configure(for: Search)
            }
            
            search_cell.selectionStyle = .none
            return search_cell
        }
    }

    extension SearchView: UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 295.0
        }
    }

    extension SearchView: UISearchBarDelegate {
        
    }

    extension SearchView: UISearchDisplayDelegate {
        
    }

    extension SearchView: UISearchResultsUpdating {
        func updateSearchResults(for searchController: UISearchController) {
            filteredApartments(for: searchController.searchBar.text ?? "")
        }
        
        func filteredApartments(for searchText:String){
            
        filteredSearches = Searches.filter({apt in apt.title.lowercased().contains(searchText.lowercased())})
            tableView.reloadData()
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

