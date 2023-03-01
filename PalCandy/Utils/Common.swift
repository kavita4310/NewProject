//
//  Common.swift
//  FDI_Vendor
//
//  Created by iTechputer IT Solution on 16/05/21.
//


import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import JGProgressHUD
class Common {
    // MARK: - API Related Stuff
    static let SERVER_ENDPOINT: String  = "https://passby.to/"
    
    //    static let SERVER_ENDPOINT: String  = "https://qyou.site/"
    
    static let API:String = "api/"
    static let USER:String = "user/"
    static let GET_RESTAURANT_DETAIL   =  API + USER + "get-restaurant-detail";
    static let GET_CASION_QUEUE = API + USER + "get-casino-queue"
    static let GET_ACTIVE_UNIT = API + USER + "is-queue-active"
    static let CHECK_PENDING = API + USER + "active-queue-list"
    static let RESTAURANT_LIST = API + USER + "restaurant-list"
    static let CANCEL_REQUEST = API + USER + "cancel-booking"
    static let QUEUE_DETAIL = API + USER + "get-queue-detail"
    static let CONFIRM_QUEUE = API + USER + "confirm-queue"
    static let START_QUEUE = API + USER + "start-queue"
    static let LONG_URL = API + USER + "get-long-url"
    static let CHANGE_LANG = API + USER + "update-user-language"
    static let FAV_LIST = API + USER + "favourite-list"
    static let ADD_FAV = API + USER + "add-favourite"
    static let NOTIFICATION_LIST = API + USER + "notification-list"
    static let DRIVER_REGISTER = API + USER + "driver-signup"
    static let DRIVER_LOGIN = API + USER + "login"
    static let SHUTTLE_LIST = API + USER + "shuttle-list"
    static let GET_SHUTTLE_TICKET = API + USER + "get-shuttle-ticket"
    static let UPDATE_PICKUP_LOCATION = API + USER + "update-pickup-location"
    static let COMPLETE_SHUTTLE_LOCATION = API + USER + "complete-shuttle-location"
    static let COMPLETE_SHUTTLE = API + USER + "complete-shuttle"
    static let UPDATE_DRIVER_LOCATION = API + USER + "update-driver-location"
    static let IS_ACTIVE_QUEUE = API + USER + "is-queue-active"
    static let USER_REGISTER = API + USER + "signup"
    static let FORGOT_PASSWORD = API + USER + "recover"
    static let SHUTTLE_LOCATION_LIST = API + USER + "shuttle-location-list"
    static let SHUTTLE_AVAILABILITY = API + USER + "shuttle-availability"
    static let SHUTTLE_NOTIFICATION = API + USER + "shuttle-notification"
    static let BOOK_APPOINTMENT = API + USER + "book-appointment"
    static let GET_APPOINTMENT_SLOTS = API + USER + "get-appointment-person-slots"
    static let REGISTER_USERS = API + USER + "register-users"
    static let CHECK_ALREADY_REGISTER = API + USER + "is-user-already-registered"
    static let GET_SEATS = API + USER + "get-seats"
    static let CAT_LIST = API + USER + "category-list"
    static let ITEM_LIST = API + USER + "item-list"
    static let ADD_ITEM = API + USER + "add-order-items"
    static let REMOVE_ITEM = API + USER + "remove-item"
    static let GET_PRODUCTS = API + USER + "queue-order-items"
    static let PLACE_ORDER = API + USER + "place-order"
    static let CONE_LIST = API + USER + "cone-list"
    static let CUP_LIST = API + USER + "cup-list"
    static let SCOOP_LIST = API + USER + "scoop-list"
    static let ICE_CREAM_ORDER_ITEMS = API + USER + "icecream-order-items"
    static let ADD_CONE = API + USER + "add-cones"
    static let ADD_CUP = API + USER + "add-cups"
    static let ADD_SCOOP = API + USER + "add-scoop"
    static let UPDATE_DEP_TIME = API + USER + "update-departure-time"
    static let ORDER_HISTORY = API + USER + "order-history"
    static let ADD_RATING = API + USER + "add-rating"
    static let CHECK = API + USER + "check"
    static let TRACK_SHUTTLE = API + USER + "track-shuttle"
    
