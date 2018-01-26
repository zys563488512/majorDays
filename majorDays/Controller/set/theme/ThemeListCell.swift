//
//  ThemeListCell.swift
//  majorDays
//
//  Created by 张永盛 on 2018/1/26.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class ThemeListCell: UICollectionViewCell {
    
    var imageView : UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setSetup() {
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        self.imageView = UIImageView()
        self.imageView.contentMode = .scaleAspectFill
        self.contentView.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(60)
            make.width.equalTo(60)
        }
    }
}
