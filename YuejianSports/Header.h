//
//  Header.h
//  YuejianSports
//
//  Created by wang yan on 17/5/16.
//  Copyright © 2017年 wang yan. All rights reserved.
//

#ifndef Header_h
#define Header_h
//屏幕宽高
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCALE (WIDTH/320.0)
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif /* Header_h */
