//
//  MOViewModel.swift
//  Oson.task
//
//  Created by Shakhzod Bektemirov on 2022/01/18.
//

import Foundation
import UIKit


protocol MobileOperatorsViewModelPresentable {
    var mobileItems:String? { get }
    var mobileImage:String? { get }
    var mobileBonusImage:String? { get }
}

class MobileOperatorViewModel:MobileOperatorsViewModelPresentable {
    
    var mobileItems: String? = ""
    var mobileImage: String? = ""
    var mobileBonusImage: String? = nil
   
    
    init(mobileItems:String,mobileImage:String,mobileBonusImage:String) {
        self.mobileItems = mobileItems
        self.mobileImage = mobileImage
        self.mobileBonusImage = mobileBonusImage
    }
}

class MOViewModel {
    init() {
        let mo1 = MobileOperatorViewModel(mobileItems:"Beeline", mobileImage:"Beeline" ,mobileBonusImage:"bonus")
        let mo3 = MobileOperatorViewModel(mobileItems:"Ucell", mobileImage:"Logo",mobileBonusImage:"nil")
        let mo4 = MobileOperatorViewModel(mobileItems:"UzMobile GSM", mobileImage:"uzMobile",mobileBonusImage:"bonus")
        let mo5 = MobileOperatorViewModel(mobileItems:"UzMobile CDMA", mobileImage:"uzMobile",mobileBonusImage:"nil")
        let mo6 = MobileOperatorViewModel(mobileItems:"Beeline (Кыргызстан)", mobileImage:"Beeline",mobileBonusImage:"bonus")
        let mo7 = MobileOperatorViewModel(mobileItems:"Beeline (Россия)", mobileImage:"Beeline",mobileBonusImage:"bonus")
        let mo8 = MobileOperatorViewModel(mobileItems:"Beeline (Казахстан)", mobileImage:"Beeline",mobileBonusImage:"bonus")
        
        MOItems.append(contentsOf: [mo1,mo3,mo4,mo5,mo6,mo7,mo8])
    }
    
    var MOItems: [MobileOperatorsViewModelPresentable] = []
}

