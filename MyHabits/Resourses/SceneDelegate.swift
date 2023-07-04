//
//  SceneDelegate.swift
//  MyHabits
//
//  Created by Денис Кузьминов on 26.06.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
    
        
        let window = UIWindow(windowScene: windowScene)
        let tabBarController = UITabBarController()
        
        tabBarController.tabBar.backgroundColor = .grayColor
        tabBarController.tabBar.tintColor = .pinkColor
        
        let habitsViwController = HabitsViewController()
        let infoViewController = InfoViewController()
        
        habitsViwController.tabBarItem = UITabBarItem(title: "Привычки", image: UIImage(named: "HabitsTabIcon"), tag: 0)
    
       
        infoViewController.tabBarItem = UITabBarItem(title: "Информация", image: UIImage(named: "InfoTabIcon"), tag: 0)
        
     
        let controllers = [habitsViwController, infoViewController]
        
        tabBarController.viewControllers = controllers.map{
            UINavigationController(rootViewController: $0)
        }
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        self.window = window
        
    }

    
    
    
    
    
    
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
       
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

