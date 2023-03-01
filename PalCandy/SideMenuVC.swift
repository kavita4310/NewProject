//
//  SideMenuVC.swift
//  Yallagan
//
//  Created by Dev Rana on 15/07/22.
//

import UIKit

protocol SideMenuVCDelegate {
    func selectedCell(_ row: Int)
}

class SideMenuVC: UIViewController {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var reviewCountLbl: UILabel!
    @IBOutlet weak var contentTV: UITableView!
    
    var defaultHighlightedCell: Int = 0
    
    var delegate: SideMenuVCDelegate?
    
    var menu: [SideMenuModel] = [
        SideMenuModel( title: "Home", color: UIColor.darkGray),
        SideMenuModel( title: "Category", color: UIColor.darkGray),
        SideMenuModel( title: "My Cart", color: UIColor.darkGray),
        SideMenuModel( title: "Offer", color: UIColor.darkGray),
        SideMenuModel( title: "My Account", color: UIColor.darkGray),
        SideMenuModel( title: "Support", color: UIColor.darkGray),
        SideMenuModel( title: "Logout", color: UIColor.red)
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   //     profileAPI()
        

        // TableView
        self.contentTV.delegate = self
        self.contentTV.dataSource = self
        
        // Set Highlighted Cell
        DispatchQueue.main.async {
            let defaultRow = IndexPath(row: self.defaultHighlightedCell, section: 0)
            self.contentTV.selectRow(at: defaultRow, animated: false, scrollPosition: .none)
        }
        // Register TableView Cell
        self.contentTV.register(SideMenuTVC.nib, forCellReuseIdentifier: SideMenuTVC.identifier)

        // Update TableView with the data
        self.contentTV.reloadData()
    }
    
    @IBAction func backBtn(_ sender: Any) {

    }
    
//    func profileAPI(){
//        APIManager.shareInstance.callingProfileAPI { response in
//            switch response {
//            case .success(let json):
//
//
//                let urlString = imageBaseURl+((json as! profileResponseModel).data?.image ?? "").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//                if let url = URL(string: urlString ){
//
//                    self.profileImg.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
//                }
//
//
//                self.nameLbl.text = "\((json as! profileResponseModel).data?.name ?? "")"
//
//            case .failure(let err):
//                print (err.localizedDescription)
//            }
//        }
//    }
}
// MARK: - UITableViewDelegate

extension SideMenuVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

// MARK: - UITableViewDataSource

extension SideMenuVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuTVC.identifier, for: indexPath) as? SideMenuTVC else { fatalError("xib doesn't exist") }

        cell.nameLbl.text = self.menu[indexPath.row].title
      
        cell.nameLbl.textColor = self.menu[indexPath.row].color


        // Highlighted color
        let myCustomSelectionColorView = UIView()
        myCustomSelectionColorView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = myCustomSelectionColorView
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(indexPath.row)
        // Remove highlighted color when you press the 'Profile' and 'Like us on facebook' cell
//        if indexPath.row == 4 || indexPath.row == 6 {
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
    }
}

struct SideMenuModel {
   
    var title: String
    var color: UIColor
}
