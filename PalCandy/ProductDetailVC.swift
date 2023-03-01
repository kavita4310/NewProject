//
//  ProductDetailVC.swift
//  PalCandy
//
//  Created by Vivek Dogra on 25/01/23.
//

import UIKit

class ProductDetailVC: BaseVC {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var priceBackView: UIView!

    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var stackVieqw: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldBorder(view: stackVieqw)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
        radiusWithShadow(priceBackView)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func actionBack(_ sender: Any) {
        popVC()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        tableView.layer.removeAllAnimations()
        tableViewHeight.constant = tableView.contentSize.height
        UIView.animate(withDuration: 0.5) {
            self.updateViewConstraints()
        }

    }
    
}
extension ProductDetailVC :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        radiusWithShadow(cell.outerView)
        textfieldBorder(view: cell.mainView)
        
     
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductDetailVC") as? ProductDetailVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
