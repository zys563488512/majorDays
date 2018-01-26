//
//  MDThemeListController.swift
//  majorDays
//
//  Created by 张永盛 on 2018/1/24.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class MDThemeListController: MDBaseViewController,UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    var dataArray = NSArray()
    var themeDataArray = NSArray()
    var tableView : UITableView!
    var collectionView : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.leftBarButton.setImage(UIImage(named:"tabbar_fh"), for: .normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.leftBarButton!)
        self.titleButton.setTitle("主题", for: .normal)
        self.leftBarButton.addTarget(self, action: #selector(self.backEvent(btn:)), for: .touchUpInside)
        self.dataArray = [
            ["themeTypeId":"1001","themeTypeName":"风景",
                "themeList":[["themeId":"10011","themeName":"scenery_bgName2","themeImageUrl":"scenery_bg2"],["themeId":"10012","themeName":"scenery_bgName1","themeImageUrl":"scenery_bg1"]]],
            ["themeTypeId":"1002","themeTypeName":"萌宠","themeList":[]],
            ["themeTypeId":"1003","themeTypeName":"节日","themeList":[["themeId":"10021","themeName":"festival_bgName1","themeImageUrl":"festival_bg1"]]],
            ["themeTypeId":"1004","themeTypeName":"壁纸","themeList":[["themeId":"10021","themeName":"wallpaper_bgName1","themeImageUrl":"wallpaper_bg1"]]],
            ["themeTypeId":"1005","themeTypeName":"卡通","themeList":[["themeId":"10021","themeName":"cartoon_bgName1","themeImageUrl":"cartoon_bg1"]]]]
        let dict = self.dataArray[0] as! NSDictionary
        self.themeDataArray = dict["themeList"] as! NSArray
        self.tableView = UITableView(frame: CGRect(x: 0, y: 64, width: 80, height: KScreenHeight - 64), style: .plain)
        self.tableView.backgroundColor = UIColor.white
        self.tableView.tableFooterView = UIView()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView)
        let layOut = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: CGRect(x: 80, y: 64, width: KScreenWidth - 50, height: KScreenHeight - 64), collectionViewLayout: layOut)
        self.collectionView.register(ThemeListCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        self.collectionView.backgroundColor = Constant.bgGrayColor()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.view.addSubview(self.collectionView)
    }
    /*
     * UITableViewDelegate,UICollectionViewDataSource
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        let dict = self.dataArray[indexPath.row] as! NSDictionary
        cell.isSelected = true
        cell.selectionStyle = .default
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.textLabel?.text = dict["themeTypeName"] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = self.dataArray[indexPath.row] as! NSDictionary
        self.themeDataArray = NSArray()
        self.themeDataArray = dict["themeList"] as! NSArray
        self.collectionView.reloadData()
    }
    /*
     * UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewFlowLayout
     */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themeDataArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ThemeListCell
        cell.setSetup()
        let dict = self.themeDataArray[indexPath.row] as! NSDictionary
        cell.imageView.image = UIImage(named: dict["themeName"] as! String)
        return cell
    }
    //cell 的size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 60, height: 60)
        
    }
    //内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(10, 10, 0, 0)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    @objc func backEvent(btn:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
