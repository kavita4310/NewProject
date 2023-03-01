//
//  ViewController.swift
//  PalCandy
//
//  Created by Vivek Dogra on 19/01/23.
//

import UIKit
import CountryPickerView
class LoginVC: BaseVC {

    @IBOutlet weak var countryPickerView: CountryPickerView!
    @IBOutlet weak var phoneView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldBorder(view: self.phoneView)
        
    }

    @IBAction func actionNext(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CodeVC") as? CodeVC
        self.navigationController?.pushViewController(vc!, animated: true)

    }
    
}

