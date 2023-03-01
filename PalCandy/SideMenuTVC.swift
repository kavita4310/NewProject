//
//  SideMenuTVC.swift
//  Yallagan
//
//  Created by Dev Rana on 16/07/22.
//

import UIKit

class SideMenuTVC: UITableViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var pointImg: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
