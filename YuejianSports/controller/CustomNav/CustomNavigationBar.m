//
//  CustomNavigationBar.m
//  YuejianSports
//
//  Created by jing on 17/5/17.
//  Copyright © 2017年 wang yan. All rights reserved.
//

#import "CustomNavigationBar.h"

@implementation CustomNavigationBar
- (instancetype)initWithScrollerView:(UIScrollView *)scrollerView{
    self = [super initWithFrame:CGRectMake(0, 0, WIDTH, 44+20)];
    if (self) {
        _scrollerView = scrollerView;
        [self addSubview:self.leftButton];
        [self addSubview:self.titleLabel];
        [self addSubview:self.rightButton];
        [self addObserver];
        [self alphaChange];
    }
    return self;
}
- (UIButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20+7, 30, 30)];
    }
    return _leftButton;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH*0.2, 20+0, WIDTH*0.6, 44)];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
- (UIButton *)rightButton{
    if (!_rightButton) {
        _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH-10-30, 20+7, 30, 30)];
    }
    return _rightButton;
}
- (void)addObserver{
    [_scrollerView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    [self alphaChange];
}
- (void)alphaChange{
    if(_scrollerView.contentOffset.y<0.1){
        self.alpha = 0;
        return;
    }
    CGPoint point = _scrollerView.contentOffset;
    float alpha = 0;
    alpha =  point.y/self.scrolOffsetY;
    alpha = (alpha <= 0)?0:alpha;
    alpha = (alpha >= 1)?1:alpha;
    self.alpha = alpha;
}
- (void)dealloc{
    [_scrollerView removeObserver:self forKeyPath:@"contentOffset" context:nil];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
