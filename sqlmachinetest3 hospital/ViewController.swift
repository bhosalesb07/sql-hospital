//
//  ViewController.swift
//  sqlmachinetest3 hospital
//
//  Created by Mac on 12/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hospitaltxt: UITextField!
    
    @IBOutlet weak var Doctortxt: UITextField!
    
    @IBOutlet weak var wardtxt: UITextField!
    
    @IBAction func savebtn(_ sender: UIButton) {
        let insertQuery = "insert into hospitaltable(hospital, doctor, wardnumber) values ('\(hospitaltxt.text!)','\(Doctortxt.text!)','\(wardtxt.text!)')"
        let isSuccess = firstcontroller.sharedObject.executeQuery(query: insertQuery)
        cleartxtfld()
        if isSuccess
        {
            print("successfully updated in database")
        }
        else
        {
            print("data Failed")
        }
    }
    
    @IBAction func Nextbtn(_ sender: UIButton) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as!  secondViewController
        navigationController?.pushViewController(next, animated: true)
    }
    
    
    @IBAction func btnDelete(_ sender: UIButton)
    {
        let deleteQuery = "delete from hospitaltable  where hospital = '\(hospitaltxt.text!)' "
        let isSuccess = firstcontroller.sharedObject.executeQuery(query: deleteQuery)
        if isSuccess
        {
            print("successfully deleted in database")
        }
        else
        {
            print("deletion Failed")
        }
    }
    
    
    @IBAction func btnUpdate(_ sender: UIButton)
    {
        let updateQuery = "update hospitaltable set doctor = '\(Doctortxt.text!)',wardnumber = '\(wardtxt.text!)'  where hospital = '\(hospitaltxt.text!)'"
        let isSuccess = firstcontroller.sharedObject.executeQuery(query: updateQuery)
        cleartxtfld()
        if isSuccess
        {
            print("successfully updated in database")
        }
        else
        {
            print("updating Failed")
        }
        
    }
    
    
    
    func cleartxtfld()
    {
        hospitaltxt.text = ""
        Doctortxt.text = ""
        wardtxt.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

