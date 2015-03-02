//
//  Person.m
//  WatchJD
//
//  Created by djwang on 15/2/6.
//  Copyright (c) 2015年 belter. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if(self)
    {
        self.name = name;
    }
    return  self;
}

-(void)setBirthday:(NSDate *)birthday
{
    self.birthday = birthday;
    self.age = (NSInteger *)[self GetAgeByBrithday:birthday];
}

/**
 *  根据生日获取年龄
 *
 *  @param brithday 生日
 *
 *  @return 年龄
 */
-(long)GetAgeByBrithday:(NSDate *)brithday
{
    long age = 0;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];//设置成中国阳历
    NSDateComponents *brithdaycomps = [[NSDateComponents alloc] init];
    NSDateComponents *nowcomps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;//这句我也不明白具体时用来做什么。。。
    brithdaycomps = [calendar components:unitFlags fromDate:brithday];
    nowcomps = [calendar components:unitFlags fromDate:NSDate.date];
    //    long brithdayweekNumber = [brithdaycomps weekday]; //获取星期对应的长整形字符串
    long brithdayday=[brithdaycomps day];//获取日期对应的长整形字符串
    long brithdayyear=[brithdaycomps year];//获取年对应的长整形字符串
    long brithdaymonth=[brithdaycomps month];//获取月对应的长整形字符串
    //    long brithdayhour=[brithdaycomps hour];//获取小时对应的长整形字符串
    //    long brithdayminute=[brithdaycomps minute];//获取月对应的长整形字符串
    //    long brithdaysecond=[brithdaycomps second];//获取秒对应的长整形字符串
    //    long nowweekNumber = [nowcomps weekday]; //获取星期对应的长整形字符串
    long nowday=[nowcomps day];//获取日期对应的长整形字符串
    long nowyear=[nowcomps year];//获取年对应的长整形字符串
    long nowmonth=[nowcomps month];//获取月对应的长整形字符串
    //    long nowhour=[nowcomps hour];//获取小时对应的长整形字符串
    //    long nowminute=[nowcomps minute];//获取月对应的长整形字符串
    //    long nowsecond=[nowcomps second];//获取秒对应的长整形字符串
    
    if(nowyear>brithdayyear)
    {
        if(nowmonth>brithdaymonth)
        {
            age = nowyear - brithdayyear;
        }
        else if(nowmonth == brithdaymonth)
        {
            if(nowday>=brithdayday)
            {
                age = nowyear - brithdayyear;
            }
            else
            {
                age = nowyear - brithdayyear - 1;
            }
        }
        else
        {
            age = nowyear - brithdayyear - 1;
        }
        
    }
    else
    {
        age = 0;
    }
    return age;
}

@end
