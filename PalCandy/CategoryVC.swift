//
//  CategoryVC.swift
//  PalCandy
//
//  Created by Vivek Dogra on 25/01/23.
//

import UIKit

class CategoryVC: BaseVC {
    
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self

        menuBtn.addTarget(revealViewController(), action: #selector(revealViewController()?.revealSideMenu), for: .touchUpInside)
    }
    
    @IBAction func actionSearch(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchVC") as? SearchVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func actionCoupon(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CouponVC") as! CouponVC
           self.present(vc, animated: true, completion: nil)
    }
    
    
}

extension CategoryVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        radiusWithShadow(cell.outerView)

        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SubcategoryVC") as? SubcategoryVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
