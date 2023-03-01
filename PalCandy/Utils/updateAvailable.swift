//
//  updateAvailable.swift
//  QYou
//
//  Created by Vivek Dogra on 26/01/22.
//

import Foundation
import Alamofire

class VersionCheck {
  
  public static let shared = VersionCheck()
  
  func isUpdateAvailable(callback: @escaping (Bool)->Void) {
      let infoDictionary = Bundle.main.infoDictionary
        let appID = infoDictionary!["CFBundleIdentifier"] as! String
        let url = URL(string: "http://itunes.apple.com/lookup?bundleId=\(appID)")
   
      let lookup = (try? JSONSerialization.jsonObject(with: Data(contentsOf: url!) , options: [])) as? [String: Any]
      if let look = lookup{
          
            if let resultCount = lookup!["resultCount"] as? Int, resultCount == 1 {
                if let results = lookup!["results"] as? [[String:Any]] {
                    if let appStoreVersion = results[0]["version"] as? String{
                        let currentVersion = infoDictionary!["CFBundleShortVersionString"] as? String
                        if !(appStoreVersion == currentVersion) {
                            print("Need to update [\(appStoreVersion) != \(currentVersion)]")
                            callback(true)
                        }
                    }
                }
            }
      }
         callback(false)
  }
  
}
