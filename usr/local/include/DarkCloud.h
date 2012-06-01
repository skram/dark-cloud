//
//  DarkCloud.h
//  DarkCloud
//
//  Created by Mark on 5/26/12.
//  Copyright (c) 2012 skram devs LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#define API_KEY @"API_KEY"

@protocol DarkCloudDelegate <NSObject>

-(void)briefForecastReceived:(NSDictionary*)dictionary;
-(void)fullForecastReceived:(NSDictionary*)dictionary;
-(void)forecastCollectionReceived:(NSDictionary*)collection;
-(void)interestingStormsReceived:(NSDictionary*)storms;
-(void)errorOccured:(NSError*)error;

@end

@interface DarkCloud : NSObject {
    
    id<DarkCloudDelegate>delegate;
}

//Helper Class method to create timestamp.
+ (NSTimeInterval)getGMTFormatDate:(NSDate*)date;
 

//Makes hourly forecast request, with option for brief or full.
-(void)getHourlyForcastForLatitude:(double)lat 
                         longitude:(double)lon brief:(BOOL)yesNo;


//Takes an Array of NSDictionaries with lat,lon,time key's.
-(void)getForecastCollection:(NSArray*)collection;



//Makes request to retrieve interesting storms.
-(void)getInterestingStorms;

@property(nonatomic,assign)id<DarkCloudDelegate>delegate;

@end
