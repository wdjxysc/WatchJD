//
//  LeftViewController.h
//  WatchJD
//
//  Created by djwang on 15/2/3.
//  Copyright (c) 2015年 belter. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CellItemSelectDelegate <NSObject>

-(void)cellItemSelect:(int)viewindex;

@end

@interface LeftViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *btnLogout;
@property (weak, nonatomic) IBOutlet UIButton *btnSetting;

@property(strong,nonatomic) NSArray *titleArray;
@property(strong,nonatomic) NSArray *imageArray;


@property(strong,nonatomic) NSObject<CellItemSelectDelegate> *cellSelectDelegate;


@end
