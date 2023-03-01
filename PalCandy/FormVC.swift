//
//  FormVC.swift
//  PalCandy
//
//  Created by Vivek Dogra on 19/01/23.
//

import UIKit

class FormVC: BaseVC {
    
    @IBOutlet weak var termBtn: UIButton!
    @IBOutlet weak var taxSwitch: UISwitch!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var showImageView: UIView!
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var imageDeleteBtn: UIButton!
    @IBOutlet weak var taxIdView: UIView!
    @IBOutlet weak var businessNameView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldBorder(view: businessNameView)
        textfieldBorder(view: taxIdView)
        textfieldBorder(view: emailView)
        textfieldBorder(view: phoneView)
        self.showImageView.isHidden = true
        self.termBtn.layer.borderWidth = 2.0
        self.termBtn.layer.borderColor = UIColor.gray.cgColor
        self.termBtn.layer.cornerRadius = 4
        
        taxSwitch.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)

        
    }
    override func viewDidLayoutSubviews() {
        self.imageDeleteBtn.layer.cornerRadius = self.imageDeleteBtn.frame.height / 2
    }
    
    @IBAction func actionUpload(_ sender: Any) {
        
        ImagePickerManager().pickImage(self){ image in
            self.showImageView.isHidden = false
            self.selectedImageView.image = image
          }
        
    }
    @IBAction func actionDeleteImage(_ sender: Any) {
        self.selectedImageView.image = nil
        self.showImageView.isHidden = true
    }
    @IBAction func actionContinue(_ sender: Any) {
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "vendorMainVC") as! vendorMainVC
        let navController = UINavigationController(rootViewController: VC1)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated:true, completion: nil)
    }
    
    @IBAction func actionBack(_ sender: Any) {
        popVC()
    }
}
