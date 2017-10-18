//
//  main.m
//  OC-study
//
//  Created by qingliu on 10/18/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <time.h>
#import <math.h>

struct time_r {
    int tm_sec;
    int tm_min;
    int tm_hour;
    int tm_mday;
    int tm_mon;
    int tm_year;
    int tm_wday;
    int tm_yday;
    int tm_isdst;
    long tm_gmtoff;
    char *tm_zone;
};

void currentTime(long *second,struct time_r *tm){
    int baseYear = 1970;
    int  currentYear;
    //not correct calculate the month days years. just practise struct define and Pass_By_referece
    currentYear = floor(*second / (60* 60* 24* 30* 12));
    printf("Current Year %d\n",currentYear);
    int currentMon = floor((*second - ((60*60*24*30*12)* currentYear))/(60*60*24*30));
    int currentDay = floor((*second - currentYear * 31104000 - currentMon * 2592000)/(60*60*24));
    //access struct member
    tm -> tm_year = baseYear + currentYear;
    tm -> tm_mon = currentMon;
    tm -> tm_mday = currentDay;
}

void hostName(){
    NSHost *host = [NSHost currentHost];
    NSString *hostName = [NSString alloc];
    hostName = [host localizedName];
    NSLog(@"The host name is %@",hostName);
    
}

int main(int argc, const char * argv[]) {
    long secondsSince1970 = time(NULL);
    printf("It has been %ld seconds since 1970\n",secondsSince1970);
    
    struct time_r now;
    currentTime(&secondsSince1970, &now);
    printf("The time is %d-%d-%d\n",now.tm_mon,now.tm_mday,now.tm_year);
    //print host name
    hostName();
    return 0;
}
