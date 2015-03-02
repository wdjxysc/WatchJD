//
//  Person.h
//  WatchJD
//
//  Created by djwang on 15/2/6.
//  Copyright (c) 2015年 belter. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Person : NSObject

typedef enum
{
    Male,
    Female
} Gender;

@property (strong,nonatomic) NSString *name;
@property (nonatomic) Gender gender;
@property (strong,nonatomic) NSDate *birthday;
@property NSInteger *age;
@property (strong,nonatomic) NSString *telephone;
@property (strong,nonatomic) NSString *email;


-(instancetype)initWithName:(NSString *)name;

@end
