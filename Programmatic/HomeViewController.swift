//
//  HomeViewController.swift
//  Programmatic
//
//  Created by Aditya Mishra on 29/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: Properties
    private var table: UITableView!
    private var labelOne: UILabel!
    private let data = ["One", "Two", "Three", "Four", "Five", "Six"]

    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        createControls()
        addControls()
        setupConstraintsForControls()
    }
    
    func createControls() {
        // MARK: labelOne UILabel
        labelOne = UILabel()
        labelOne.backgroundColor = .white
        labelOne.text = "Hello"
        labelOne.textAlignment = .center
        labelOne.layer.masksToBounds = true
        labelOne.layer.cornerRadius = 5
        labelOne.textColor = .green
        labelOne.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: table UITableView
        table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor(red: 153/255, green: 221/255, blue: 204/255, alpha: 1)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "evenCell")
        table.register(UITableViewCell.self, forCellReuseIdentifier: "oddCell")
        table.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addControls() {
        view.addSubview(table)
        view.addSubview(labelOne)
    }
    
    func setupConstraintsForControls() {
        //MARK: labelOne Contraints
        if (labelOne.isDescendant(of: view)) {
            //TODO: Button gets hidden under notch if constant of 50 is not added.
            labelOne.topAnchor      .constraint(equalTo: view.topAnchor, constant: 50)  .isActive = true
            labelOne.leadingAnchor  .constraint(equalTo: view.leadingAnchor)            .isActive = true
            labelOne.trailingAnchor .constraint(equalTo: view.trailingAnchor)           .isActive = true
            labelOne.heightAnchor   .constraint(equalToConstant: 50)                    .isActive = true
        }
        
        //MARK: table Contraints
        if (table.isDescendant(of: view)) {
            table.topAnchor         .constraint(equalTo: labelOne.bottomAnchor) .isActive = true
            table.leadingAnchor     .constraint(equalTo: view.leadingAnchor)    .isActive = true
            table.trailingAnchor    .constraint(equalTo: view.trailingAnchor)   .isActive = true
            table.bottomAnchor      .constraint(equalTo: view.bottomAnchor)     .isActive = true
        }
    }
}

//MARK: UITableView Delegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "evenCell", for: indexPath as IndexPath)
            cell.textLabel!.text = "\(indexPath.row)"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "oddCell", for: indexPath as IndexPath)
            cell.textLabel!.text = "\(data[indexPath.row])"
            cell.textLabel?.textAlignment = .right
            return cell
        }
    }
}
