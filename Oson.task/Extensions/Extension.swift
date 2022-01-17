//
//  Extension.swift
//  Oson.task
//
//  Created by Shakhzod Bektemirov on 2022/01/17.
//

import UIKit

protocol Reusable {
    static var reuseId: String { get }
}

extension Reusable {
    static var reuseId: String {
        return String(describing: self)
    }
}

extension NSObject: Reusable {}

extension UITableView {
    
    public func dequeueCell<Cell>(for indexPath: IndexPath, type: Cell.Type = Cell.self) -> Cell where Cell: UITableViewCell {
        register(Cell.classForCoder(), forCellReuseIdentifier: Cell.reuseId)
        guard let cell = dequeueReusableCell(withIdentifier: Cell.reuseId, for: indexPath) as? Cell else {
            fatalError("Error for cell id: \(Cell.reuseId) at \(indexPath))")
        }
        return cell
    }
    
    func registerCell<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(Cell.self, forCellReuseIdentifier: cellClass.reuseId)
    }
    
    
    func dequeueReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.reuseId, for: indexPath) as? Cell else {
            fatalError("Error for cell id: \(Cell.reuseId) at \(indexPath))")
        }
        return cell
    }
}


///Hex colors

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

