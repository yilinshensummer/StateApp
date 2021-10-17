//
//  MyTableCell.swift
//  StateListsApp
//
//  Created by user on 5/10/21.
//

import UIKit

class MyTableCell: UITableViewCell {

    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var showNameItem: UITextView!
    //@IBOutlet weak var showItem: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
