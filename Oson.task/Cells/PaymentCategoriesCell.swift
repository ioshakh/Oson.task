//
//  PaymentCategoriesCell.swift
//  Oson.task
//
//  Created by Shakhzod Bektemirov on 2022/01/17.
//

import UIKit
import SnapKit

class PaymentCategoriesCell: UITableViewCell {
    
    private lazy var stackview:UIStackView =  {
       let stackview = UIStackView()
       stackview.axis = .horizontal
       stackview.spacing = 24
       return stackview
    }()
    
    lazy var image: UIImageView = {
         let img = UIImageView()
         return img
     }()

   lazy var slideText: UILabel = {
        let text = UILabel()
        text.font = text.font.withSize(16)
        text.textColor = UIColor(hexString:"#444444")
        text.textAlignment = .left
        return text
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(stackview)
         stackview.snp.makeConstraints { (make) in
            make.height.equalTo(48)
            make.left.equalTo(0)
            make.bottom.equalTo(0)
            make.top.equalTo(0)
            make.right.equalTo(0)
        }
        
        
        stackview.addSubview(image)
        image.snp.makeConstraints{
            $0.left.equalTo(stackview).inset(24)
            $0.top.bottom.equalTo(stackview).inset(12)
            $0.width.equalTo(24)
        }
        
        stackview.addSubview(slideText)
        slideText.snp.makeConstraints{
            $0.right.equalTo(stackview).inset(16)
            $0.top.bottom.equalTo(stackview).inset(8)
            $0.left.equalTo(image.snp.right).offset(24)
            
        }
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension PaymentCategoriesCell {
    func configure(withViewModel viewModel: PaymentItemsPresentable) ->(Void) {
        slideText.text = viewModel.item
        image.image = UIImage(named:viewModel.modelImage!)
    }
}
