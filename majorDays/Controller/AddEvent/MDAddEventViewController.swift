//
//  MDAddEventViewController.swift
//  majorDays
//
//  Created by Jay on 2018/1/21.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class MDAddEventViewController: MDBaseViewController,UITableViewDataSource,UITableViewDelegate {
    var tableView : UITableView!
    var titleText : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:"home_bg2"), for: .default)
        
        self.leftBarButton.setImage(UIImage(named:"tabbar_fh"), for: .normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.leftBarButton!)
        self.rightBarButton.setImage(UIImage(named:"home_tj"), for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.rightBarButton!)
        self.titleButton.setTitle("新增", for: .normal)
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
        return 7
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeight = 0
        switch indexPath.row {
        case 0:
            cellHeight = 20
            break
        case 4:
            cellHeight = 10
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
            let leftLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: 43))
            leftLabel.font = UIFont.systemFont(ofSize: 14)
            leftLabel.textColor = UIColor.black
            leftLabel.text = "标题"
            
            self.titleText = UITextField(frame: CGRect(x: 110, y: 0, width: KScreenWidth - 140, height: 43))
            self.titleText.textAlignment = .right
            self.titleText.font = UIFont(name: FontFmailyName.Noteworthy.rawValue, size: 12)
            self.titleText.placeholder = "点滴记录"
    
            let lineLabel = UILabel(frame: CGRect(x: 0, y: 43, width: KScreenWidth, height: 1))
            lineLabel.backgroundColor = Constant.bgGrayColor()
            
            cell.contentView.addSubview(leftLabel)
            cell.contentView.addSubview(self.titleText)
            cell.contentView.addSubview(lineLabel)
            break
        case 2:
            cell.backgroundColor = UIColor.white
            let leftLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: 43))
            leftLabel.font = UIFont.systemFont(ofSize: 14)
            leftLabel.textColor = UIColor.black
            leftLabel.text = "日期"
            
            let reightlabel = UILabel(frame: CGRect(x: 110, y: 0, width: KScreenWidth - 140, height: 43))
            reightlabel.textAlignment = .right
            reightlabel.textColor = UIColor.black
            reightlabel.font = UIFont.systemFont(ofSize: 12)
            reightlabel.text = Constant.getNowYearMonthDay()

            let lineLabel = UILabel(frame: CGRect(x: 0, y: 43, width: KScreenWidth, height: 1))
            lineLabel.backgroundColor = Constant.bgGrayColor()
            
            cell.contentView.addSubview(leftLabel)
            cell.contentView.addSubview(reightlabel)
            cell.contentView.addSubview(lineLabel)
            break
        case 3:
            cell.backgroundColor = UIColor.white
            let leftLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: 43))
            leftLabel.font = UIFont.systemFont(ofSize: 14)
            leftLabel.textColor = UIColor.black
            leftLabel.text = "分类"
            
            let reightlabel = UILabel(frame: CGRect(x: KScreenWidth - 110, y: 0, width: 80, height: 43))
            reightlabel.textAlignment = .right
            reightlabel.textColor = UIColor(string: "#8c8c8c")
            reightlabel.font = UIFont.systemFont(ofSize: 12)
            reightlabel.text = "全部订单"
            
            let reightImage = UIImageView(frame: CGRect(x: KScreenWidth - 20, y: 17, width: 4.5, height: 8.5))
            reightImage.image = UIImage(named: "home_alljt")
            
            let lineLabel = UILabel(frame: CGRect(x: 0, y: 43, width: KScreenWidth, height: 1))
            lineLabel.backgroundColor = Constant.bgGrayColor()
            
            cell.contentView.addSubview(leftLabel)
            cell.contentView.addSubview(reightlabel)
            cell.contentView.addSubview(reightImage)
            cell.contentView.addSubview(lineLabel)
            break
        case 5:
            cell.backgroundColor = UIColor.white
            let leftLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: 43))
            leftLabel.font = UIFont.systemFont(ofSize: 14)
            leftLabel.textColor = UIColor.black
            leftLabel.text = "置顶"
            
            let reightlabel = UILabel(frame: CGRect(x: KScreenWidth - 110, y: 0, width: 80, height: 43))
            reightlabel.textAlignment = .right
            reightlabel.textColor = UIColor(string: "#8c8c8c")
            reightlabel.font = UIFont.systemFont(ofSize: 12)
            reightlabel.text = "全部订单"
            
            let reightImage = UIImageView(frame: CGRect(x: KScreenWidth - 20, y: 17, width: 4.5, height: 8.5))
            reightImage.image = UIImage(named: "home_alljt")
            
            let lineLabel = UILabel(frame: CGRect(x: 0, y: 43, width: KScreenWidth, height: 1))
            lineLabel.backgroundColor = Constant.bgGrayColor()
            
            cell.contentView.addSubview(leftLabel)
            cell.contentView.addSubview(reightlabel)
            cell.contentView.addSubview(reightImage)
            cell.contentView.addSubview(lineLabel)
            break
        case 6:
            cell.backgroundColor = UIColor.white
            let leftLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: 43))
            leftLabel.font = UIFont.systemFont(ofSize: 14)
            leftLabel.textColor = UIColor.black
            leftLabel.text = "重复"
            
            let reightlabel = UILabel(frame: CGRect(x: KScreenWidth - 110, y: 0, width: 80, height: 43))
            reightlabel.textAlignment = .right
            reightlabel.textColor = UIColor(string: "#8c8c8c")
            reightlabel.font = UIFont.systemFont(ofSize: 12)
            reightlabel.text = "全部订单"
            
            let reightImage = UIImageView(frame: CGRect(x: KScreenWidth - 20, y: 17, width: 4.5, height: 8.5))
            reightImage.image = UIImage(named: "home_alljt")
            
            let lineLabel = UILabel(frame: CGRect(x: 0, y: 43, width: KScreenWidth, height: 1))
            lineLabel.backgroundColor = Constant.bgGrayColor()
            
            cell.contentView.addSubview(leftLabel)
            cell.contentView.addSubview(reightlabel)
            cell.contentView.addSubview(reightImage)
            cell.contentView.addSubview(lineLabel)
            break
            
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
