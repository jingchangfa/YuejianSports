//
//  homeCollectionViewCell.m
//  YuejianSports
//
//  Created by wang yan on 17/5/16.
//  Copyright © 2017年 wang yan. All rights reserved.
//

#import "homeCollectionViewCell.h"

@implementation homeCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _image = [[UIImageView alloc]init];
        _image.contentMode=UIViewContentModeScaleAspectFill;
        _image.clipsToBounds = true;
        [self addSubview:_image];
        
        _label = [[UILabel alloc]init];
        _label.textColor = RGB(0, 193, 113);
        _label.font = [UIFont systemFontOfSize:11.0*SCALE];
//        _label.layer.borderColor = [RGB(239, 240, 241)CGColor];
//        _label.layer.borderWidth = 0.5f;
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        
        [_image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.mas_equalTo(self);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(150);
        }];
        
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_image.mas_bottom);
            make.left.equalTo(_image);
            make.width.equalTo(_image);
            make.height.mas_equalTo(30);
        }];
    }
    return self;
}
@end
