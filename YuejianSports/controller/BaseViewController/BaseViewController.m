//
//  BaseViewController.m
//  YuejianSports
//
//  Created by jing on 17/5/17.
//  Copyright © 2017年 wang yan. All rights reserved.
//

#import "BaseViewController.h"
#import "ViewControllerNavBarHiddenConfiguation.h"// 导航条显示隐藏

@interface BaseViewController ()
@property (nonatomic,strong)ViewControllerNavBarHiddenConfiguation *barHiddenConfiguation;

@end

@implementation BaseViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self.barHiddenConfiguation;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (ViewControllerNavBarHiddenConfiguation *)barHiddenConfiguation{
    if (!_barHiddenConfiguation) {
        _barHiddenConfiguation = [[ViewControllerNavBarHiddenConfiguation alloc] init];
    }
    return _barHiddenConfiguation;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
