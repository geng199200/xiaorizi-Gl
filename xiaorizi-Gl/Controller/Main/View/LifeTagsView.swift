//
//  LifeTagsView.swift
//  xiaorizi-Gl
//
//  Created by 66 on 2016/11/3.
//  Copyright © 2016年 genju. All rights reserved.
//

import UIKit
import SnapKit

protocol LifeTagsViewDelegate: class {
    func touchItem(_ id: Int)
}


class LifeTagsView: UIView {

    weak var delegate: LifeTagsViewDelegate?

    var btnArray = [UIButton]()
    var dataArray = [Any]()


    init() {
        super.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createSubviews()  {
        let cols = 4
        let btnWidth = CGFloat(65)
        let btnHeight = CGFloat(50)
        let colMargin = ((screenWidth - 20) - CGFloat(cols) * btnWidth) / CGFloat((cols - 1 ))

        for i in 0...7 {
            let btn = UIButton.init(type: .custom)
            btn.setTitleColor(RGB(r: 60, g: 60, b: 60), for: .normal)
            btn.setTitle("123", for: .normal)
            btn.tag = i
            btn.addTarget(self, action: #selector(tagsAction), for: .touchUpInside)
            let col:Int = i % cols
            let viewX = CGFloat(col) * (btnWidth + colMargin)
            let row = i / cols
            let viewY = CGFloat(row) * (btnHeight + CGFloat(10))
            btn.frame = CGRect.init(x: viewX, y: viewY, width: btnWidth, height: btnHeight)
            self.addSubview(btn)
            self.btnArray.append(btn)
        }
    }

    func tagsAction(_ sender: UIButton) {
        let  dic = self.dataArray[sender.tag] as! NSDictionary
        self.delegate?.touchItem(dic["id"] as! Int)
       
    }

    public func setDatas(_ data:Array<Any>) {
        self.dataArray = data
        for (index, obj) in self.btnArray.enumerated() {
            let btn = obj 
            let dic = data[index] as! NSDictionary
            let title = dic["name"] as! String
            btn.setTitle(title, for: .normal)
        }
    }

}
