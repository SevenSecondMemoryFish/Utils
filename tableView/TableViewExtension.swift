//
//  Extension.swift
//  Test
//
//  Created by 样本通可 on 2019/2/11.
//  Copyright © 2019 样本通可. All rights reserved.
//

import UIKit
extension UITableView {
    
    /// 动态约束设置headerView的高度
    /// 注意：
    ///     1.不需要设置headview的高度
    ///     2.在viewDidLayoutSubviews调用此方法,来显示正确的headview的高度
    ///     3.在更改数据或者高度的时候，也是需要调用此方法，来显示正确的高度
    ///     4.如果headerView里面UILabel多行的时候，需要在headerView的layoutSubviews设置UILable的preferredMaxLayoutWidth
    ///     例如：label.preferredMaxLayoutWidth = label.bounds.width
    func wj_sizeHeaderToFit(_ animation:Bool = true)  {
        let _headerView = self.tableHeaderView
        guard let headerView = _headerView else {
            return
        }
        headerView.setNeedsLayout()
        // 立马布局子视图
        headerView.layoutIfNeeded()
        let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        var frame = headerView.frame
        frame.size.height = height
        headerView.frame = frame
        // 重新设置tableHeaderView
        if animation {/// 动画
            self.beginUpdates()
            self.tableHeaderView = headerView
            self.endUpdates()
        }else{
           self.tableHeaderView = headerView
        }
    }
}
