//
//  CustomNavigationBar.h
//  YuejianSports
//
//  Created by jing on 17/5/17.
//  Copyright © 2017年 wang yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNavigationBar : UIImageView{
    UIButton *_leftButton;
    UIButton *_rightButton;
    UILabel *_titleLabel;
    UIScrollView *_scrollerView;
}
/**
 * leftButton 左侧按钮
 * rightButton 右侧按钮
 * titleLabel 标题栏
 */
@property (nonatomic,readonly) UIButton *leftButton;
@property (nonatomic,readonly) UIButton *rightButton;
@property (nonatomic,readonly) UILabel *titleLabel;

@property (nonatomic,assign) float scrolOffsetY;
- (instancetype)initWithScrollerView:(UIScrollView *)scrollerView;
@end
