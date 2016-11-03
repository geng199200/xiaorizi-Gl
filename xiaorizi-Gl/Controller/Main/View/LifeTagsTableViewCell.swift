
//
//  LifeTagsTableViewCell.swift
//  xiaorizi-Gl
//
//  Created by 66 on 2016/11/3.
//  Copyright © 2016年 genju. All rights reserved.
//

import UIKit
import SnapKit

protocol LifeTagsTableViewCellDelegate: class {
    func didTags(_ id: Int)
}

class LifeTagsTableViewCell: UITableViewCell, LifeTagsViewDelegate {
    internal func touchItem(_ id: Int) {
       self.delegate?.didTags(id)
    }

    weak var delegate: LifeTagsTableViewCellDelegate?

    var tagsView = LifeTagsView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup()  {
        self.contentView.backgroundColor = RGB(r: 249, g: 249, b: 249)
        self.contentView.addSubview(self.tagsView)
        self.tagsView.delegate = self
        self.tagsView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(10)
            make.top.equalTo(self.contentView.snp.top).offset(15)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-15)
            make.right.equalTo(self.contentView.snp.right).offset(-10)
        }
    }

    public func setItemData(_ tags: [Any]) {
        self.tagsView.setDatas(tags)
    }

}
