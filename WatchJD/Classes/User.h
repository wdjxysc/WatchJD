//
//  User.h
//  WatchJD
//
//  Created by djwang on 15/2/6.
//  Copyright (c) 2015年 belter. All rights reserved.
//

#import "Person.h"

@interface User : Person

/**
 运动级别
 */
typedef enum
{
    Mental,   //脑力劳动者
    Manual,   //体力劳动者
    Athlate   //运动员
}Profession;

@property(nonatomic)Profession profession;

@end
