//
//  SaveView.swift
//  Haven
//
//  Created by Katelin Chan on 11/19/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import UIKit

class SaveView: UIViewController {

    var addButton: UIButton!
    
    var titleLabel: UILabel!
    var headerLabel1: UILabel!
    var lineView1: UIView!
    
    var collectionView1: UICollectionView!
    var apartments1: [Apartment] = []
    var apartment1: Apartment!
    var apartment2: Apartment!
    var apartment3: Apartment!
    var apartment4: Apartment!
    var apartment5: Apartment!

    var viewAllButton1: UIButton!
    
    var headerLabel2: UILabel!
    var lineView2: UIView!
    
    var collectionView2: UICollectionView!
    var apartments2: [Apartment] = []
    var apartment6: Apartment!
    var apartment7: Apartment!
    var apartment8: Apartment!
    var apartment9: Apartment!
    var apartment10: Apartment!
    
    var viewAllButton2: UIButton!
    var lineView3: UIView!
    var addCollectionButton: UIButton!
    
    let apartmentCellReuseIdentifier = "apartmentCellReuseIdentifier"
    let padding: CGFloat = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        
        addButton = UIButton()
        let image = UIImage(named: "add")?.withRenderingMode(.alwaysTemplate)
        addButton.setImage(image, for: .normal)
        addButton.tintColor = UIColor(red: 0.0, green: 150.0 / 255.0, blue: 161.0 / 255.0, alpha: 1.0)
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        
        titleLabel = UILabel()
        titleLabel.text = "My Saves."
        titleLabel.textColor = UIColor(red: 0.0, green: 159.0 / 255.0, blue: 164.0 / 255.0, alpha: 1.0)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 48)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
            
        headerLabel1 = UILabel()
        headerLabel1.text = "Spring 2020."
        headerLabel1.textColor = .black
        headerLabel1.font = UIFont.boldSystemFont(ofSize: 24)
        headerLabel1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel1)
        
        lineView1 = UIView()
        lineView1.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 211.0 / 255.0, alpha: 1.0)
        lineView1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineView1)
        
        apartment1 = Apartment(image: "dorm", title: "Single Bedroom", description: "", price: 950, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        apartment2 = Apartment(image: "dorm", title: "Single Bedroom", description: "", price: 950, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        apartment3 = Apartment(image: "dorm", title: "Single Bedroom", description: "", price: 950, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        apartment4 = Apartment(image: "dorm", title: "Single Bedroom", description: "", price: 950, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        apartment5 = Apartment(image: "dorm", title: "Single Bedroom", description: "", price: 950, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        apartments1 = [apartment1, apartment2, apartment3, apartment4, apartment5]
        
        let layout1 = UICollectionViewFlowLayout()
        layout1.scrollDirection = .horizontal
        layout1.minimumLineSpacing = padding
        layout1.minimumInteritemSpacing = padding
                
        collectionView1 = UICollectionView(frame: .zero, collectionViewLayout: layout1)
        collectionView1.translatesAutoresizingMaskIntoConstraints = false
        collectionView1.backgroundColor = .white
        collectionView1.showsHorizontalScrollIndicator = false
        collectionView1.register(ApartmentCollectionViewCell.self, forCellWithReuseIdentifier: apartmentCellReuseIdentifier)
        collectionView1.dataSource = self
        collectionView1.delegate = self
        view.addSubview(collectionView1)
        
        viewAllButton1 = UIButton()
        viewAllButton1.setTitle("VIEW ALL  ", for: .normal)
        viewAllButton1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        viewAllButton1.setTitleColor(UIColor(red: 0.0, green: 209.0 / 255.0, blue: 199.0 / 255.0, alpha: 1.0), for: .normal)
        viewAllButton1.setImage(UIImage(named: "caret_teal"), for: .normal)
        viewAllButton1.semanticContentAttribute = .forceRightToLeft
        viewAllButton1.addTarget(self, action: #selector(viewAllButtonPressed1), for: .touchUpInside)
        viewAllButton1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewAllButton1)
        
        headerLabel2 = UILabel()
        headerLabel2.text = "Fall 2020."
        headerLabel2.textColor = .black
        headerLabel2.font = UIFont.boldSystemFont(ofSize: 24)
        headerLabel2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel2)
        
        lineView2 = UIView()
        lineView2.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 211.0 / 255.0, alpha: 1.0)
        lineView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineView2)
        
        apartment6 = Apartment(image: "dorm", title: "Single Bedroom", description: "", price: 950, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        apartment7 = Apartment(image: "dorm", title: "Single Bedroom", description: "", price: 950, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        apartment8 = Apartment(image: "dorm", title: "Single Bedroom", description: "", price: 950, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        apartment9 = Apartment(image: "dorm", title: "Single Bedroom", description: "", price: 950, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        apartment10 = Apartment(image: "dorm", title: "Single Bedroom", description: "", price: 950, address: "720 Dryden Rd", type: "Apartment", electricity: false, wifi: false, water: false, trash: false, heat: false)
        apartments2 = [apartment6, apartment7, apartment8, apartment9, apartment10]
        
        let layout2 = UICollectionViewFlowLayout()
        layout2.scrollDirection = .horizontal
        layout2.minimumLineSpacing = padding
        layout2.minimumInteritemSpacing = padding
                
        collectionView2 = UICollectionView(frame: .zero, collectionViewLayout: layout2)
        collectionView2.translatesAutoresizingMaskIntoConstraints = false
        collectionView2.backgroundColor = .white
        collectionView2.showsHorizontalScrollIndicator = false
        collectionView2.register(ApartmentCollectionViewCell.self, forCellWithReuseIdentifier: apartmentCellReuseIdentifier)
        collectionView2.dataSource = self
        collectionView2.delegate = self
        view.addSubview(collectionView2)
        
        viewAllButton2 = UIButton()
        viewAllButton2.setTitle("VIEW ALL  ", for: .normal)
        viewAllButton2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        viewAllButton2.setTitleColor(UIColor(red: 0.0, green: 209.0 / 255.0, blue: 199.0 / 255.0, alpha: 1.0), for: .normal)
        viewAllButton2.setImage(UIImage(named: "caret_teal"), for: .normal)
        viewAllButton2.semanticContentAttribute = .forceRightToLeft
        viewAllButton2.addTarget(self, action: #selector(viewAllButtonPressed2), for: .touchUpInside)
        viewAllButton2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewAllButton2)
        
        lineView3 = UIView()
        lineView3.backgroundColor = UIColor(red: 239.0 / 255.0, green: 239.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
        lineView3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineView3)
        
        addCollectionButton = UIButton()
        addCollectionButton.setTitle("Add a Collection", for: .normal)
        addCollectionButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        addCollectionButton.setTitleColor(UIColor(red: 0.0, green: 150.0 / 255.0, blue: 161.0 / 255.0, alpha: 1.0), for: .normal)
        addCollectionButton.addTarget(self, action: #selector(addCollectionButtonPressed), for: .touchUpInside)
        addCollectionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addCollectionButton)
                
        setupConstraints()
    }
        
    func setupConstraints() {
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 3),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            addButton.widthAnchor.constraint(equalToConstant: 22),
            addButton.heightAnchor.constraint(equalToConstant: 22)
        ])
        
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
            collectionView1.topAnchor.constraint(equalTo: lineView1.bottomAnchor, constant: 24),
            collectionView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            collectionView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            collectionView1.heightAnchor.constraint(equalToConstant: 155)
        ])
        
        NSLayoutConstraint.activate([
            viewAllButton1.topAnchor.constraint(equalTo: collectionView1.bottomAnchor, constant: 24),
            viewAllButton1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            viewAllButton1.widthAnchor.constraint(equalToConstant: 100),
            viewAllButton1.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            headerLabel2.topAnchor.constraint(equalTo: viewAllButton1.bottomAnchor, constant: 24),
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
            collectionView2.topAnchor.constraint(equalTo: lineView2.bottomAnchor, constant: 24),
            collectionView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            collectionView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            collectionView2.heightAnchor.constraint(equalToConstant: 155)
        ])
        
        NSLayoutConstraint.activate([
            viewAllButton2.topAnchor.constraint(equalTo: collectionView2.bottomAnchor, constant: 24),
            viewAllButton2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            viewAllButton2.widthAnchor.constraint(equalToConstant: 100),
            viewAllButton2.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            lineView3.topAnchor.constraint(equalTo: viewAllButton2.bottomAnchor, constant: 24),
            lineView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            lineView3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            lineView3.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        NSLayoutConstraint.activate([
            addCollectionButton.topAnchor.constraint(equalTo: lineView3.bottomAnchor, constant: 13),
            addCollectionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addCollectionButton.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
    
    @objc func addButtonPressed(sender: UIButton!) {
        print("pressed add (+) button")
//        navigationController?.popViewController(animated: true)
    }
    
    @objc func viewAllButtonPressed1(sender: UIButton!) {
        print("pressed view all button 1")
    }
    
    @objc func viewAllButtonPressed2(sender: UIButton!) {
        print("pressed view all button 2")
    }
    
    @objc func addCollectionButtonPressed(sender: UIButton!) {
        print("pressed add collection button")
    }
}

extension SaveView: UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == collectionView1) {
            return apartments1.count
        }
        else
        {
            return apartments2.count
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == collectionView1) {
            let cell1 = collectionView1.dequeueReusableCell(withReuseIdentifier: apartmentCellReuseIdentifier, for: indexPath) as! ApartmentCollectionViewCell
            cell1.configure(for: apartments1[indexPath.row])
            return cell1
        }
        else {
            let cell2 = collectionView2.dequeueReusableCell(withReuseIdentifier: apartmentCellReuseIdentifier, for: indexPath) as! ApartmentCollectionViewCell
            cell2.configure(for: apartments2[indexPath.row])
            return cell2
        }
    }
    
}

extension SaveView: UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == collectionView1) {
            return CGSize(width: 125, height: 150)
        }
        else {
            return CGSize(width: 125, height: 150)
        }
    }
    
}

extension SaveView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if (collectionView == collectionView1) {
//        }
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
