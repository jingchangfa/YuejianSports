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
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>{
    UICollectionViewFlowLayout *layout;
    UICollectionView *collect;
}

@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated{
    
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *titleImage = [[UIImageView alloc]init];
    titleImage.image = [UIImage imageNamed:@"title"];
    titleImage.contentMode=UIViewContentModeScaleAspectFill;
    titleImage.clipsToBounds = true;
    [self.view addSubview:titleImage];
    [titleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(HEIGHT*0.25);
    }];
    
    UIView *expertView = [[UIView alloc]init];
//    expertView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:expertView];
    
    UIImageView *findImage = [[UIImageView alloc]init];
    findImage.image = [UIImage imageNamed:@"find"];
    [expertView addSubview:findImage];
    
    UILabel *findLabel = [[UILabel alloc]init];
    findLabel.text = @"找专家";
    findLabel.font = [UIFont boldSystemFontOfSize:15.0*SCALE];
    findLabel.textColor = RGB(0, 193, 113);
    [expertView addSubview:findLabel];
    
    UILabel *findText = [[UILabel alloc]init];
    findText.text = @"悦健网————你的运动健康顾问";
    findText.font = [UIFont boldSystemFontOfSize:11.0*SCALE];
    findText.textColor = RGB(171, 172, 172);
    [expertView addSubview:findText];
    
    UILabel *line = [[UILabel alloc]init];
    line.backgroundColor = RGB(239, 240, 241);
    [expertView addSubview:line];
    
    UIImageView *zhuanjiaImage = [[UIImageView alloc]init];
    zhuanjiaImage.image = [UIImage imageNamed:@"zhuanjia"];
    [expertView addSubview:zhuanjiaImage];
    
    UILabel *zhuanjiaLabel = [[UILabel alloc]init];
    zhuanjiaLabel.text = @"专家";
    zhuanjiaLabel.font = [UIFont systemFontOfSize:13.0*SCALE];
    [expertView addSubview:zhuanjiaLabel];
    
    
    layout = [[HorizontalFlowLayout alloc]init];
    
    collect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
    collect.dataSource = self;
    collect.delegate = self;
    
    [collect registerClass:[homeCollectionViewCell class] forCellWithReuseIdentifier:@"home"];
    collect.backgroundColor = [UIColor whiteColor];
    collect.decelerationRate = UIScrollViewDecelerationRateNormal;
    [expertView addSubview:collect];
    
    
    
    [expertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleImage.mas_bottom);
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(collect.mas_bottom).offset(10);
    }];
    
    
    
    [findImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(expertView).offset(10);
        make.left.mas_equalTo(expertView).offset(10);
        make.width.height.mas_equalTo(50);
    }];
    
   
    
    [findLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(findImage);
        make.left.mas_equalTo(findImage.mas_right).offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
    }];
    
    
    
    [findText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(findLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(findLabel);
        make.right.mas_equalTo(expertView).offset(-50);
        make.height.mas_equalTo(20);
    }];
    
   
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(findImage.mas_bottom).offset(10);
        make.left.right.mas_equalTo(expertView);
        make.height.mas_equalTo(1);
    }];
    
    
    
    [zhuanjiaImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line.mas_bottom).offset(10);
        make.left.mas_equalTo(expertView).offset(10);
        make.width.height.mas_equalTo(20);
    }];
    
    
    
    [zhuanjiaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(zhuanjiaImage);
        make.left.mas_equalTo(zhuanjiaImage.mas_right).offset(5);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(20);
    }];
    
    
    
    [collect mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(zhuanjiaLabel.mas_bottom).offset(10);
        make.left.right.equalTo(expertView);
        make.height.mas_equalTo(200);
    }];
    

    UIView *fenlei = [[UIView alloc]init];
    fenlei.backgroundColor = RGB(238, 245, 245);
    [self.view addSubview:fenlei];
    
    [fenlei mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(expertView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(75);
    }];
    
    UIButton *chufang = [UIButton buttonWithType:UIButtonTypeCustom];
    [chufang setImage:[UIImage imageNamed:@"chufang"] forState:UIControlStateNormal];
    [fenlei addSubview:chufang];
    
    [chufang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(fenlei).offset(10);
        make.left.mas_equalTo(fenlei).offset((WIDTH/4-30)/2);
        make.width.height.mas_equalTo(30);
    }];
    
    UIButton *video = [UIButton buttonWithType:UIButtonTypeCustom];
    [video setImage:[UIImage imageNamed:@"video"] forState:UIControlStateNormal];
    [fenlei addSubview:video];
    
    [video mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(fenlei).offset(10);
        make.left.mas_equalTo(chufang.mas_right).offset(WIDTH/4-30);
        make.width.height.mas_equalTo(30);
    }];
    
    UIButton *couse = [UIButton buttonWithType:UIButtonTypeCustom];
    [couse setImage:[UIImage imageNamed:@"couse"] forState:UIControlStateNormal];
    [fenlei addSubview:couse];
    
    [couse mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(fenlei).offset(10);
        make.left.mas_equalTo(video.mas_right).offset(WIDTH/4-30);
        make.width.height.mas_equalTo(30);
    }];
    
    UIButton *zixun = [UIButton buttonWithType:UIButtonTypeCustom];
    [zixun setImage:[UIImage imageNamed:@"zixun"] forState:UIControlStateNormal];
    [fenlei addSubview:zixun];
    
    [zixun mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(fenlei).offset(10);
        make.left.mas_equalTo(couse.mas_right).offset(WIDTH/4-30);
        make.width.height.mas_equalTo(30);
    }];
    
    UILabel *chufangLabel = [[UILabel alloc]init];
    chufangLabel.text = @"科普处方";
    chufangLabel.font = [UIFont systemFontOfSize:11.0*SCALE];
    chufangLabel.textAlignment = NSTextAlignmentCenter;
    chufangLabel.textColor = RGB(171, 172, 172);
    [fenlei addSubview:chufangLabel];
    
    [chufangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(chufang.mas_bottom).offset(5);
        make.left.mas_equalTo(fenlei);
        make.width.mas_equalTo(WIDTH/4);
        make.height.mas_equalTo(20);
    }];
    
    UILabel *videoLabel = [[UILabel alloc]init];
    videoLabel.text = @"视频";
    videoLabel.font = [UIFont systemFontOfSize:11.0*SCALE];
    videoLabel.textAlignment = NSTextAlignmentCenter;
    videoLabel.textColor = RGB(171, 172, 172);
    [fenlei addSubview:videoLabel];
    
    [videoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(video.mas_bottom).offset(5);
        make.left.mas_equalTo(chufangLabel.mas_right);
        make.width.mas_equalTo(WIDTH/4);
        make.height.mas_equalTo(20);
    }];
    
    UILabel *couseLabel = [[UILabel alloc]init];
    couseLabel.text = @"课堂";
    couseLabel.font = [UIFont systemFontOfSize:11.0*SCALE];
    couseLabel.textAlignment = NSTextAlignmentCenter;
    couseLabel.textColor = RGB(171, 172, 172);
    [fenlei addSubview:couseLabel];
    
    [couseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(couse.mas_bottom).offset(5);
        make.left.mas_equalTo(videoLabel.mas_right);
        make.width.mas_equalTo(WIDTH/4);
        make.height.mas_equalTo(20);
    }];
    
    UILabel *zixunLabel = [[UILabel alloc]init];
    zixunLabel.text = @"资讯";
    zixunLabel.font = [UIFont systemFontOfSize:11.0*SCALE];
    zixunLabel.textAlignment = NSTextAlignmentCenter;
    zixunLabel.textColor = RGB(171, 172, 172);
    [fenlei addSubview:zixunLabel];
    
    [zixunLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(zixun.mas_bottom).offset(5);
        make.left.mas_equalTo(couseLabel.mas_right);
        make.width.mas_equalTo(WIDTH/4);
        make.height.mas_equalTo(20);
    }];
    
    UILabel *line2 = [[UILabel alloc]init];
    line2.backgroundColor = RGB(239, 240, 241);
    [self.view addSubview:line2];
    
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(fenlei.mas_bottom).offset(10);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(1);
    }];
    
}
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
//    cell.backgroundColor = [UIColor yellowColor];
    cell.layer.borderColor=RGB(239, 240, 241).CGColor;
    cell.layer.borderWidth=0.5;
    return cell;
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150, 180);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

#pragma mark --UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
