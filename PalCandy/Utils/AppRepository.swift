//
//  AppRepository.swift
//  FDI_Vendor
//
//  Created by iTechputer IT Solution on 16/05/21.
//

import Foundation
class AppRepository {
    // MARK: - Share Prefrence Related Stuff
    
        
    static let IS_LOGGED_IN = "IsLoggedIn";
    static  let USER_ID = "userId";
    static  let OAUTH_KEY = "OAuthKey";

    static  let LANGUAGE = "language";

    static  let NAME = "name";
    static  let EMAIL = "email";
    static  let PHONE = "phone";

    static  let STORE_NAME = "store_name";


    static  let FLASH_ORDERS = "flash_orders";
    
    
    
    static func commitUD()
    {
        UserDefaults.standard.synchronize()
    }
    
    static func saveUD(key:String, value:String)
    {
        UserDefaults.standard.set(value, forKey: key)
    }
    static func saveUD(key:String, value:Int)
    {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func saveUD(key:String, value:Bool)
    {
        UserDefaults.standard.set(value, forKey: key) //setObject
    }
    static func retriveUDString(key:String) -> String
    {
        return UserDefaults.standard.string(forKey: key) ?? ""
    }
    
    static func retriveUDINT(key:String) -> Int
    {
        return UserDefaults.standard.integer(forKey: key)
    }
    static func retriveUDBOOL(key:String) -> Bool
    {
        return UserDefaults.standard.bool(forKey: key)
    }
    
    static func removeUD(key:String)
    {
        UserDefaults.standard.removeObject(forKey:key)
        
    }
    static func removeALLUD(){
        if let appDomain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: appDomain)
        }
        
    }
}
