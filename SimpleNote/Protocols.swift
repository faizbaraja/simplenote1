

import UIKit

protocol CategoryListViewControllerProtocol: AnyObject {
    func setCategoryText(categoryText: String)
}

protocol ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}
