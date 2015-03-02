//
//  MenuItemTableViewCell.h
//  WatchJD
//
//  Created by djwang on 15/2/13.
//  Copyright (c) 2015年 belter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;

-(void)setCellView:(NSDictionary *)dic;

@end
