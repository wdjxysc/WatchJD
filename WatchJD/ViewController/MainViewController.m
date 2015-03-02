//
//  MainViewController.m
//  WatchJD
//
//  Created by djwang on 15/2/3.
//  Copyright (c) 2015年 belter. All rights reserved.
//

#import "MainViewController.h"
#import "User.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initMyView];
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

-(void)initMyView
{
    User *user = [[User alloc] init];
    user.name = @"afsfa";
    user.gender = Male;
    user.profession = Mental;
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
//    UIButton *btn = [[UIButton alloc]init];
//    [btn setTitle:@"用户目录" forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:btn];
//    
//    btn.translatesAutoresizingMaskIntoConstraints = NO;
//    //居中
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn
//                                                          attribute:NSLayoutAttributeCenterX
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeCenterX
//                                                         multiplier:1
//                                                           constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-20]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.7 constant:0]];
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:150]];
    
    
}
- (IBAction)btnClick:(id)sender {
    NSLog(@"%f",self.view.frame.size.width);
    NSLog(@"%f",self.view.frame.size.height);
}




@end
