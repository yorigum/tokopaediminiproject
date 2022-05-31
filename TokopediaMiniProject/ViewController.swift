//
//  ViewController.swift
//  TokopediaMiniProject
//
//  Created by Nakama on 06/11/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  
  
  @IBOutlet weak var allCategoriesTableView: UITableView!
  var tableSize: [IndexPath: CGFloat] = [IndexPath: CGFloat]()
  
  
  var allCategories:CategoryAllList?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    let res = readLocalFile(forName: "data")!
    self.parse(jsonData: res)
    
  }
  
  private func setupTableView(){
    self.allCategoriesTableView.dataSource = self
    self.allCategoriesTableView.rowHeight = UITableView.automaticDimension
    self.allCategoriesTableView.estimatedRowHeight = 100
    self.allCategoriesTableView.register(UINib(nibName: "CategoriesAllTableViewCell", bundle: nil), forCellReuseIdentifier: "allCategories")
    self.allCategoriesTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    self.allCategoriesTableView.backgroundColor = .clear
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.allCategories?.categories.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { let cell = tableView.dequeueReusableCell(withIdentifier: "allCategories",for: indexPath) as! CategoriesAllTableViewCell
    let data = self.allCategories
    //dump(data)
    cell.titleCategoriesLabel.text = data!.categories[indexPath.row].name
    cell.countCategoriesLabel.text = "\(data!.categories.count) Children"
    cell.categoriesValue = self.allCategories!.categories[indexPath.row]
    return cell
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return self.allCategories?.categories.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "\(self.allCategories?.categories[section])"
  }
  
//  func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//    let tv = self.allCategoriesTableView
//
//   tv!.reloadData()
//
//      // if the table view is the last UI element, you might need to adjust the height
//      let size = CGSize(width: targetSize.width,
//                        height: tv!.frame.origin.y + tv!.contentSize.height)
//      return size
//
//  }
  

  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if let size = tableSize[indexPath] {
      return size
    }
    return UITableView.automaticDimension
  }
  
  private func readLocalFile(forName name: String) -> Data? {
    do {
      if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
         let jsonData = try String(contentsOfFile: bundlePath).data(using:.utf8) {
        //dump(bundlePath)
        //dump(jsonData)
        print(try! String(contentsOfFile: bundlePath))
        return jsonData
      }
    } catch {
      print(error)
    }
    
    return nil
  }
  
  private func parse(jsonData: Data) {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    do {
      let decodedData = try decoder.decode(Base.self,
                                           from: jsonData)
      //dump(decodedData.self)
      self.allCategories = decodedData.data.categoryAllList
    } catch {
      
    }
  }
  
  
  
}

//extension ViewController: CategoriesTableViewCellDelegate {
//    func innerTableView(forIndex: IndexPath, atSize size: CGFloat) {
//        if let s = tableSize[forIndex] {
//            if s != size {
//                tableSize[forIndex] = size
//              self.allCategoriesTableView .beginUpdates()
//                self.allCategoriesTableView.endUpdates()
//            }
//        } else {
//            tableSize[forIndex] = size
//            self.allCategoriesTableView.beginUpdates()
//            self.allCategoriesTableView.endUpdates()
//        }
//    }
//}

