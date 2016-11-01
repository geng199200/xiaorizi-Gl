//
//  LifeListTableViewCell.swift
//  xiaorizi-Gl
//
//  Created by 66 on 2016/11/1.
//  Copyright © 2016年 genju. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit
class LifeListTableViewCell: UITableViewCell {

    var liftImageView = UIImageView()
    

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
        self.selectionStyle = UITableViewCellSelectionStyle.default
    }

    func setup() {
        self.contentView.addSubview(liftImageView)
        self.liftImageView.contentMode = UIViewContentMode.scaleAspectFill
        self.liftImageView.clipsToBounds = true
        self.liftImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(10)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.size.equalTo(CGSize(width: 120, height: 80))
        }
    }

    func setData(_ item: ItemModel)  {
        let url = URL(string: item.img!)!
        liftImageView.kf.setImage(with: url)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
