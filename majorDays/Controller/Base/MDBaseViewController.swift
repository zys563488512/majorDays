//
//  MDBaseViewController.swift
//  majorDays
//
//  Created by Jay on 2018/1/20.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class MDBaseViewController: UIViewController {
    var bgImageView : UIImageView!
    var titleButton : UIButton!
    var rightBarButton : UIButton!
    var leftBarButton : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.setSetup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.bgImageView.image = UIImage(named: Constant.getThemeBGImage())
    }
    func setSetup() {
        self.bgImageView = UIImageView()
        self.view.addSubview(self.bgImageView)
        
        self.leftBarButton = UIButton()
        self.leftBarButton.tag = 1001
        self.view.addSubview(self.leftBarButton)
        
        self.titleButton = UIButton()
        self.titleButton.tag = 1002
        self.titleButton.titleLabel?.font = UIFont(name: FontFmailyName.AmericanTypewriter.rawValue, size: 17)
        self.titleButton.setTitleColor(UIColor.white, for: .normal)
//        self.titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        self.titleButton.setTitleColor(UIColor.white, for: .normal)
        self.view.addSubview(self.titleButton)
        
        self.rightBarButton = UIButton()
        self.rightBarButton.tag = 1003
        self.view.addSubview(self.rightBarButton)
        
        self.bgImageView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(KScreenWidth)
            make.height.equalTo(KScreenHeight)
            make.center.equalTo(self.view)
        }
        self.leftBarButton.snp.makeConstraints { (make) in
            make.width.equalTo(33)
            make.height.equalTo(33)
            make.top.equalTo(31)
            make.left.equalTo(15)
        }
        self.titleButton.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(33)
            make.top.equalTo(31)
            make.centerX.equalTo(self.view)
        }
        self.rightBarButton.snp.makeConstraints { (make) in
            make.width.equalTo(33)
            make.height.equalTo(33)
            make.top.equalTo(31)
            make.right.equalTo(self.view).offset(-15)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
