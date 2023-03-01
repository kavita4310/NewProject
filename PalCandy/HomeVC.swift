//
//  HomeVC.swift
//  PalCandy
//
//  Created by Vivek Dogra on 20/01/23.
//

import UIKit

class HomeVC: BaseVC {
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var offerSecondCV: UICollectionView!
    @IBOutlet weak var offerCVHeight: NSLayoutConstraint!
    @IBOutlet weak var offerCV: UICollectionView!
    @IBOutlet weak var categoryCV: UICollectionView!
    
    @IBOutlet weak var menuBtn: UIButton!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryCV.delegate = self
        self.categoryCV.dataSource = self
        self.offerCV.delegate = self
        self.offerCV.dataSource = self
       
        self.offerSecondCV.delegate = self
        self.offerSecondCV.dataSource = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
        
        menuBtn.addTarget(revealViewController(), action: #selector(revealViewController()?.revealSideMenu), for: .touchUpInside)

        
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
    
    @IBAction func actionBanner(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchVC") as? SearchVC
        vc?.isFromProduct = true
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        tableView.layer.removeAllAnimations()
        tableViewHeight.constant = tableView.contentSize.height
        UIView.animate(withDuration: 0.5) {
            self.updateViewConstraints()
        }

    }
    @IBAction func actionCategory(_ sender: Any) {
        
    }
    
    @IBAction func actionCart(_ sender: Any) {
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "CartVC") as! CartVC
        let navController = UINavigationController(rootViewController: VC1)
        navController.modalPresentationStyle = .fullScreen
        navController.isNavigationBarHidden = true
        self.present(navController, animated:true, completion: nil)
    }
    @IBAction func actionSubCategory(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SubcategoryVC") as? SubcategoryVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func actionProducts(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchVC") as? SearchVC
        vc?.isFromProduct = true
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
extension HomeVC : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == offerCV {
            return 3
        }else{
            return 10
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.categoryCV {
            let cell = self.categoryCV.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
            return cell
        }else if collectionView == offerSecondCV {
            let cell = self.offerSecondCV.dequeueReusableCell(withReuseIdentifier: "offerSecond", for: indexPath) as! HomeCollectionViewCell
            radiusWithShadow(cell.outerView)
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.black.cgColor
            cell.contentView.layer.cornerRadius = 8.0
            return cell
        }
        else{
            let cell = self.offerCV.dequeueReusableCell(withReuseIdentifier: "offer", for: indexPath) as! HomeCollectionViewCell
            cell.contentView.layer.borderColor = UIColor.black.cgColor
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.cornerRadius = 8
            
            radiusWithShadow(cell.outerView)
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == offerCV {
            let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
            let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
            let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
            
            self.offerCVHeight.constant = 190 * 2 + space
            return CGSize(width: size, height: 190)
        }else if collectionView == offerSecondCV {
            let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
            let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
            let size:CGFloat = (collectionView.frame.size.width - space)
            
            return CGSize(width: size, height: 180)
        }
        
        else{
            return CGSize(width: 107, height: 140)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.categoryCV  {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SubcategoryVC") as? SubcategoryVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }else if collectionView == self.offerCV {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchVC") as? SearchVC
            vc?.isFromProduct = true
            self.navigationController?.pushViewController(vc!, animated: true)
        }else if collectionView == offerSecondCV {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductDetailVC") as? ProductDetailVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
}

extension HomeVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        radiusWithShadow(cell.outerView)
        textfieldBorder(view: cell.mainView)

        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductDetailVC") as? ProductDetailVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
