//
//  CategoriesAllTableViewCell.swift
//  TokopediaMiniProject
//
//  Created by Developer on 11/04/22.
//

import UIKit

class CategoriesAllTableViewCell: UITableViewCell,UITableViewDataSource {
  
  var categoriesValue:Category?
 
  @IBOutlet weak var titleCategoriesLabel: UILabel!
  @IBOutlet weak var countCategoriesLabel: UILabel!
  @IBOutlet weak var categoriesTableView: NestedTableView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
      setupTableView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  private func setupTableView(){
    self.categoriesTableView.dataSource = self
    self.categoriesTableView.rowHeight = UITableView.automaticDimension
    self.categoriesTableView.estimatedRowHeight = 100
    self.categoriesTableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesCell")
    self.categoriesTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    self.categoriesTableView.backgroundColor = .clear
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.categoriesValue?.child?.count ?? 0
  }
  
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell",for: indexPath) as! CategoriesTableViewCell
    let data = self.categoriesValue
    //dump(data)
      cell.categoriesTitleLabel.text = data?.name
    cell.categoriesCountLabel.text = "\(self.categoriesValue!.child!.count) Children"
    cell.child = data!.child!
    cell.childTableView.reloadData()
    return cell
  }
  
//  override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//    let tv = self.categoriesTableView
//
//   tv!.reloadData()
//
//      // if the table view is the last UI element, you might need to adjust the height
//      let size = CGSize(width: targetSize.width,
//                        height: tv!.frame.origin.y + tv!.contentSize.height)
//      return size
//
//  }
//  
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 45
  }
  
  
    
}