    static func getAPI(with url: String, onCompletion: @escaping (JSON?) -> Void)
    {
        if let myurl = URL(string: (SERVER_ENDPOINT+url)){
            AF.request(myurl, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().response { (response) in
                
                if let data = response.data {
                    
                    let json  = JSON(data)
                    onCompletion(json)
                    
                    
                }
            }
        }
        
    }
    
    
    static func postAPIJSON(url:String, data: [String:Any], onCompletion: @escaping (JSON?) -> Void , onError: @escaping (Int?) -> Void)
    {
        let authkey = AppRepository.retriveUDString(key: AppRepository.OAUTH_KEY)
        var headers: HTTPHeaders = []
        if authkey != "" {
            headers = [.authorization(bearerToken: authkey)]
        }
        
        if let myurl = URL(string: SERVER_ENDPOINT + url){
            AF.request(myurl, method: .post, parameters: data, encoding: JSONEncoding.default, headers: headers).validate().response { response in
                
                switch response.result {
                case .success:
                    if let data = response.data {
                        
                        let json  = JSON(data)
                        print(json)
                        onCompletion(json)
                        
                        
                    }
                case let .failure(error):
                    if error.responseCode == 400 {
                        if let data = response.data {
                            print(error.errorDescription)
                            let json  = JSON(data)
                            onCompletion(json)
                        }
                        
                    }
                    else{
                        onError(error.responseCode)
                    }
                    
                }
            }
        }
    }
    
    static func postAPI(url:String, data: NSMutableDictionary, onCompletion: @escaping (JSON?) -> Void , onError: @escaping (Int?) -> Void)
    {
        let authkey = AppRepository.retriveUDString(key: AppRepository.OAUTH_KEY)
        var headers: HTTPHeaders = []
        if authkey != "" {
            headers = [.authorization(bearerToken: authkey)]
        }
        
        if let myurl = URL(string: SERVER_ENDPOINT + url){
            AF.request(myurl, method: .post, parameters: data as? Parameters, encoding: URLEncoding(), headers: headers).validate().response { response in
                
                switch response.result {
                case .success:
                    if let data = response.data {
                        
                        let json  = JSON(data)
                        print(json)
                        onCompletion(json)
                        
                        
                    }
                case let .failure(error):
                    if error.responseCode == 400 {
                        if let data = response.data {
                            print(error.errorDescription)
                            let json  = JSON(data)
                            onCompletion(json)
                        }
                        
                    }
                    else{
                        onError(error.responseCode)
                    }
                    
                }
                
                //print(response.result)
                
                
                
                
            }
        }
        
        
    }
    
    static func postAPIwithImage(url:String, data: NSMutableDictionary, imgpath : Data, onCompletion: @escaping (JSON?) -> Void , onError: @escaping (Int?) -> Void)
    {
        let authkey = AppRepository.retriveUDString(key: AppRepository.OAUTH_KEY)
        
        
        if let myurl = URL(string: SERVER_ENDPOINT + url){
            let headers: HTTPHeaders = [
                /* "Authorization": "your_access_token",  in case you need authorization header */
                "Content-type": "multipart/form-data",
                "Authorization": "Bearer \(authkey)"
            ]
            
            
            AF.upload(
                multipartFormData: { multipartFormData in
                    multipartFormData.append(imgpath, withName: "imgfile" , fileName: "file.jpeg", mimeType: "image/jpeg")
                    for (key,value) in data {
                        multipartFormData.append((value as! String).data(using: .utf8)!, withName: key as! String)
                    }
                    
                },
                to: myurl, method: .post , headers: headers)
            .response { resp in
                print(resp)
                switch resp.result {
                case .success:
                    if let data = resp.data {
                        
                        let json  = JSON(data)
                        print(json)
                        onCompletion(json)
                        
                        
                    }
                case let .failure(error):
                    onError(error.responseCode)
                }
                
                
                
                
            }
        }
        
        
    }
    
    
    
    
    // MARK: - General Methods
    
    
    static let no_rec_found = ["No records found!","No records Found"]
    static let hud = JGProgressHUD.init(style: .light)
    static func checkSuccess(code:Int, msg:String) -> Bool{
        if code != 200 ||  no_rec_found.contains(msg){
            return false
        }
        return true
    }
    
    
    static func converDate(showDate:Date) -> String {
        let outputFormatter = DateFormatter.init()
        outputFormatter.dateFormat = "yyyy-MM-dd"
        
        //let showDate = inputFormatter.date(from: date)
        
        let resultString = outputFormatter.string(from: showDate)
        return resultString
        
    }
    
    static func converDate(date:String) -> String {
        let inputFormatter = DateFormatter.init()
        let outputFormatter = DateFormatter.init()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        outputFormatter.dateFormat = "dd MMM yyyy"
        
        let showDate = inputFormatter.date(from: date)
        
        if let datee = showDate{
            let resultString = outputFormatter.string(from: datee)
            return resultString
        }
        return date
    }
    
    static func converDatewithTime(date:String) -> String {
        let inputFormatter = DateFormatter.init()
        let outputFormatter = DateFormatter.init()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        outputFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        
        let showDate = inputFormatter.date(from: date)
        
        if let datee = showDate{
            let resultString = outputFormatter.string(from: datee)
            return resultString
        }
        return date
    }
    static func showProgress(vc:UIViewController){
        
        //hud.textLabel.text = NSLocalizedString("PleaseWait", comment: "PleaseWait")
        hud.show(in: vc.view)
    }
    static func hideProgress(){
        hud.dismiss()
    }
    
    static func isBlank (_ input:String?) ->Bool
    {
        if let ip = input {
            if ip.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                return true
            }
        }
        
        return false
    }
    
