//
//  Post.swift
//  Oson.task
//
//  Created by Shakhzod Bektemirov on 2022/01/17.
//

import Foundation
import UIKit


protocol PaymentItemsPresentable {
    var item:String? { get }
    var modelImage:String? { get }
}

class PaymentItemsViewModel:PaymentItemsPresentable {
    
    var modelImage: String? = ""
    var item: String? = ""
   
    
    init(item:String,modelImage:String) {
        self.item = item
        self.modelImage = modelImage
    }
}

class ItemsViewModel {
    init() {
        let item1 = PaymentItemsViewModel(item:"Мобильные операторы", modelImage:"mobile")
        let item2 = PaymentItemsViewModel(item:"Интернет провайдеры", modelImage:"wifi")
        let item3 = PaymentItemsViewModel(item:"Телефония", modelImage:"telePhone")
        let item4 = PaymentItemsViewModel(item:"Гос. и Коммунальные услуги", modelImage:"bag-alt")
        let item5 = PaymentItemsViewModel(item:"Служба такси", modelImage:"taxi")
        let item6 = PaymentItemsViewModel(item:"Онлайн сервисы", modelImage:"cube")
        let item7 = PaymentItemsViewModel(item:"Обучение", modelImage:"graduation-hat")
        let item8 = PaymentItemsViewModel(item:"Благотворительность", modelImage:"flower")
        let item9 = PaymentItemsViewModel(item:"Покупки", modelImage:"shopping-trolley")
        let item10 = PaymentItemsViewModel(item:"Объявление и реклама", modelImage:"document")
        let item11 = PaymentItemsViewModel(item:"Рестораны и кафе", modelImage:"coffee")
        let item12 = PaymentItemsViewModel(item:"Хостинг провайдеры", modelImage:"server-network")
        let item13 = PaymentItemsViewModel(item:"Медицина", modelImage:"medkit")
        let item14 = PaymentItemsViewModel(item:"Авиабилеты", modelImage:"plane-departure")
        let item15 = PaymentItemsViewModel(item:"Электронные кошельки", modelImage:"wallet")
        
        
        items.append(contentsOf:[item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item11,item12,item13,item14,item15])
    }
    
    var items: [PaymentItemsPresentable] = []
}

