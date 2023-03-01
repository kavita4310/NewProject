//
//  HomeTableViewCell.swift
//  PalCandy
//
//  Created by Vivek Dogra on 20/01/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var outerView: UIView!
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantityStackView: UIStackView!
    var quanity = 0
    
    var callBackMinus : (() -> Void)? = nil
    var callBackPlus : (() -> Void)? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func actionMinus(_ sender: Any) {
        callBackMinus!()
    }
    
    @IBAction func actionPlus(_ sender: Any) {
        callBackPlus!()
    }
}
