//
//  CouponVC.swift
//  PalCandy
//
//  Created by Vivek Dogra on 24/01/23.
//

import UIKit

class CouponVC: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var couponView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldBorder(view: couponView)
        self.tableView.delegate = self
        self.tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    @IBAction func actionClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
  
    
}

extension CouponVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CouponTableViewCell") as! CouponTableViewCell
        radiusWithShadow(cell.outerView)
        return cell
    }
    
    
}
