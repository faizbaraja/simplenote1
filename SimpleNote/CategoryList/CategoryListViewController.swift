//
//  CategoryListViewController.swift
//  SimpleNote
//
//  Created by faiz baraja on 01/10/22.
//

import UIKit

class CategoryListViewController: UIViewController {
    @IBOutlet var tableCategoryList: UITableView!
    
    let viewModel = CategoryListViewModel()
    var categoryData:[NotesCategoryStructure] = []
    
    weak var delegate: CategoryListViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        
        categoryData = viewModel.getCategoriesData()
        tableCategoryList.reloadData()
    }
    
    private func registerCell() {
        tableCategoryList.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryCell")
    }


}

extension CategoryListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let currentCaetgory = categoryData[indexPath.row]
        cell.textLabel?.text = currentCaetgory.categoryText

        return cell
    }
}

extension CategoryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedCategoryText = categoryData[indexPath.row].categoryText {
            delegate?.setCategoryText(categoryText: selectedCategoryText)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
