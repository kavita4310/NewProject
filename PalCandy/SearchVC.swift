//
//  SearchVC.swift
//  PalCandy
//
//  Created by Vivek Dogra on 24/01/23.
//

import UIKit

class SearchVC: BaseVC {

    @IBOutlet weak var priceBackView: UIView!
    @IBOutlet weak var totalPriceHeight: NSLayoutConstraint!
    @IBOutlet weak var totalPriceView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var searchViewHeight: NSLayoutConstraint!
    var isFromProduct = false
    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldBorder(view: searchView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        if isFromProduct {
            searchViewHeight.constant = 0
            searchView.isHidden = true
            headerLabel.text = "Products"
            radiusWithShadow(priceBackView)
            
        }else{
            totalPriceHeight.constant = 0
            totalPriceView.isHidden = true
        }

    }
    
    @IBAction func actionBack(_ sender: Any) {
        popVC()
    }
    
}
extension SearchVC :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        radiusWithShadow(cell.outerView)
        textfieldBorder(view: cell.quantityStackView)
        textfieldBorder(view: cell.mainView)
        
        cell.quantityLabel.text = "\(cell.quanity)"
        cell.callBackPlus = {
            cell.quanity = cell.quanity + 1
            self.tableView.reloadData()
        }
        cell.callBackMinus = {
            cell.quanity = cell.quanity - 1
            self.tableView.reloadData()
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductDetailVC") as? ProductDetailVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