    static func lenghtCheck (_ input:String?, min:Int, max:Int) ->Bool
    {
        if let ip = input {
            if ip.count > min || ip.count < max {
                return true
            }
        }
        
        return false
    }
    
    static func isInternetAvaialable() -> Bool
    {
        NetworkReachabilityManager()?.isReachable ?? false
    }
    
    static func ShowAlert(vc: UIViewController,title:String?, message: String?)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: .default, handler: { action in
            
        }))
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func showAlertwithtwoButton(vc:UIViewController, title:String,message:String,doneBtn:String, canlcelBtn:String,doneAct:@escaping ()-> Void, cancelAct:@escaping ()-> Void){
        let alert = UIAlertController.init(title:title , message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: doneBtn, style: .default, handler: { (UIAlertAction) in
            doneAct()
        }))
        
        alert.addAction(UIAlertAction.init(title: canlcelBtn, style: .cancel, handler: { (UIAlertAction) in
            cancelAct()
        }))
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func showAlertwithoneButton(vc:UIViewController, title:String?,message:String,doneBtn:String,doneAct:@escaping ()-> Void)
    {
        let alert = UIAlertController.init(title:title , message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: doneBtn, style: .default, handler: { (UIAlertAction) in
            doneAct()
        }))
        
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func isValidEmail(_ email: String?) -> Bool {
        if let safeEmail = email{
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: safeEmail)
            
        }
        return false
        
    }
    
    static func jsonToDictionary(from text: String) -> [String: Any]? {
        guard let data = text.data(using: .utf8) else { return nil }
        let anyResult = try? JSONSerialization.jsonObject(with: data, options: [])
        return anyResult as? [String: Any]
    }
    
    
    //    static func isvalidpass(_ password : String?) ->Bool{
    //
    //        if let pass = password{
    //            if pass.count>6 && pass.count<20
    //            {
    //                return true
    //            }
    //        }
    //
    //        return false
    //    }
    
    
    
    
    
    
    
}
extension UITextField {
    
    func addInputViewDatePicker(target: Any, selector: Selector) {
        
        let screenWidth = UIScreen.main.bounds.width
        
        //Add DatePicker as inputView
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            
        }
        //    datePicker.maximumDate = Date()
        datePicker.locale = Locale(identifier: "en_GB")
        datePicker.datePickerMode = .time
        self.inputView = datePicker
        
        //Add Tool Bar as input AccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)
        
        self.inputAccessoryView = toolBar
    }
    
    @objc func cancelPressed() {
        self.resignFirstResponder()
    }
}
extension UITableView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .none
    }
}


extension Date {
    
    static func getCurrentTime() -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+1")
        
        return dateFormatter.string(from: Date())
        
    }
}


extension UIViewController {
    
    func showToast(message: String, controller: UIViewController) {
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 25;
        toastContainer.clipsToBounds  =  true

        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font.withSize(12.0)
        toastLabel.text = message
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0

        toastContainer.addSubview(toastLabel)
        controller.view.addSubview(toastContainer)

        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false

        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal, toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 15)
        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal, toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -15)
        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -15)
        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 15)
        toastContainer.addConstraints([a1, a2, a3, a4])

        let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: controller.view, attribute: .leading, multiplier: 1, constant: 65)
        let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: controller.view, attribute: .trailing, multiplier: 1, constant: -65)
        let c3 = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal, toItem: controller.view, attribute: .bottom, multiplier: 1, constant: -75)
        controller.view.addConstraints([c1, c2, c3])

        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
    
}
