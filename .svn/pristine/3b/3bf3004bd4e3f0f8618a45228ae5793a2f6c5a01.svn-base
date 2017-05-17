//
//  AppDelegate.m
//  YuejianSports
//
//  Created by wang yan on 17/5/16.
//  Copyright © 2017年 wang yan. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "expertViewController.h"
#import "mineViewController.h"
@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self homePage];
    return YES;
}

-(void)homePage{
    NSMutableArray *array = [NSMutableArray array];
    ViewController *main = [[ViewController alloc]init];
    self.firstNav = [[UINavigationController alloc]initWithRootViewController:main];
    main.tabBarItem = [self createUiImageVeiwImageNormalName:@"Home" ImageSelectName:@"Home_select"ImageTitle:@"首页"];
    
    UIImage *select = [UIImage imageNamed:@"Home_select"];
    
    main.tabBarItem.selectedImage = [select imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [main.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:195/255.0 blue:162/255.0 alpha:1.0]} forState:UIControlStateSelected];
    [array addObject:self.firstNav];
    
    expertViewController *expert = [[expertViewController alloc]init];
    self.expertNav = [[UINavigationController alloc]initWithRootViewController:expert];
    expert.tabBarItem = [self createUiImageVeiwImageNormalName:@"expert" ImageSelectName:@"expert_select"ImageTitle:@"专家"];
    
    UIImage *select2 = [UIImage imageNamed:@"expert_select"];
    
    expert.tabBarItem.selectedImage = [select2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [expert.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:195/255.0 blue:162/255.0 alpha:1.0]} forState:UIControlStateSelected];
    [array addObject:self.expertNav];
    
    mineViewController *mine = [[mineViewController alloc]init];
    self.mineNav = [[UINavigationController alloc]initWithRootViewController:mine];
    //    mine.navigationController.navigationBarHidden = YES;
    mine.tabBarItem = [self createUiImageVeiwImageNormalName:@"me" ImageSelectName:@"me_select"ImageTitle:@"我的"];
    
    UIImage *select3 = [UIImage imageNamed:@"me_select"];
    
    mine.tabBarItem.selectedImage = [select3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [mine.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:195/255.0 blue:162/255.0 alpha:1.0]} forState:UIControlStateSelected];
    [array addObject:self.mineNav];
    
    self.tab = [[UITabBarController alloc]init];
    self.tab.tabBar.translucent = NO;
    self.tab.tabBar.barTintColor = RGB(238, 245, 245);
    self.tab.delegate = self;
    [self.tab setViewControllers:array];
    self.tab.selectedIndex = 0;
    [self.window setRootViewController:self.tab];
    
}
//编辑图片
- (UITabBarItem *)createUiImageVeiwImageNormalName:(NSString *)imageNormalName ImageSelectName:(NSString *)imageSelectName ImageTitle:(NSString *)imageTitle{
    UIImage *h_ImageNormal  = [UIImage imageNamed:imageNormalName];
    UIImage *h_ImageSelecet =  [UIImage imageNamed:imageSelectName];
    UITabBarItem *hotelItem  =  [[UITabBarItem alloc]initWithTitle:imageTitle image:h_ImageNormal selectedImage:h_ImageSelecet];
    return hotelItem;
    
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
