//
//  RCSideSlideViewController.h
//  WatchJD
//
//  Created by djwang on 15/1/29.
//  Copyright (c) 2015年 belter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewController.h"

@interface RCSideSlideViewController : UIViewController<CellItemSelectDelegate>


@property BOOL canShowLeft;
@property BOOL canShowRight;

//滑动速度系数-建议在0.5-1之间。默认为0.5
@property (assign,nonatomic) CGFloat speedf;

//是否允许点击视图恢复视图位置。默认为yes
@property (strong) UITapGestureRecognizer *sideslipTapGes;

//初始化
-(instancetype)initWithLeftView:(UIViewController *)leftController
              andMianController:(UIViewController *)mainController
             andRightController:(UIViewController *)rightController
             andBackgroundImage:(UIImage *)image canShowLeft:(BOOL)bleft canShowRight:(BOOL)bright;

-(void)setLeftView:(UIViewController *)leftView andMianController:(UIViewController *)mainView andRightController:(UIViewController *)rightView andBackgroundImage:(UIImage *)image canShowLeft:(BOOL)bleft canShowRight:(BOOL)bright;

//显示左视图
-(void)showLeftView;
//显示主视图
-(void)showMainView;
//显示右视图
-(void)showRightView;

@end
