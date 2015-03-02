//
//  RCSideSlideViewController.m
//  WatchJD
//
//  Created by djwang on 15/1/29.
//  Copyright (c) 2015年 belter. All rights reserved.
//

#import "RCSideSlideViewController.h"
#import "HistoryViewController.h"

#define Screen_height   [[UIScreen mainScreen] bounds].size.height
#define Screen_width    [[UIScreen mainScreen] bounds].size.width

//main视图右偏移最大值
#define LeftMaxDistance Screen_width*(1+0)
//main视图左偏移最大值
#define RightMaxDistance Screen_width*(0-0)
//main视图缩放值
#define Scalef 0.75

@interface RCSideSlideViewController ()

@property(strong,nonatomic)UIViewController *leftController;
@property(strong,nonatomic)UIViewController *mainController;
@property(strong,nonatomic)UIViewController *rightController;

@property(strong,nonatomic)UIImageView *backgroundImageView;

@property float scalevalue;

@end

@implementation RCSideSlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
//    //显示界面时左右界面缩小归位 左右两侧
//    self.leftController.view.center = CGPointMake(RightMaxDistance,self.leftController.view.center.y);
//    self.leftController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, Scalef, Scalef);
//    self.rightController.view.center = CGPointMake(LeftMaxDistance,self.leftController.view.center.y);
//    self.rightController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, Scalef, Scalef);
    
    NSLog(@"X:%f",self.leftController.view.frame.origin.x);
    NSLog(@"Y:%f",self.leftController.view.frame.origin.y);
    NSLog(@"width:%f",self.leftController.view.frame.size.width);
    NSLog(@"height:%f",self.leftController.view.frame.size.height);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(instancetype)initWithLeftView:(UIViewController *)leftView andMianController:(UIViewController *)mainView andRightController:(UIViewController *)rightView andBackgroundImage:(UIImage *)image canShowLeft:(BOOL)bleft canShowRight:(BOOL)bright
{
    if(self)
    {
        self.canShowLeft = bleft;
        self.canShowRight = bright;
        
        self.leftController = leftView;
        
        self.mainController = mainView;
        self.rightController = rightView;
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [imageView setImage:image];
        [self.view addSubview:imageView];
        
        //滑动手势
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
        [self.mainController.view addGestureRecognizer:pan];
        
        //单击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [self.mainController.view addGestureRecognizer:tap];
        
        //button menu
        UIButton *leftMenuBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 40, 40)];
        [leftMenuBtn setTitle:@"L" forState:UIControlStateNormal];
        leftMenuBtn.backgroundColor = [UIColor redColor];
        [leftMenuBtn addTarget:self action:@selector(showLeftView) forControlEvents:UIControlEventTouchUpInside];
        [self.mainController.view addSubview:leftMenuBtn];
        
        //button menu
        UIButton *rightMenuBtn = [[UIButton alloc] initWithFrame:CGRectMake(260, 20, 40, 40)];
        [rightMenuBtn setTitle:@"R" forState:UIControlStateNormal];
        rightMenuBtn.backgroundColor = [UIColor redColor];
        [rightMenuBtn addTarget:self action:@selector(showRightView) forControlEvents:UIControlEventTouchUpInside];
        [self.mainController.view addSubview:rightMenuBtn];
        
        //设置左右视图不可见
        self.leftController.view.hidden = NO;
        self.rightController.view.hidden = YES;
        
        [self.view addSubview:self.leftController.view];
        [self.view addSubview:self.rightController.view];
        [self.view addSubview:self.mainController.view];
        
        
    }
    
    return self;
}


-(void)setLeftView:(UIViewController *)leftView andMianController:(UIViewController *)mainView andRightController:(UIViewController *)rightView andBackgroundImage:(UIImage *)image canShowLeft:(BOOL)bleft canShowRight:(BOOL)bright
{
    if(self)
    {
        self.canShowLeft = bleft;
        self.canShowRight = bright;
        
        
        self.leftController = leftView;
        self.mainController = mainView;
        self.rightController = rightView;
        
        
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [imageView setImage:image];
        [self.view addSubview:imageView];
        
        //滑动手势
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
        [self.mainController.view addGestureRecognizer:pan];
        
        //单击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [self.mainController.view addGestureRecognizer:tap];
        
        //button menu
        UIButton *leftMenuBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 40, 40)];
        [leftMenuBtn setTitle:@"L" forState:UIControlStateNormal];
        leftMenuBtn.backgroundColor = [UIColor redColor];
        [leftMenuBtn addTarget:self action:@selector(showLeftView) forControlEvents:UIControlEventTouchUpInside];
        [self.mainController.view addSubview:leftMenuBtn];
        
