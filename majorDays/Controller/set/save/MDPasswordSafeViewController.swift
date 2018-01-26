//
//  MDPasswordSafeViewController.swift
//  majorDays
//
//  Created by 张永盛 on 2018/1/21.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class MDPasswordSafeViewController: MDBaseViewController,UITableViewDataSource,UITableViewDelegate {
    var tableView : UITableView!
    var titleText : UITextField!
    var isSole = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.leftBarButton.setImage(UIImage(named:"tabbar_fh"), for: .normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.leftBarButton!)
        self.titleButton.setTitle("密码保护", for: .normal)
        self.leftBarButton.addTarget(self, action: #selector(self.addEvent(btn:)), for: .touchUpInside)
        self.titleButton.addTarget(self, action: #selector(self.addEvent(btn:)), for: .touchUpInside)
        
        self.tableView = UITableView()
        self.tableView.backgroundColor = Constant.bgGrayColor()
        self.tableView.separatorStyle = .none
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(64)
            make.width.equalTo(KScreenWidth)
            make.height.equalTo(KScreenHeight - 64)
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeight = 0
        switch indexPath.row {
        case 0:
            cellHeight = 20
            break
        default:
            cellHeight = 44
            break
        }
        return CGFloat(cellHeight)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.backgroundColor = Constant.bgGrayColor()
        cell.selectionStyle = .none
        
        switch indexPath.row {
        case 1:
            cell.backgroundColor = UIColor.white
            let leftImage = UIImageView(frame: CGRect(x: 10, y: 15, width: 12.5, height: 12.5))
            leftImage.image = UIImage(named: "home_kssh")
            
            let leftLabel = UILabel(frame: CGRect(x: 32.5, y: 0, width: 100, height: 43))
            leftLabel.font = UIFont.systemFont(ofSize: 13)
            leftLabel.textColor = UIColor.black
            leftLabel.text = "数字密码"
            let chooseNumberSwitch = UISwitch(frame: CGRect(x: KScreenWidth - 60, y: 7, width: 50, height: 30))
            chooseNumberSwitch.isOn = false
            chooseNumberSwitch.addTarget(self, action: #selector(self.setIsNumberPassword(set:)), for: .touchUpInside)
            chooseNumberSwitch.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
            let lineLabel = UILabel(frame: CGRect(x: 0, y: 43, width: KScreenWidth, height: 1))
            lineLabel.backgroundColor = Constant.bgGrayColor()
            
            cell.contentView.addSubview(leftImage)
            cell.contentView.addSubview(leftLabel)
            cell.contentView.addSubview(chooseNumberSwitch)
            cell.contentView.addSubview(lineLabel)
            break
        case 2:
            cell.backgroundColor = UIColor.white
            let leftImage = UIImageView(frame: CGRect(x: 10, y: 15, width: 12.5, height: 12.5))
            leftImage.image = UIImage(named: "home_kssh")
            
            let leftLabel = UILabel(frame: CGRect(x: 32.5, y: 0, width: 100, height: 43))
            leftLabel.font = UIFont.systemFont(ofSize: 13)
            leftLabel.textColor = UIColor.black
            leftLabel.text = "指纹密码"
            let chooseNumberSwitch = UISwitch(frame: CGRect(x: KScreenWidth - 60, y: 7, width: 50, height: 30))
            chooseNumberSwitch.isOn = false
            chooseNumberSwitch.addTarget(self, action: #selector(self.setIsTouchPassword(set:)), for: .touchUpInside)
            chooseNumberSwitch.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
            let lineLabel = UILabel(frame: CGRect(x: 0, y: 43, width: KScreenWidth, height: 1))
            lineLabel.backgroundColor = Constant.bgGrayColor()
            
            cell.contentView.addSubview(leftImage)
            cell.contentView.addSubview(leftLabel)
            cell.contentView.addSubview(chooseNumberSwitch)
            cell.contentView.addSubview(lineLabel)
            break
        default:
            break
        }
        return cell
    }
    /*
     * 设置数字密码
     */
    @objc func setIsNumberPassword(set:UISwitch) {
        if self.isSole == 0 {
            set.isOn = true
            self.isSole = 1
        }else if self.isSole == 1{
            set.isOn = false
            self.isSole = 0
        }else {
            set.isOn = false
            SVProgressHUD.showError(withStatus: "两种密码方式只能选其一哦～")
        }
    }
    /*
     * 设置指纹密码
     */
    @objc func setIsTouchPassword(set:UISwitch) {
        if self.isSole == 0 {
            set.isOn = true
            self.isSole = 2
        }else if self.isSole == 2{
            set.isOn = false
            self.isSole = 0
        }else {
            set.isOn = false
            SVProgressHUD.showError(withStatus: "两种密码方式只能选其一哦～")
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1: //主题
            break
        case 2: //widget显示事件
            break
        case 3: //密码保护
            break
        case 5: //备份到icould
            break
        case 6: //分享
            break
        default:
            break
        }
    }
    @objc func addEvent(btn:UIButton) {
        switch btn.tag {
        case 1001:
            self.dismiss(animated: true, completion: nil)
            break
        case 1002:
            
            break
        default:
            break
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

