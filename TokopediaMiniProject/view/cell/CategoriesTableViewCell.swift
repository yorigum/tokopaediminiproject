//
//  CategoriesTableViewCell.swift
//  TokopediaMiniProject
//
//  Created by Developer on 11/04/22.
//

import UIKit



class CategoriesTableViewCell: UITableViewCell,UITableViewDataSource {
  
  var tableSize: [IndexPath: CGFloat] = [IndexPath: CGFloat]()

  var child:[Category] = []
  
  @IBOutlet weak var categoriesTitleLabel: UILabel!
  @IBOutlet weak var categoriesCountLabel: UILabel!
  
  @IBOutlet weak var childTableView: NestedTableView!
  override func awakeFromNib() {
        super.awakeFromNib()
    setupTableView()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  private func setupTableView(){
    self.childTableView.dataSource = self
    self.childTableView.rowHeight = UITableView.automaticDimension
    self.childTableView.estimatedRowHeight = 200
    self.childTableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesCell")
    self.childTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    self.childTableView.backgroundColor = .clear
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.child.count
  }
  
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell",for: indexPath) as! CategoriesTableViewCell
    let data = self.child[indexPath.row]
    //dump(data)
    cell.categoriesTitleLabel.text = data.name
    cell.categoriesCountLabel.isHidden = true
    cell.childTableView.reloadData()
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 45
  }
  
//  override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//    let tv = self.childTableView
//
//   tv!.reloadData()
//
//      // if the table view is the last UI element, you might need to adjust the height
//      let size = CGSize(width: targetSize.width,
//                        height: tv!.frame.origin.y + tv!.contentSize.height)
//      return size
//
//  }
  
  


}
