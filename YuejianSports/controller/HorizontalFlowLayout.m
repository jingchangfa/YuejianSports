//
//  HorizontalFlowLayout.m
//  测试collection
//
//  Created by wang yan on 16/8/25.
//  Copyright © 2016年 wang yan. All rights reserved.
//

#import "HorizontalFlowLayout.h"

@implementation HorizontalFlowLayout
- (instancetype) init {
    if (self = [super init]) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
    }
    return self;
}
@end
