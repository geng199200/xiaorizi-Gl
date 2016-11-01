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
        imageView.frame = CGRect.init(x: 0, y: 0, width: 50, height: 30)
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
    }

    func setData(_ item: ItemModel)  {
        let url = URL(string: item.img!)!
        liftImageView.kf.setImage(with: url,
                              placeholder: nil,
                              options: [.transition(.fade(1))],
                              progressBlock: nil,
                              completionHandler: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
