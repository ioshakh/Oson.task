//
//  MobileOperatorCell.swift
//  Oson.task
//
//  Created by Shakhzod Bektemirov on 2022/01/18.
//

import UIKit
import SnapKit

class MobileOperatorCell: UITableViewCell {
    
    private lazy var stackview:UIStackView =  {
       let stackview = UIStackView()
       stackview.axis = .horizontal
      // stackview.spacing = 24
       return stackview
    }()
    
    lazy var mobileOperatorImage: UIImageView = {
         let img = UIImageView()
         return img
     }()
    
    lazy var bonusImage: UIImageView = {
         let bonusImg = UIImageView()
         return bonusImg
     }()

   lazy var mobileOperatorText: UILabel = {
        let text = UILabel()
        text.font = text.font.withSize(14)
        text.textColor = UIColor(hexString:"#444444")
        text.textAlignment = .left
        return text
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(stackview)
         stackview.snp.makeConstraints { (make) in
            make.height.equalTo(60)
            make.left.equalTo(0)
            make.bottom.equalTo(0)
            make.top.equalTo(0)
            make.right.equalTo(0)
        }
        
        
        stackview.addSubview(mobileOperatorImage)
        mobileOperatorImage.snp.makeConstraints{
            $0.left.equalTo(stackview).inset(16)
            $0.top.bottom.equalTo(stackview).inset(0)
            $0.width.equalTo(96)
        }
        
        stackview.addSubview(mobileOperatorText)
        mobileOperatorText.snp.makeConstraints{
            $0.top.bottom.equalTo(stackview).inset(8)
            $0.left.equalTo(mobileOperatorImage.snp.right).offset(12)
            
        }
        
        
        stackview.addSubview(bonusImage)
        bonusImage.snp.makeConstraints{
            $0.right.equalTo(stackview).inset(14)
            $0.top.bottom.equalTo(stackview).inset(18)
            $0.left.equalTo(mobileOperatorText.snp.right).offset(24)
            $0.width.equalTo(45)
        }
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension MobileOperatorCell {
    func mobileOperatorConfgure(withViewModel mobileViewModel:MobileOperatorsViewModelPresentable) ->(Void) {
                mobileOperatorText.text = mobileViewModel.mobileItems
                mobileOperatorImage.image = UIImage(named:mobileViewModel.mobileImage!)
                bonusImage.image = UIImage(named:mobileViewModel.mobileBonusImage!)
  }
}

