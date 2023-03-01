//
//  DeliveryDateVC.swift
//  PalCandy
//
//  Created by Vivek Dogra on 28/01/23.
//

import UIKit

class DeliveryDateVC: BaseVC {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
    @IBAction func actionBack(_ sender: Any) {
        popVC()
    }
    
}
extension DeliveryDateVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "DeliveryDateTVC") as! DeliveryDateTVC
        cell.callBackInfo = {
            Common.ShowAlert(vc: self, title: "Regular", message: "Order will be delivered in 2-3 days")
        }
        return cell
    }
    
    
}

class DeliveryDateTVC : UITableViewCell {
    var callBackInfo : (() -> Void)? = nil
    
    
    @IBAction func actionInfo(_ sender: Any) {
        callBackInfo!()
    }
    
}
