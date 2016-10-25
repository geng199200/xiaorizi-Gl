//
//  UIBarButtonItem+Utils.swift
//  xiaorizi-Gl
//
//  Created by 66 on 2016/10/25.
//  Copyright © 2016年 genju. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    func barButtonItemWithLeftIcon(icon: String, _ highlightedIcon: String, _ target: Any, _ action: Selector) -> UIBarButtonItem {
        let leftButton: UIButton = UIButton.init(type: UIButtonType.custom)
        leftButton.frame = CGRect.init(x: 20, y: 20, width: 44, height: 44)
        leftButton.setImage(UIImage.init(named: icon), for: UIControlState.normal)
        leftButton.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        return UIBarButtonItem.init(customView: leftButton)
    }

    func barButtonItemWithRightIcon(icon: String) -> UIBarButtonItem {
        return UIBarButtonItem.init(customView: UIView.init())
    }
}
