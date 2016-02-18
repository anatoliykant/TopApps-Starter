//
//  ViewController.swift
//  TopApps
//
//  Created by Dani Arnaout on 9/1/14.
//  Edited by Eric Cerney on 9/27/14.
//  Copyright (c) 2014 Ray Wenderlich All rights reserved.
//  Updated by SwiftBook.ru 24/11/2015
import UIKit

class ViewController: UIViewController {
  
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
            // Get #1 app name using SwiftyJSON
            let json = JSON(data: data)
            if let appName = json["feed"]["entry"][0]["im:name"]["label"].string {
                print("SwiftyJSON: \(appName)")
            }
        }
        /*
        // Get the #1 app name from iTunes and SwiftyJSON
        DataManager.getTopAppsDataFromItunesWithSuccess { (iTunesData) -> Void in
            let json = JSON(data: iTunesData)
            if let appName = json["feed"]["entry"][0]["im:name"]["label"].string {
                print("NSURLSession: \(appName)")
            }
            //1
            if let appArray = json["feed"]["entry"].array {
                //2
                var apps = [AppModel]()
                
                //3
                for appDict in appArray {
                    let appName: String? = appDict["im:name"]["label"].string
                    let appURL: String? = appDict["im:image"][0]["label"].string
                    
                    let app = AppModel(name: appName, appStoreURL: appURL)
                    apps.append(app)
                }
                
                //4
                print(apps)
            }
        }
*/
    }

    /*DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
        
        // Get the number 1 app using optional binding and NSJSONSerialization
        
        do {
            let parsedObject: AnyObject? = try NSJSONSerialization.JSONObjectWithData (data, options: NSJSONReadingOptions.AllowFragments)
            
            
                    if let topApps = parsedObject as? NSDictionary {
                        if let feed = topApps["feed"] as? NSDictionary {
                            if let apps = feed["entry"] as? NSArray {
                                if let firstApp = apps[0] as? NSDictionary {
                                    if let imname = firstApp["im:name"] as? NSDictionary {
                                        if let appName = imname["label"] as? NSString {
                                        print("Optional Binding: \(appName)")
                                    }
                                }
                            }
                        }
                    }
                }
                
            } catch let error as NSError? {
                         print ("error: \(error?.localizedDescription)")
        }
      }*/


    
}

