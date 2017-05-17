//
//  ViewController.m
//  YuejianSports
//
//  Created by wang yan on 17/5/16.
//  Copyright © 2017年 wang yan. All rights reserved.
//

#import "ViewController.h"
#import "homeCollectionViewCell.h"
#import "HorizontalFlowLayout.h"
#import "couseViewController.h"

#import "CustomNavigationBar.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>{
    UICollectionViewFlowLayout *layout;
    UICollectionView *collect;
    UIScrollView *scroll;
}
@property(nonatomic,strong)CustomNavigationBar *customBar;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.设置当有导航栏自动添加64的高度的属性为NO
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 2.设置view
    [self setUpView];
    // 3.添加自定义导航条
    [self setUpNavBar];
}
- (CustomNavigationBar *)customBar{
    if (!_customBar) {
        _customBar = [[CustomNavigationBar alloc] initWithScrollerView:scroll];
        _customBar.scrolOffsetY = 400;
    }
    return _customBar;
}
#pragma mark - UI设置
- (void)setUpNavBar{
    [self.view addSubview:self.customBar];
    self.customBar.backgroundColor = RGB(0, 225, 176);
    self.customBar.titleLabel.text = @"首页";
//    self.navigationItem.title=@"首页";
//    UILabel * titleLabel =[[UILabel alloc]init];
//    titleLabel.text = @"首页";
//    [titleLabel sizeToFit];
//    titleLabel.textColor = [UIColor whiteColor];
//    self.navigationItem.titleView = titleLabel;
//    self.navigationController.navigationBar.barTintColor=RGB(0, 225, 176);
//    [self.navigationController.navigationBar setTitleTextAttributes:
//     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.view.backgroundColor=[UIColor whiteColor];
}
- (void)setUpView{
    scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    scroll.contentSize = CGSizeMake(WIDTH, HEIGHT*2);
    scroll.backgroundColor = [UIColor whiteColor];
    scroll.delegate = self;
    scroll.bounces=NO;
    [self.view addSubview:scroll];
    
    UIImageView *titleImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT*0.25)];
    titleImage.image = [UIImage imageNamed:@"title"];
    titleImage.contentMode=UIViewContentModeScaleAspectFill;
    titleImage.clipsToBounds = true;
    [scroll addSubview:titleImage];
    
    UIView *expertView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.25, WIDTH, HEIGHT*0.5)];
    [scroll addSubview:expertView];
    
    UIImageView *findImage = [[UIImageView alloc]initWithFrame:CGRectMake(10*SCALE, 10*SCALE, 50*SCALE, 50*SCALE)];
    findImage.image = [UIImage imageNamed:@"find"];
    [expertView addSubview:findImage];
    
    UILabel *findLabel = [[UILabel alloc]initWithFrame:CGRectMake(findImage.frame.origin.x+findImage.frame.size.width+10*SCALE, 10*SCALE, 100*SCALE, 20*SCALE)];
    findLabel.text = @"找专家";
    findLabel.font = [UIFont boldSystemFontOfSize:15.0*SCALE];
    findLabel.textColor = RGB(0, 193, 113);
    [expertView addSubview:findLabel];
    
    UILabel *findText = [[UILabel alloc]initWithFrame:CGRectMake(findLabel.frame.origin.x, findLabel.frame.origin.y+findLabel.frame.size.height+10*SCALE, WIDTH-findLabel.frame.origin.x, 20*SCALE)];
    findText.text = @"悦健网————你的运动健康顾问";
    findText.font = [UIFont boldSystemFontOfSize:12.0*SCALE];
    findText.textColor = RGB(171, 172, 172);
    [expertView addSubview:findText];
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, findImage.frame.origin.y+findImage.frame.size.height+10*SCALE, WIDTH, 1)];
    line.backgroundColor = RGB(239, 240, 241);
    [expertView addSubview:line];
    
    UIButton *findNext = [UIButton buttonWithType:UIButtonTypeCustom];
    findNext.frame = CGRectMake(WIDTH-20*SCALE, line.frame.origin.y/2-20*SCALE, 20*SCALE, 20*SCALE);
    [findNext setImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
    [expertView addSubview:findNext];
    
    UIImageView *zhuanjiaImage = [[UIImageView alloc]initWithFrame:CGRectMake(10*SCALE, line.frame.origin.y+10*SCALE, 20*SCALE, 20*SCALE)];
    zhuanjiaImage.image = [UIImage imageNamed:@"zhuanjia"];
    [expertView addSubview:zhuanjiaImage];
    
    UILabel *zhuanjiaLabel = [[UILabel alloc]initWithFrame:CGRectMake(zhuanjiaImage.frame.origin.x+zhuanjiaImage.frame.size.width+5*SCALE, zhuanjiaImage.frame.origin.y, 50*SCALE, 20*SCALE)];
    zhuanjiaLabel.text = @"专家";
    zhuanjiaLabel.font = [UIFont systemFontOfSize:13.0*SCALE];
    [expertView addSubview:zhuanjiaLabel];
    
    
    layout = [[HorizontalFlowLayout alloc]init];
    
    collect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, zhuanjiaLabel.frame.origin.y+zhuanjiaLabel.frame.size.height+10*SCALE, WIDTH, 170*SCALE) collectionViewLayout:layout];
    collect.dataSource = self;
    collect.delegate = self;
    
    [collect registerClass:[homeCollectionViewCell class] forCellWithReuseIdentifier:@"home"];
    collect.backgroundColor = [UIColor whiteColor];
    collect.decelerationRate = UIScrollViewDecelerationRateNormal;
    [expertView addSubview:collect];
    
    expertView.frame = CGRectMake(0, HEIGHT*0.25, WIDTH, CGRectGetMaxY(collect.frame)+10*SCALE);
    
    
    UIView *fenlei = [[UIView alloc]initWithFrame:CGRectMake(0, expertView.frame.origin.y+expertView.frame.size.height, WIDTH, 75*SCALE)];
    fenlei.backgroundColor = RGB(238, 245, 245);
    [scroll addSubview:fenlei];
    
    
    UIButton *chufang = [UIButton buttonWithType:UIButtonTypeCustom];
    chufang.frame = CGRectMake((WIDTH/4-30*SCALE)/2, 10*SCALE, 30*SCALE, 30*SCALE);
    [chufang setImage:[UIImage imageNamed:@"chufang"] forState:UIControlStateNormal];
    [fenlei addSubview:chufang];
    
    
    
    UIButton *video = [UIButton buttonWithType:UIButtonTypeCustom];
    video.frame = CGRectMake(chufang.frame.origin.x+chufang.frame.size.width+WIDTH/4-30*SCALE, 10*SCALE, 30*SCALE, 30*SCALE);
    [video setImage:[UIImage imageNamed:@"video"] forState:UIControlStateNormal];
    [fenlei addSubview:video];
    
    
    
    UIButton *couse = [UIButton buttonWithType:UIButtonTypeCustom];
    couse.frame = CGRectMake(video.frame.origin.x+video.frame.size.width+WIDTH/4-30*SCALE, 10*SCALE, 30*SCALE, 30*SCALE);
    [couse setImage:[UIImage imageNamed:@"couse"] forState:UIControlStateNormal];
    [couse addTarget:self action:@selector(couseClicked) forControlEvents:UIControlEventTouchUpInside];
    [fenlei addSubview:couse];
    
    
    
    UIButton *zixun = [UIButton buttonWithType:UIButtonTypeCustom];
    zixun.frame = CGRectMake(couse.frame.origin.x+couse.frame.size.width+WIDTH/4-30*SCALE, 10*SCALE, 30*SCALE, 30*SCALE);
    [zixun setImage:[UIImage imageNamed:@"zixun"] forState:UIControlStateNormal];
    [fenlei addSubview:zixun];
    
    
    
    UILabel *chufangLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, chufang.frame.origin.y+chufang.frame.size.height+5*SCALE, WIDTH/4, 20*SCALE)];
    chufangLabel.text = @"科普处方";
    chufangLabel.font = [UIFont systemFontOfSize:11.0*SCALE];
    chufangLabel.textAlignment = NSTextAlignmentCenter;
    chufangLabel.textColor = RGB(171, 172, 172);
    [fenlei addSubview:chufangLabel];
    
    
    
    UILabel *videoLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/4, chufangLabel.frame.origin.y, WIDTH/4, 20*SCALE)];
    videoLabel.text = @"视频";
    videoLabel.font = [UIFont systemFontOfSize:11.0*SCALE];
    videoLabel.textAlignment = NSTextAlignmentCenter;
    videoLabel.textColor = RGB(171, 172, 172);
    [fenlei addSubview:videoLabel];
    
    
    
    UILabel *couseLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2, chufangLabel.frame.origin.y, WIDTH/4, 20*SCALE)];
    couseLabel.text = @"课堂";
    couseLabel.font = [UIFont systemFontOfSize:11.0*SCALE];
    couseLabel.textAlignment = NSTextAlignmentCenter;
    couseLabel.textColor = RGB(171, 172, 172);
    [fenlei addSubview:couseLabel];
    
    
    UILabel *zixunLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/4*3, chufangLabel.frame.origin.y, WIDTH/4, 20*SCALE)];
    zixunLabel.text = @"资讯";
    zixunLabel.font = [UIFont systemFontOfSize:11.0*SCALE];
    zixunLabel.textAlignment = NSTextAlignmentCenter;
    zixunLabel.textColor = RGB(171, 172, 172);
    [fenlei addSubview:zixunLabel];
    
    //    [zixunLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.mas_equalTo(zixun.mas_bottom).offset(5);
    //        make.left.mas_equalTo(couseLabel.mas_right);
    //        make.width.mas_equalTo(WIDTH/4);
    //        make.height.mas_equalTo(20);
    //    }];
    
    UILabel *line2 = [[UILabel alloc]initWithFrame:CGRectMake(0, fenlei.frame.origin.y+fenlei.frame.size.height+10*SCALE, WIDTH, 1)];
    line2.backgroundColor = RGB(239, 240, 241);
    [scroll addSubview:line2];
    
    
    
    UIView *tiwenView = [[UIView alloc]initWithFrame:CGRectMake(0, line2.frame.origin.y, WIDTH, HEIGHT*0.5)];
    [scroll addSubview:tiwenView];
    
    UIImageView *tiwenImage = [[UIImageView alloc]initWithFrame:CGRectMake(10*SCALE, 10*SCALE, 50*SCALE, 50*SCALE)];
    tiwenImage.image = [UIImage imageNamed:@"tiwen"];
    [tiwenView addSubview:tiwenImage];
    
    UILabel *tiwenLabel = [[UILabel alloc]initWithFrame:CGRectMake(tiwenImage.frame.origin.x+tiwenImage.frame.size.width+10*SCALE, 10*SCALE, 100*SCALE, 20*SCALE)];
    tiwenLabel.text = @"快速提问";
    tiwenLabel.font = [UIFont boldSystemFontOfSize:15.0*SCALE];
    tiwenLabel.textColor = [UIColor blackColor];
    [tiwenView addSubview:tiwenLabel];
    
    UIButton *tiwenNext = [UIButton buttonWithType:UIButtonTypeCustom];
    tiwenNext.frame = CGRectMake(WIDTH-20*SCALE, 30*SCALE, 20*SCALE, 20*SCALE);
    [tiwenNext setImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
    [tiwenView addSubview:tiwenNext];
}

#pragma mark - Delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    homeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"home" forIndexPath:indexPath];
    
    cell.image.image = [UIImage imageNamed:@"people.jpg"];
    cell.label.text = @"MIKie 有氧训练";
    cell.layer.borderColor=RGB(239, 240, 241).CGColor;
    cell.layer.borderWidth=0.5;
    return cell;
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(120*SCALE, 150*SCALE);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10*SCALE, 0, 10*SCALE);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10*SCALE;
}

#pragma mark --UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark 课堂点击
-(void)couseClicked{
    couseViewController *couse = [[couseViewController alloc]init];
    couse.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:couse animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
