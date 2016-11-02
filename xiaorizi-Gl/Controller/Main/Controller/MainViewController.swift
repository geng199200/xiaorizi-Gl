//
//  MainViewController.swift
//  xiaorizi-Gl
//
//  Created by 66 on 2016/10/25.
//  Copyright © 2016年 genju. All rights reserved.
//

import UIKit
import SwiftyJSON
import SnapKit
import ObjectMapper

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     var repos = [Any]()
    lazy var tableView = UITableView()
    let headerView: ListHeaderView = {
        let headerView = ListHeaderView()
        headerView.frame = CGRect.init(x: 0, y: 0, width:screenWidth , height: 66)
        return headerView
    } ()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupMainView()
        self.initSubviews()
        DispatchQueue.global().async {
            self.mainRequest()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: config UI

    func setupMainView() {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = RGB(r: 28.0, g: 28.0, b: 28.0)
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        UIApplication.shared.statusBarStyle = .lightContent
         self.navigationItem.leftBarButtonItem = UIBarButtonItem.barButtonItemWithLeftIcon(icon: "near_2", "", self, #selector(MainViewController.leftAction))
        self.navigationItem.rightBarButtonItems = UIBarButtonItem.barButtonItemWithRightIcons(icon: "ta_2", "", self, #selector(MainViewController.peopleAction), "search_1", "", self, #selector(MainViewController.searchAction))
    }

    //MARK: init view

    func initSubviews() {
        self.tableView.register(LifeListTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.register(ListImageTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorColor = UIColor.clear
    }

    //MARK: UITableViewDataSource

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! ListImageTableViewCell
            cell.setData(self.repos[indexPath.row] as! ItemModel)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as! LifeListTableViewCell
            cell.setData(self.repos[indexPath.row] as! ItemModel)
            return cell
        }
    }

    //MARK: UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 200
        } else {
            return 110
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

    //MARK: LoadDta

    func mainRequest() {
        _ = mainProvider.request(.page(page: 1), completion: { result in
            switch result {
            case let .success(moyaResponse):
                do {
                   let json = try moyaResponse.mapJSON()
                    print(json)
                   let resultModel =  Mapper<LiftListModel>().map(JSON: json as! [String : Any])
                   self.repos = (resultModel?.list)!
                    self.headerView.setDats((resultModel?.dayDic)!)
                    self.tableView.tableHeaderView = self.headerView

                } catch  {

                }
                print(onePointLine)
                self.tableView.reloadData()

            case let .failure(error):
                print(error.response)
                break
            }
            
        })
    }

    //MARK: Action
    
    func leftAction() {
    }

    func searchAction() {

    }

    func peopleAction() {
    }


}
