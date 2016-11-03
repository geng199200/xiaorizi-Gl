//
//  MainDetailViewController.swift
//  xiaorizi-Gl
//
//  Created by 66 on 2016/11/3.
//  Copyright © 2016年 genju. All rights reserved.
//

import UIKit
import WebKit

class MainDetailViewController: UIViewController {
    public var itemModel: ItemModel?
    var wkWebView: WKWebView!


    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configWebView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Private Method

    func setup() {
        self.view.backgroundColor = UIColor.white
    }

    func configWebView(){
        self.wkWebView = WKWebView()
        self.view.addSubview(self.wkWebView)
        self.wkWebView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
            make.top.equalTo(self.view.snp.top).offset(0)
        }
        let url = URL.init(string: (self.itemModel?.url)!)
        let request = URLRequest.init(url: url!)
        self.wkWebView.load(request)

    }
    



}
