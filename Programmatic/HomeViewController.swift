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
    private let data = ["Default Collection View",
                        "Custom Collection View",
                        "Box Animation",
                        "More to Come",
                        "More to Come",
                        "More to Come"]

    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        createControls()
        addControls()
        setupConstraintsForControls()
    }
    
    func createControls() {
        // MARK: table UITableView
        table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor(red: 153/255, green: 221/255, blue: 204/255, alpha: 1)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        table.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addControls() {
        view.addSubview(table)
    }
    
    func setupConstraintsForControls() {
        //MARK: table Contraints
        if (table.isDescendant(of: view)) {
            table.topAnchor         .constraint(equalTo: view.topAnchor)        .isActive = true
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(data[indexPath.row])"
        switch indexPath.row {
        case 0...2:
            cell.accessoryType = .disclosureIndicator
        default:
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let collection = DefaultCollectionVC()
            self.navigationController?.pushViewController(collection, animated: true)
        case 1:
            let collection = CollectionVC()
            self.navigationController?.pushViewController(collection, animated: true)
        case 2:
            let boxAnimation = BoxAnimationVC()
            self.navigationController?.pushViewController(boxAnimation, animated: true)
        default:
            let message = "Yet to Come";
            let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
            self.present(alert, animated: true)
            let duration: Double = 1
                
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                alert.dismiss(animated: true)
            }
        }
    }
}
