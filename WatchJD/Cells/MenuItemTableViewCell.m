//
//  MenuItemTableViewCell.m
//  WatchJD
//
//  Created by djwang on 15/2/13.
//  Copyright (c) 2015年 belter. All rights reserved.
//

#import "MenuItemTableViewCell.h"

@implementation MenuItemTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellView:(NSDictionary *)dic
{
    [self setBackgroundColor:[UIColor clearColor]];
    if([dic valueForKey:@"image"])
    {
        NSString *str = [dic valueForKey:@"image"];
        _image.image = [UIImage imageNamed:str];
    }
    if([dic valueForKey:@"title"])
    {
        _titleLabel.text = [dic valueForKey:@"title"];
    }
}

@end
