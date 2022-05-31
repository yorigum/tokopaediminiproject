//
//  allCategoriesTableViewCell.swift
//  TokopediaMiniProject
//
//  Created by Developer on 09/04/22.
//

import UIKit

class allCategoriesTableViewCell: UITableViewCell,UITableViewDataSource {

 var categoriesValue:[Category] = []
  
  @IBOutlet weak var titleCategoriesLabel: UILabel!
  @IBOutlet weak var countCategoriesLabel: UILabel!
  @IBOutlet weak var categoriesTableView: UITableView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        setupTable()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  private func configureContent(){
    NSLayoutConstraint.activate([
               titleCategoriesLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
               titleCategoriesLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
               titleCategoriesLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
               titleCategoriesLabel.bottomAnchor.constraint(equalTo: categoriesTableView.topAnchor),
               
               countCategoriesLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
               countCategoriesLabel.leadingAnchor.constraint(equalTo: titleCategoriesLabel.layoutMarginsGuide.leadingAnchor),
               countCategoriesLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
               titleCategoriesLabel.bottomAnchor.constraint(equalTo: categoriesTableView.topAnchor),

               categoriesTableView.topAnchor.constraint(equalTo: titleCategoriesLabel.bottomAnchor),
               categoriesTableView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
               categoriesTableView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
               categoriesTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
           ])
  }
  
  private func setupTable(){
    self.categoriesTableView.dataSource = self
    self.categoriesTableView.rowHeight = UITableView.automaticDimension
    self.categoriesTableView.estimatedRowHeight = 100
    
    self.categoriesTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    self.categoriesTableView.backgroundColor = .clear
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.categoriesValue.count
  }
  
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { let cell = tableView.dequeueReusableCell(withIdentifier: "categoriesCell",for: indexPath) as! categoriesTableViewCell
    let data = self.categoriesValue[indexPath.row]
    cell.categoriesTitleLabel.text = data.name
    cell.categoriesCountLabel.text = "\(data.child?.count) Children"
    return cell
  }
  


}
