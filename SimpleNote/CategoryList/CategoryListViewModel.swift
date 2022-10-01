//
//  CategoryListViewModel.swift
//  SimpleNote
//
//  Created by faiz baraja on 01/10/22.
//

import UIKit

class CategoryListViewModel: NSObject {
    var categoriesData:[NotesCategoryStructure] = []
    override init() {
        super.init()
        initializeData()
    }
    
    private func initializeData() {
        let generalCategory = NotesCategoryStructure(categoryId: 1, categoryText: "General")
        let webCategory = NotesCategoryStructure(categoryId: 2, categoryText: "Web Programming")
        let mobileCategory = NotesCategoryStructure(categoryId: 3, categoryText: "Mobile Programming")
        let backendCategory = NotesCategoryStructure(categoryId: 4, categoryText: "Backend Programming")
        let softwareEngineeringCategory = NotesCategoryStructure(categoryId: 5, categoryText: "Software Engineering")
        
        categoriesData.append(generalCategory)
        categoriesData.append(webCategory)
        categoriesData.append(mobileCategory)
        categoriesData.append(backendCategory)
        categoriesData.append(softwareEngineeringCategory)
    }
    
    func getCategoriesData() -> [NotesCategoryStructure] {
        return categoriesData
    }
}
