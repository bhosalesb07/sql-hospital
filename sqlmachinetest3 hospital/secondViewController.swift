//
//  secondViewController.swift
//  sqlmachinetest3 hospital
//
//  Created by Mac on 12/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class secondViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedHospitalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.hospnamelbl?.text = selectedHospitalArray[indexPath.row]
        cell.drnamelbl?.text = selectedDrArray[indexPath.row]
        cell.eardnolbl?.text = selectedWardArray[indexPath.row]
        return cell
    }
    

    var selectedHospitalArray = [String]()
    var selectedDrArray = [String]()
    var selectedWardArray = [String]()
    
    
    @IBOutlet weak var tabelview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelview.delegate = self
        tabelview.dataSource = self
        let selectQuery =  "select * from hospitaltable"
        firstcontroller.sharedObject.SelectAllTask(query: selectQuery)
        selectedHospitalArray =   firstcontroller.sharedObject.hospitalnameArray!
        selectedDrArray = firstcontroller.sharedObject.doctornameArray!
         selectedWardArray = firstcontroller.sharedObject.wardnumberArray!
        if(selectedHospitalArray.count > 0)
        {
    
            print(selectedHospitalArray)
            print(selectedDrArray)
            print(selectedWardArray)
        }
        tabelview.reloadData()
        // Do any additional setup after loading the view.
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        let selectQuery =  "select * from hospitaltable"
        firstcontroller.sharedObject.SelectAllTask(query: selectQuery)
        selectedHospitalArray = firstcontroller.sharedObject.hospitalnameArray!
        selectedDrArray = firstcontroller.sharedObject.doctornameArray!
        selectedWardArray = firstcontroller.sharedObject.wardnumberArray!
        if(selectedHospitalArray.count > 0)
        {
        
            print(selectedHospitalArray)
            print(selectedDrArray)
            print(selectedWardArray)
        }
        tabelview.reloadData()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hospital:ViewController
        
    }
    
}