//        //button menu
//        UIButton *rightMenuBtn = [[UIButton alloc] initWithFrame:CGRectMake(260, 20, 40, 40)];
//        [rightMenuBtn setTitle:@"R" forState:UIControlStateNormal];
//        rightMenuBtn.backgroundColor = [UIColor redColor];
//        [rightMenuBtn addTarget:self action:@selector(showRightView) forControlEvents:UIControlEventTouchUpInside];
//        [self.mainController.view addSubview:rightMenuBtn];
        
        
        
        //设置左右视图不可见
        self.leftController.view.hidden = NO;
        self.rightController.view.hidden = YES;
        
        [self.view addSubview:self.leftController.view];
        [self.view addSubview:self.rightController.view];
        [self.view addSubview:self.mainController.view];
        
        NSLog(@"X:%f",self.leftController.view.frame.origin.x);
        NSLog(@"Y:%f",self.leftController.view.frame.origin.y);
        NSLog(@"width:%f",self.leftController.view.frame.size.width);
        NSLog(@"height:%f",self.leftController.view.frame.size.height);
        
//        self.leftController.view.center = CGPointMake(RightMaxDistance,self.leftController.view.center.y);
//        self.leftController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, Scalef, Scalef);
        NSLog(@"X:%f",self.leftController.view.frame.origin.x);
        NSLog(@"Y:%f",self.leftController.view.frame.origin.y);
        NSLog(@"width:%f",self.leftController.view.frame.size.width);
        NSLog(@"height:%f",self.leftController.view.frame.size.height);
        
    }
}


-(void)handlePan:(UIPanGestureRecognizer *)gesture
{
    
    
    CGPoint point = [gesture translationInView:self.view];
    NSLog(@"%f    %f",gesture.view.frame.size.width,gesture.view.frame.size.height);
    NSLog(@"%f    %f",gesture.view.frame.origin.x,gesture.view.frame.origin.y);
    NSLog(@"%f    %f",point.x,point.y);
    
    if(gesture.view.frame.origin.x == 0)
    {
        if(point.x>0&&self.canShowLeft)
        {
            if(gesture.view.center.x + point.x >= LeftMaxDistance)
            {
                gesture.view.center = CGPointMake(LeftMaxDistance,gesture.view.center.y);
                gesture.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, Scalef, Scalef);
            }
            else{
                [UIView beginAnimations:nil context:nil];
                gesture.view.center = CGPointMake(gesture.view.center.x + point.x,gesture.view.center.y);
                self.scalevalue = (gesture.view.center.x-self.view.frame.size.width/2 + point.x)/(LeftMaxDistance -self.view.frame.size.width/2);
                NSLog(@"%f",self.scalevalue);
                if(self.scalevalue >=1)
                {
                    self.scalevalue = 1;
                }
                gesture.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1-(1-Scalef)*self.scalevalue, 1-(1-Scalef)*self.scalevalue);
                
                self.leftController.view.center = CGPointMake(self.leftController.view.center.x+point.x,self.leftController.view.center.y);
                self.leftController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, Scalef + (1-Scalef)*self.scalevalue, Scalef + (1-Scalef)*self.scalevalue);
                self.leftController.view.alpha = self.scalevalue*0.5 + 0.5;
                [UIView commitAnimations];
                
                self.leftController.view.hidden = NO;
            }
            [gesture setTranslation:CGPointMake(0, 0) inView:self.view];
        }
    }
    else if(gesture.view.frame.origin.x>0)
    {
        if(gesture.view.center.x + point.x >= LeftMaxDistance)
        {
            gesture.view.center = CGPointMake(LeftMaxDistance,gesture.view.center.y);
            gesture.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, Scalef, Scalef);
        }
        else{
            [UIView beginAnimations:nil context:nil];
            gesture.view.center = CGPointMake(gesture.view.center.x + point.x,gesture.view.center.y);
            self.scalevalue = (gesture.view.center.x-self.view.frame.size.width/2 + point.x)/(LeftMaxDistance -self.view.frame.size.width/2);
            NSLog(@"%f",self.scalevalue);
            if(self.scalevalue >=1)
            {
                self.scalevalue = 1;
            }
            gesture.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1-(1-Scalef)*self.scalevalue, 1-(1-Scalef)*self.scalevalue);
            
            self.leftController.view.center = CGPointMake(self.leftController.view.center.x+point.x,self.leftController.view.center.y);
            self.leftController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, Scalef + (1-Scalef)*self.scalevalue, Scalef + (1-Scalef)*self.scalevalue);
            self.leftController.view.alpha = self.scalevalue*0.5 + 0.5;
            [UIView commitAnimations];
            
            self.leftController.view.hidden = NO;
        }
        [gesture setTranslation:CGPointMake(0, 0) inView:self.view];
    }
    else
    {
        if(self.canShowRight){
            if(gesture.view.center.x + point.x <= RightMaxDistance)
            {
                gesture.view.center = CGPointMake(RightMaxDistance,gesture.view.center.y);
                gesture.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, Scalef, Scalef);
            }
            else
            {
                [UIView beginAnimations:nil context:nil];
                gesture.view.center = CGPointMake(gesture.view.center.x + point.x,gesture.view.center.y);
                
                self.scalevalue = (gesture.view.center.x-self.view.frame.size.width/2 + point.x)/(RightMaxDistance -self.view.frame.size.width/2);
                if(self.scalevalue >=1)
                {
                    self.scalevalue = 1;
                }
                
                gesture.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1-(1-Scalef)*self.scalevalue, 1-(1-Scalef)*self.scalevalue);
                
                self.rightController.view.center = CGPointMake(self.rightController.view.center.x+point.x,self.rightController.view.center.y);
                self.rightController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, Scalef + (1-Scalef)*self.scalevalue, Scalef + (1-Scalef)*self.scalevalue);
                self.rightController.view.alpha = self.scalevalue*0.5 + 0.5;
                
                [UIView commitAnimations];
                self.rightController.view.hidden = NO;
                
                [gesture setTranslation:CGPointMake(0, 0) inView:self.view];
            }
        }
    }
    
    //手势结束后修正位置
    if(gesture.state == UIGestureRecognizerStateEnded)
    {
        if (self.scalevalue>0.5 && self.mainController.view.center.x>160){
            [self showLeftView];
            self.rightController.view.hidden = YES;
            self.leftController.view.hidden = NO;
        }
        else if (self.scalevalue>0.5 && self.mainController.view.center.x<160) {
            
            if(self.canShowRight){
            [self showRightView];
            self.rightController.view.hidden = NO;
            self.leftController.view.hidden = YES;
            }
            else
            {
                [self showMainView];
            }
        }
        else
        {
            [self showMainView];
        }
    }
}

