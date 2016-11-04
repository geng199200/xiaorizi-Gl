//
//  MainDetailViewController.swift
//  xiaorizi-Gl
//
//  Created by 66 on 2016/11/3.
//  Copyright © 2016年 genju. All rights reserved.
//

import UIKit
import WebKit
import SnapKit

class MainDetailViewController: UIViewController {
    public var itemModel: ItemModel?
    var wkWebView: WKWebView!
    let progress: UIProgressView = {
        let progress = UIProgressView()
        progress.tintColor = UIColor.red
        progress.progress = 0
        progress.alpha = 0
        return progress
    } ()


    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configWebView()
        self.wkWebView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.wkWebView.removeObserver(self, forKeyPath: "estimatedProgress")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: KVO

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progress.alpha = 1
            self.progress.setProgress(Float(self.wkWebView.estimatedProgress), animated:true)
            if self.wkWebView.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut, animations: {
                    self.progress.alpha = 0
                    }, completion: { (finshed: Bool) in
                        self.progress.progress = 0
                })
            }
        }
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

        self.wkWebView.addSubview(self.progress)
        self.progress.snp.makeConstraints { (make) in
            make.left.equalTo(self.wkWebView.snp.left)
            make.top.equalTo(self.wkWebView.snp.top).offset(64)
            make.right.equalTo(self.wkWebView.snp.right)
            make.height.equalTo(5)
        }

        let url = URL.init(string: (self.itemModel?.url)!)
        let request = URLRequest.init(url: url!)
        self.wkWebView.load(request)

    }
}
