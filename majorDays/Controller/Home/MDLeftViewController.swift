//
//  MDLeftViewController.swift
//  majorDays
//
//  Created by 张永盛 on 2018/1/21.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class MDLeftViewController: MDBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.leftBarButton.setImage(UIImage(named:"home_tj"), for: .normal)
        self.rightBarButton.setImage(UIImage(named:"home_tj"), for: .normal)
        self.titleButton.setTitle("majorDays", for: .normal)
        self.leftBarButton.addTarget(self, action: #selector(self.addEvent(btn:)), for: .touchUpInside)
        self.titleButton.addTarget(self, action: #selector(self.addEvent(btn:)), for: .touchUpInside)
        self.rightBarButton.addTarget(self, action: #selector(self.addEvent(btn:)), for: .touchUpInside)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self,
                                                          action: #selector(self.handlePanGesture(recognizer:)))
        self.view.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    /*
     * 添加事件/设置
     */
    @objc func addEvent(btn:UIButton) {
        switch btn.tag {
        case 1001: //设置
            let setView = MDSetViewController()
            self.present(setView, animated: true, completion: nil)
            break
        case 1002: //title
            
            break
        case 1003: //添加
            let addView = MDAddEventViewController()
            self.present(addView, animated: true, completion: nil)
            break
        default:
            break
        }
    }
    /*
     * 侧滑
     */
    @objc func handlePanGesture(recognizer:UIPanGestureRecognizer) {
        switch(recognizer.state) {
        // 刚刚开始滑动
        case .began:
            // 如果刚刚开始滑动的时候还处于主页面，从左向右滑动加入侧面菜单
            // 如果是正在滑动，则偏移主视图的坐标实现跟随手指位置移动
            break
        case .changed:
            // 如果滑动结束
            break
        case .ended:
            //根据页面滑动是否过半，判断后面是自动展开还是收缩
            // 判断拖动方向
            let dragFromRightToRight = (recognizer.velocity(in: view).x > 40)
            if (dragFromRightToRight) {
                self.navigationController?.popViewController(animated: true)
            }
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


