//
//  firstcontroller.swift
//  sqlmachinetest3 hospital
//
//  Created by Mac on 12/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SQLite3
class firstcontroller: NSObject {
    
    var db : OpaquePointer?
    var statement : OpaquePointer?
    var hospitalnameArray : [String]?
    var doctornameArray: [String]?
    var wardnumberArray: [String]?
    
    static let sharedObject = firstcontroller()
    func gateDatabasePath() -> String
    {
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = docDir.first!
        return path + "/myDatabase.sqlite"
    }
    
    func executeQuery(query: String) -> Bool
    {
        var success = false
        let dbpath = gateDatabasePath()
        if(sqlite3_open(dbpath, &db) == SQLITE_OK)
        {
            if (sqlite3_prepare(db, query, -1, &statement, nil) == SQLITE_OK)
            {
                if(sqlite3_step(statement) == SQLITE_DONE)
                {
                    success = true
                    sqlite3_finalize(statement!)
                    sqlite3_close(db!)
                }
                else
                {
                    print("Error in executing statement\(sqlite3_errmsg(db!))")
                }
            }
            else
            {
                print("Error in preparing\(sqlite3_errmsg(db!))")
            }
        }
        else
        {
            print("Error in openingdatabase\(sqlite3_errmsg(db!))")
        }
        return success
    }
  
    func SelectAllTask(query: String)
    {
        hospitalnameArray = [String]()
        doctornameArray = [String]()
        wardnumberArray = [String]()
        
        let dbPath = gateDatabasePath()
        if(sqlite3_open(dbPath, &db) == SQLITE_OK)
        {
            if (sqlite3_prepare(db, query, -1, &statement, nil) == SQLITE_OK)
            {
                while(sqlite3_step(statement) == SQLITE_ROW)
                {
                    
                   let hospitalnameInc = sqlite3_column_text(statement, 0)
                    let hospitalname = String(cString: hospitalnameInc!)
                    let doctornameInc = sqlite3_column_text(statement, 1)
                    let doctorname = String(cString: doctornameInc!)
                    let wardnumberInc = sqlite3_column_text(statement, 2)
                    let wardnumber = String(cString: wardnumberInc!)
                    
                    hospitalnameArray!.append(hospitalname)
                    doctornameArray!.append(doctorname)
                    wardnumberArray!.append(wardnumber)
                }
               sqlite3_close(db!)
            }
                
            else
            {
                print("Error in preparing statement \(sqlite3_errmsg(db!))")
            }
        }
        else
        {
            print("Error opening database\(sqlite3_errmsg(db!))")
        }
    }
    
    func createTable()
    {
        let createQuery = "create table if not exists hospitaltable(hospital text primary key, doctor text, wardnumber text)"
        let isSuccess = executeQuery(query: createQuery)
        if isSuccess
        {
            print("Create:Success")
        }
        else
        {
            print("Create:Failed")
        }
    }
    
}


