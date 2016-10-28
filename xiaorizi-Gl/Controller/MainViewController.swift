//
//  MainViewController.swift
//  xiaorizi-Gl
//
//  Created by 66 on 2016/10/25.
//  Copyright © 2016年 genju. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configMainView()
        mainRequest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configMainView() {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = RGB(r: 28.0, g: 28.0, b: 28.0)
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        UIApplication.shared.statusBarStyle = .lightContent
         self.navigationItem.leftBarButtonItem = UIBarButtonItem.barButtonItemWithLeftIcon(icon: "near_2", "", self, #selector(MainViewController.leftAction))
        self.navigationItem.rightBarButtonItems = UIBarButtonItem.barButtonItemWithRightIcons(icon: "ta_2", "", self, #selector(MainViewController.peopleAction), "zdsearch", "", self, #selector(MainViewController.searchAction))

    }
    
    func leftAction() {

    }

    func searchAction() {

    }

    func peopleAction() {

    }

    // MARK: Request Data

    func mainRequest() {
        _ = mainProvider.request(MainAPI.life("volatile")) {result in
    }




    



}
