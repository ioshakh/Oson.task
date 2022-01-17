//
//  MobileOperatorsVc.swift
//  Oson.task
//
//  Created by Shakhzod Bektemirov on 2022/01/18.
//

import UIKit

protocol SearchDelegate {
    func search(shouldShow:Bool)
    
    func showSearchBarButton(shouldShow:Bool)
}

class MobileOperatorsVc: UIViewController {

    let searchBar = UISearchBar()
    
    var viewModel:MOViewModel?
    
    
    private lazy var mobiletable:UITableView = {
         let tabview = UITableView()
         tabview.delegate = self
         tabview.dataSource = self
         tabview.registerCell(MobileOperatorCell.self)
         tabview.showsVerticalScrollIndicator = false
         tabview.translatesAutoresizingMaskIntoConstraints = false
         
         return tabview
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Мобильные операторы"
        searchBar.sizeToFit()
        searchBar.delegate = self
        showSearchBarButton(shouldShow: true)
        addNavbar()
        
        view.addSubview(mobiletable)
       // view.addSubview(tableView)
        
       // mobiletable.frame = view.bounds
        viewModel = MOViewModel()
//        mobiletable.snp.makeConstraints { make in
//           make.edges.equalToSuperview()
//        }
        
        
        NSLayoutConstraint.activate([
            mobiletable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mobiletable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mobiletable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mobiletable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    private func addNavbar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image:UIImage(named:"arrow-left")
            ,style:.done
            ,target:self
            ,action:#selector(leftTapped)
        )
    }
    
    //Mark: - Actions
    @objc func leftTapped() {
        navigationController?.popViewController(animated:true)
    }
    
    @objc func rightTapped() {
        searchBar.becomeFirstResponder()
        search(shouldShow: true)
    }

}


extension MobileOperatorsVc:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.MOItems.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MobileOperatorCell =  tableView.dequeueCell(for:indexPath)
        
        let opItems = viewModel?.MOItems[indexPath.row]
        cell.mobileOperatorConfgure(withViewModel:opItems!)
        cell.separatorInset = UIEdgeInsets.init(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    
}


extension MobileOperatorsVc:SearchDelegate{
    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
              navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                                       target: self,
                                                                       action: #selector(rightTapped))
               } else {
                   navigationItem.rightBarButtonItem = nil
               }
    }
    
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
    
}

extension MobileOperatorsVc: UISearchBarDelegate {
   
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Search bar editing did begin..")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Search bar editing did end..")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
  }