-(void)handleTap:(UITapGestureRecognizer *)gesture
{
    [self showMainView];
}

-(void)showLeftView
{
    self.leftController.view.hidden = NO;
    self.rightController.view.hidden = YES;
    
    [UIView beginAnimations:nil context:nil];
    self.mainController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,Scalef,Scalef);
    self.mainController.view.center = CGPointMake(LeftMaxDistance,[UIScreen mainScreen].bounds.size.height/2);
    
    self.leftController.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,self.leftController.view.center.y);
    self.leftController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
    self.leftController.view.alpha = 1.0;
    [UIView commitAnimations];
}

-(void)showMainView
{
    [UIView beginAnimations:nil context:nil];
    self.mainController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    self.mainController.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
    
    self.leftController.view.center = CGPointMake(RightMaxDistance,self.leftController.view.center.y);
    self.leftController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, Scalef, Scalef);
    
    self.rightController.view.center = CGPointMake(LeftMaxDistance,self.rightController.view.center.y);
    self.rightController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, Scalef, Scalef);
    
    [UIView commitAnimations];
}

-(void)showRightView
{
    self.leftController.view.hidden = YES;
    self.rightController.view.hidden = NO;
    CGRect frame = self.rightController.view.frame;
    [UIView beginAnimations:nil context:nil];
    self.mainController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,Scalef,Scalef);
    self.mainController.view.center = CGPointMake(RightMaxDistance,[UIScreen mainScreen].bounds.size.height/2);
    
    self.rightController.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
    self.rightController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
    self.rightController.view.alpha = 1.0;
    [UIView commitAnimations];
    
    frame = self.rightController.view.frame;
}


#pragma left  CellSelectDelegate
-(void)cellItemSelect:(int)viewindex
{
    NSLog(@"select:%d",viewindex);
    UIViewController *newmainviewcontroller;
    switch (viewindex) {
        case 0:
            newmainviewcontroller = [[HistoryViewController alloc] initWithNibName:@"HistoryViewController" bundle:nil];
            break;
        case 1:
            NSLog(@"X:%f",self.leftController.view.frame.origin.x);
            NSLog(@"Y:%f",self.leftController.view.frame.origin.y);
            NSLog(@"width:%f",self.leftController.view.frame.size.width);
            NSLog(@"height:%f",self.leftController.view.frame.size.height);
            break;
            
        default:
            break;
    }
    
    [self.navigationController pushViewController:newmainviewcontroller animated:YES];
}


#warning 为了界面美观，所以隐藏了状态栏。如果需要显示则去掉此代码
- (BOOL)prefersStatusBarHidden
{
    return YES; //返回NO表示要显示，返回YES将hiden
}
@end
