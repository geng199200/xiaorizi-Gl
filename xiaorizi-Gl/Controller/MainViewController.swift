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
        self.configMainView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configMainView() {
        self.view.backgroundColor = UIColor.white
        let leftItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(leftAction))
        self.navigationItem.leftBarButtonItem = leftItem

    }

    func leftAction(sender: UIButton) {
        print(sender)
    }
    



}
