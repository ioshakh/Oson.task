//
//  MainVc.swift
//  Oson.task
//
//  Created by Shakhzod Bektemirov on 2022/01/17.
//

import UIKit
import SnapKit

class MainVc: UIViewController {
    
    var viewModel:ItemsViewModel?
    
    let searchBar = UISearchBar()
    
    private lazy var tableView:UITableView = {
         let tabview = UITableView()
         tabview.delegate = self
         tabview.dataSource = self
         tabview.registerCell(PaymentCategoriesCell.self)
         tabview.showsVerticalScrollIndicator = false
         tabview.translatesAutoresizingMaskIntoConstraints = false
         
         return tabview
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString:"FFFFFF")
        setUp()
    }
    
    // Navigation Bar
    private func addNavbar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image:UIImage(named:"arrow-left")
            ,style:.done
            ,target:self
            ,action:#selector(leftTapped)
        )
    }
    
    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                                target: self,
                                                                action: #selector(rightTapped))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    //Mark: - Actions
    @objc func leftTapped() {}
    
    @objc func rightTapped() {
        searchBar.becomeFirstResponder()
        search(shouldShow: true)
    }
    
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
}


extension MainVc {
    private func setUp() {
        addNavbar()
        initView()
        embedSubviews()
        setSubviewsConstraints()
    }
    
    private func initView(){
        title = "Оплата"
    }
    
    func embedSubviews() {
        view.addSubview(tableView)
        viewModel = ItemsViewModel()
        searchBar.sizeToFit()
        searchBar.delegate = self
        showSearchBarButton(shouldShow: true)
    }
    
    func setSubviewsConstraints() {
        tableView.snp.makeConstraints { make in
           make.edges.equalToSuperview()
        }
    }
}

extension MainVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return (viewModel?.items.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:PaymentCategoriesCell =  tableView.dequeueCell(for:indexPath)
        
        let postitem = viewModel?.items[indexPath.row]
        cell.configure(withViewModel:postitem!)
        cell.separatorInset = UIEdgeInsets.init(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
        cell.selectionStyle = .none
        
        return cell
    
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1 {
            let cv = MobileOperatorsVc()
            self.navigationController?.pushViewController(cv, animated: true)
           }
        }
     }

    



extension MainVc: UISearchBarDelegate {
   
    
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



