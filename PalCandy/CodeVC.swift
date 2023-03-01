//
//  CodeVC.swift
//  PalCandy
//
//  Created by Vivek Dogra on 19/01/23.
//

import UIKit

class CodeVC: BaseVC {

    @IBOutlet weak var codeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textfieldBorder(view: self.codeView)

       
    }
    @IBAction func actionBack(_ sender: Any) {
        popVC()
    }
    
    @IBAction func actionContinue(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FormVC") as? FormVC
        self.navigationController?.pushViewController(vc!, animated: true)

    }
 
}
