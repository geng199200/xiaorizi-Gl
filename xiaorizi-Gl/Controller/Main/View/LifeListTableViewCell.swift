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
    let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        return label
    }()
    let tagsLabel: UILabel = {
        let label = UILabel()
        label.textColor = RGB(r: 166, g: 166, b: 166)
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    } ()

    let line: UIView = {
        let view = UIView()
        view.backgroundColor = RGB(r: 220, g: 220, b: 223)
        return view
    }()




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
            make.size.equalTo(CGSize(width: 130, height: 80))
        }

        self.contentView.addSubview(self.contentLabel)
        self.contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.liftImageView.snp.right).offset(10)
            make.top.equalTo(self.liftImageView.snp.top)
            make.right.equalTo(self.contentView.snp.right).offset(-20)
        }

        self.contentView.addSubview(self.tagsLabel)
        self.tagsLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentLabel.snp.left)
            make.bottom.equalTo(self.liftImageView.snp.bottom).offset(-5)
        }

        self.addSubview(self.line)
        self.line.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(10)
            make.right.equalTo(self.snp.right).offset(-10)
            make.bottom.equalTo(self.snp.bottom).offset(-1)
            make.height.equalTo(1)
        }
    }

    func setData(_ item: ItemModel)  {
        let url = URL(string: item.img!)!
        liftImageView.kf.setImage(with: url)
        contentLabel.text = item.title!
        var tages = "#"
        tages = "\(tages) \(item.tags!)"
        tages = tages.replacingOccurrences(of: ",", with: " # ")
        tagsLabel.text = tages

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
