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

    var liftImageView: UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        return imageView
    }


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

    func setup() {
        self.contentView.addSubview(liftImageView)
        liftImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(10)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.size.equalTo(CGSize.init(width: 65, height: 40))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
