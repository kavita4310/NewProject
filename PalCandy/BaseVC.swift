//
//  BaseVC.swift
//  PalCandy
//
//  Created by Vivek Dogra on 19/01/23.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func textfieldBorder(view : UIView){
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 8
    }
    func popVC(){
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    func radiusWithShadow(_ view: UIView){
        view.layer.cornerRadius = 8
          view.clipsToBounds = true
          view.layer.masksToBounds = false
          view.layer.shadowRadius = 2
          view.layer.shadowOpacity = 0.3
          view.layer.shadowOffset = CGSize(width: 0, height: 1)
          view.layer.shadowColor = UIColor.black.cgColor
    }
   
}
