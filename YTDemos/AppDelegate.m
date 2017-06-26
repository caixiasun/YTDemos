//
//  AppDelegate.m
//  YTDemos
//
//  Created by caixiasun on 2017/4/21.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "AppDelegate.h"
#import "MainController.h"
#import <QYSDK.h>
#import "MainController.h"
#import "MyController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    [[QYSDK sharedSDK] registerAppId:@"ccd9d036848a8d69a50c67f5a63f2d5c" appName:@"丫头Demos"];
    
    return YES;
}
- (UITabBarController *)tabBarController {
    if (!_tabBarController) {
        _tabBarController = [[UITabBarController alloc] init];
        
        NSMutableArray *viewControllers = [NSMutableArray new];
        
        {
            MainController *vc = [[MainController alloc] init];
            vc.title = @"首页";
            UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
            [viewControllers addObject:navi];
        }
        {
            MyController *vc = [[MyController alloc] init];
            vc.title = @"我的";
            UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
            [viewControllers addObject:navi];
        }
        _tabBarController.viewControllers = viewControllers;
        for (UITabBarItem *item in _tabBarController.tabBar.items) {
            item.imageInsets = UIEdgeInsetsMake(0, 0, -10, 0);
        }
    }
    return _tabBarController;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
