//
//  AppDelegate.h
//  YuejianSports
//
//  Created by wang yan on 17/5/16.
//  Copyright © 2017年 wang yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tab;
//首页界面
@property (strong, nonatomic)UINavigationController *firstNav;
//专家界面
@property (strong, nonatomic)UINavigationController *expertNav;
//我的界面
@property (strong, nonatomic)UINavigationController *mineNav;

@end

