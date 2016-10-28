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

  class func barButtonItemWithLeftIcon(icon: String, _ highlightedIcon: String, _ target: Any, _ action: Selector) -> UIBarButtonItem {
        let leftButton: UIButton = UIButton.init(type: UIButtonType.custom)
        leftButton.frame = CGRect.init(x: 0, y: 0, width: 44, height: 44)
        leftButton.setImage(UIImage.init(named: icon), for: UIControlState.normal)
        leftButton.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        return UIBarButtonItem.init(customView: leftButton)
    }
    
    class  func barButtonItemWithRightIcons(icon: String, _ highlightedIcon: String, _ target: Any, _ action: Selector, _ secondIcon: String, _ secondHighlightedIcon: String, _ secondTarget: Any, _ secondAction: Selector) -> Array
     <UIBarButtonItem>{
        let firstRightBtn: UIButton = UIButton.init(type: .custom)
        firstRightBtn.frame = CGRect.init(x: 0, y: 0, width: 44, height: 44)
        firstRightBtn.setImage(UIImage.init(named: icon), for: .normal)
        firstRightBtn.addTarget(target, action: action, for: .touchUpInside)
        let firstItem = UIBarButtonItem.init(customView: firstRightBtn)

        let secondRightBtn: UIButton = UIButton.init(type: .custom)
        secondRightBtn.frame = CGRect.init(x: 0, y: 0, width: 44, height: 44)
        secondRightBtn.setImage(UIImage.init(named: secondIcon), for: .normal)
        secondRightBtn.addTarget(secondTarget, action: secondAction, for: .touchUpInside)
        let secondItem = UIBarButtonItem.init(customView: secondRightBtn)

        return [firstItem, secondItem]
    }
}
