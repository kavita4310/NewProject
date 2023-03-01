//
//  CartVC.swift
//  PalCandy
//
//  Created by Vivek Dogra on 25/01/23.
//

import UIKit

class CartVC: BaseVC, UITextViewDelegate {

    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet var tipBtn: [UIButton]!
    @IBOutlet weak var selectAddressView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var deliveryTypeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldBorder(view: deliveryTypeView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        textfieldBorder(view: selectAddressView)
        
        textfieldBorder(view: noteTextView)
        for item in tipBtn {
            textfieldBorder(view: item)
        }
        
        noteTextView.text = "Write here..."
        noteTextView.textColor = UIColor.lightGray
        noteTextView.delegate = self
    }
    
    @IBAction func actionClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func actionDeliveryDate(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DeliveryDateVC") as? DeliveryDateVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func actionCoupon(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CouponVC") as! CouponVC
        vc.modalPresentationStyle = .fullScreen
           self.present(vc, animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write here..."
            textView.textColor = UIColor.lightGray
        }
    }
    
}



extension CartVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cart") as! HomeTableViewCell
        radiusWithShadow(cell.outerView)
        textfieldBorder(view: cell.mainView)

        
        return cell
    }
   

    
}
