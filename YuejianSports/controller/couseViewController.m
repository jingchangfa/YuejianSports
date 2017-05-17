//
//  couseViewController.m
//  YuejianSports
//
//  Created by wang yan on 17/5/17.
//  Copyright © 2017年 wang yan. All rights reserved.
//

#import "couseViewController.h"

@interface couseViewController ()<UIScrollViewDelegate>{
    UISegmentedControl *segment;
    UIScrollView *scrollView;
}

@end

@implementation couseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title=@"课程列表";
    self.navigationController.navigationBar.barTintColor=RGB(0, 225, 176);
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.view.backgroundColor=RGB(239, 240, 241);
    
    segment = [[UISegmentedControl alloc] initWithItems:@[@"俱乐部课程", @"私人课程"]];
    segment.frame = CGRectMake(0, 0, WIDTH, 30*SCALE);
    //segment.tintColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    segment.tintColor = [UIColor whiteColor];
    
    
        [segment setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor]} forState:UIControlStateNormal];
        // 设置选中的文字颜色
        [segment setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:0 green:203/255.0 blue:165/255.0 alpha:1.0]} forState:UIControlStateSelected];
    //    segment.segmentedControlStyle = UISegmentedControlStyleBar;
    [segment addTarget:self action:@selector(segmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    segment.selectedSegmentIndex = 0;
    [self.view addSubview:segment];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, segment.frame.origin.y+segment.frame.size.height,WIDTH, HEIGHT -64- (segment.frame.origin.y+segment.frame.size.height))];
    // 设置scrollView的内容
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(WIDTH * 2,0);
    scrollView.tag = 99;
    scrollView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:scrollView];
    
    
}
- (void)segmentedControlAction:(UISegmentedControl *)sender
{
    [scrollView setContentOffset:CGPointMake(sender.selectedSegmentIndex * scrollView.frame.size.width, 0) animated:NO];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag ==99) {
        NSInteger n = scrollView.contentOffset.x/scrollView.frame.size.width;
        segment.selectedSegmentIndex = n;
    }
    
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
