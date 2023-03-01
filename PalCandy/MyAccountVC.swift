//
//  MyAccountVC.swift
//  PalCandy
//
//  Created by Vivek Dogra on 28/01/23.
//

import UIKit

class MyAccountVC: BaseVC {
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let valuesArr = ["Purchase History","My Information","Delivery Address","Payment Options","Refer and Earn","Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        menuBtn.addTarget(revealViewController(), action: #selector(revealViewController()?.revealSideMenu), for: .touchUpInside)
    }
    
    @IBAction func actionCart(_ sender: Any) {
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "CartVC") as! CartVC
        let navController = UINavigationController(rootViewController: VC1)
        navController.modalPresentationStyle = .fullScreen
        navController.isNavigationBarHidden = true
        self.present(navController, animated:true, completion: nil)
    }
    
    @IBAction func actionSearch(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchVC") as? SearchVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func actionCoupon(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CouponVC") as! CouponVC
        vc.modalPresentationStyle = .fullScreen

           self.present(vc, animated: true, completion: nil)
    }
}
extension MyAccountVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        valuesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MyAccountTVC") as! MyAccountTVC
        cell.titleLabel.text = valuesArr[indexPath.row]
        return cell
    }
    
    
}


class MyAccountTVC : UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!

}
