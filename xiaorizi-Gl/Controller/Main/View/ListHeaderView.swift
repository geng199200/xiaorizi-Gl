//
//  ListHeaderView.swift
//  xiaorizi-Gl
//
//  Created by 66 on 2016/11/2.
//  Copyright © 2016年 genju. All rights reserved.
//

import UIKit
import SnapKit

class ListHeaderView: UIView {
    var titleLabel = UILabel()
    var dateLabel = UILabel()
    let line: UIView = {
        let view = UIView()
        view.backgroundColor = RGB(r: 220, g: 220, b: 223)
        return view
    }()

    let subscriptLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = RGB(r: 217, g: 58, b: 36)
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = NSTextAlignment.center
        label.layer.cornerRadius = 25 / 2
        label.clipsToBounds = true
        return label
    } ()




    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }

    func configUI()  {
        self.addSubview(self.titleLabel)
        self.titleLabel.font = UIFont.systemFont(ofSize: 15)
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(self.snp.left).offset(50)
        }

        self.addSubview(self.line)
        self.line.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(10)
            make.right.equalTo(self.snp.right).offset(-10)
            make.bottom.equalTo(self.snp.bottom).offset(-1)
            make.height.equalTo(1)
        }

        self.addSubview(self.subscriptLabel)
        self.subscriptLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-10)
            make.size.equalTo(CGSize.init(width: 25, height: 25))
        }
    }

    public func setDats(_ dataDic: [String : Any]) {
        self.titleLabel.text = dataDic["title"] as! String?
        let like = dataDic["like"] as! Int
        self.subscriptLabel.text = "\(like)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
