//
//  categoriesTableViewCell.swift
//  TokopediaMiniProject
//
//  Created by Developer on 09/04/22.
//

import UIKit

class categoriesTableViewCell: UITableViewCell {

  
  @IBOutlet weak var categoriesTitleLabel: UILabel!
  @IBOutlet weak var categoriesCountLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  

}
