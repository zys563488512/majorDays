//
//  AppDelegate.swift
//  majorDays
//
//  Created by 张永盛 on 2018/1/20.
//  Copyright © 2018年 张永盛. All rights reserved.
//

import UIKit
import CoreData
import LeanCloud
import SnapKit
import GDPerformanceView_Swift
import KeychainSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GDPerformanceMonitor.sharedInstance.startMonitoring()
//        self.performanceView = GDPerformanceMonitor.init()
//        self.performanceView?.startMonitoring()
        
        // applicationId 即 App Id，applicationKey 是 App Key2
        LeanCloud.initialize(applicationID: LearnCloud_APPID, applicationKey: LearnCloud_APPKEY)
        self.createOnlyUserId()
        
        if UserDefaults.standard.bool(forKey: "everLaunched") == false{
            UserDefaults.standard.set(true, forKey: "everLaunched")
            Constant.setThemeBGImage(imageName: mainTheme)
        }else {
            if Constant.getThemeBGImage() == "" {
                Constant.setThemeBGImage(imageName: mainTheme)
            }
        }
        let home = MDHomeViewController()
        let nav = MDBaseNavigationController(rootViewController: home)
        nav.navigationBar.isTranslucent = true
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        return true
    }
    func createOnlyUserId() {
        // 执行 CQL 语句实现新增一个 TodoFolder 对象
        let res = self.loadKeychain(service: service)
        print("res ==== \(String(describing: res))")
    }
    func saveUserInfoToKeyChain(dict:NSDictionary) {
        let keychainQuery = self.getKeychainQuery(service: service)
        SecItemDelete(keychainQuery)
        keychainQuery.addEntries(from: dict as! [AnyHashable : Any])
        SecItemAdd(keychainQuery, nil)
    }
    func getKeychainQuery(service: String) -> NSMutableDictionary {
        return NSMutableDictionary(dictionary:
            [kSecClass: kSecClassGenericPassword,
             kSecAttrService: service,
             kSecAttrAccount: service,
             kSecAttrAccessible: kSecAttrAccessibleAfterFirstUnlock])
    }
    func loadKeychain(service: String) -> AnyObject! {
        let keychainQuery = self.getKeychainQuery(service: service)
        keychainQuery.addEntries(from: [kSecReturnData: kCFBooleanTrue])
        keychainQuery.addEntries(from: [kSecMatchLimit: kSecMatchLimitOne])
        var keyData : AnyObject? = nil
        if SecItemCopyMatching(keychainQuery, &keyData) == noErr {
            let ret = NSKeyedUnarchiver.unarchiveObject(with: (keyData as! NSData) as Data)
            return ret as AnyObject
        } else {
            return nil
        }
    }
    func saveKeychain(service: String, data: AnyObject) {
        let keychainQuery = self.getKeychainQuery(service: service)
        SecItemDelete(keychainQuery)
        keychainQuery.addEntries(from: [kSecValueData: NSKeyedArchiver.archivedData(withRootObject: data)])
        SecItemAdd(keychainQuery, nil)
    }
    func getIsUserId(userId:String){
        let query = LCQuery(className: "_User")
        query.whereKey("token", .equalTo(userId))
        query.find { (result) in
            print(result)
            if result.isSuccess {
                
            }else {
                //打印信息
                let time = String(Constant.getTimeInterval())
                print("设备udid：\(String(describing: identifierNumber))")
                print("设备型号：\(model)")
                print("设备区域化型号：\(localizedModel)")
                
                let token = String(describing: identifierNumber) + model + localizedModel + time
                //            let token = EncrtDecrt.md5(pwd)
                let User = LCObject(className: "_User")
                
                User.set("userId", value: time)
                User.set("username", value: systemName)
                User.set("token", value: String(describing: identifierNumber))
                User.set("password", value: token)
                User.save { result in
                    switch result {
                    case .success:
                        let dict = ["userId":time as Any,"username":systemName,"token":String(describing: identifierNumber)] as NSDictionary
                        self.saveUserInfoToKeyChain(dict: dict)
                        break
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    @available(iOS 10.0, *)
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "majorDays")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if #available(iOS 10.0, *) {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        } else {
            // Fallback on earlier versions
        }
        
    }

}

