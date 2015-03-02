//
//  User.m
//  WatchJD
//
//  Created by djwang on 15/2/6.
//  Copyright (c) 2015年 belter. All rights reserved.
//

#import "User.h"

@implementation User


-(instancetype)init:(NSString *)name
             gender:(Gender)gender
           birthday:(NSDate *)birthday
         profession:(Profession)profession
          telephone:(NSString *)telephone
              email:(NSString *)email
{
    self = [super init];
    if (self) {
        self.name = name;
        self.gender = gender;
        self.birthday = birthday;
        self.profession = profession;
        self.telephone = telephone;
        self.email = email;
    }
    return self;
}






@end
