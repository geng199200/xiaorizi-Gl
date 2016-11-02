//
//  ListImageTableViewCell.swift
//  xiaorizi-Gl
//
//  Created by 66 on 2016/11/2.
//  Copyright © 2016年 genju. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class ListImageTableViewCell: UITableViewCell {

    let contentImage: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = UIViewContentMode.scaleAspectFill
        imageview.clipsToBounds = true
        return imageview
    } ()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: 5)
        label.textColor = UIColor.white
        label.numberOfLines = 3
        label.textAlignment = NSTextAlignment.center
        return label
    } ()

    let tagsLabel: UILabel = {
        let label = UILabel()
        label.textColor = RGB(r: 212, g: 212, b: 204)
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    } ()



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

    func setup() {
        self.contentView.addSubview(self.contentImage)
        self.contentImage.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left)
            make.top.equalTo(self.contentView.snp.top)
            make.right.equalTo(self.contentView.snp.right)
            make.bottom.equalTo(self.contentView.snp.bottom)
        }

        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(10)
            make.right.equalTo(self.contentView.snp.right).offset(-10)
            make.top.equalTo(self.contentView.snp.top).offset(40)
        }

        self.contentView.addSubview(self.tagsLabel)
        self.tagsLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.contentView.snp.centerX)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
        }
    }

    public func setData(_ item: ItemModel) {
        let  url = URL.init(string: item.img!)
        self.contentImage.kf.setImage(with: url)
        self.titleLabel.text = item.title
        var tages = "#"
        tages = "\(tages) \(item.tags!)"
        tages = tages.replacingOccurrences(of: ",", with: " # ")
        tagsLabel.text = tages
    }
}
