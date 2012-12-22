dark-cloud
==========

iOS Static Library w/ Example project for DarkSky API. (https://developer.darkskyapp.com)


Installtion
==========

1.) Add libDarkCloud.a library and /usr Directory into your project.

2.) Import DarkCloud.h (`#import "DarkCloud.h"`) , and make your class conform to `DarkCloudDelegate` protocol.

Methods
==========
    //Initializer to DarkCloud Library.
    -(id)initWithAPIKey:(NSString*)api_key
    
    //Makes hourly forecast request, with option for brief or full.
    -(void)getHourlyForcastForLatitude:(double)lat 
                         longitude:(double)lon brief:(BOOL)yesNo;
                         
    //Takes an Array of NSDictionaries with lat,lon,time key's.
    -(void)getForecastCollection:(NSArray*)collection;
    
    //Makes request to retrieve interesting storms.
    -(void)getInterestingStorms;
    
    //Helper Class method to create timestamp.
    + (NSTimeInterval)getGMTFormatDate:(NSDate*)date;
Delegate Methods
==========
    -(void)briefForecastReceived:(NSDictionary*)dictionary;
    -(void)fullForecastReceived:(NSDictionary*)dictionary;
    -(void)forecastCollectionReceived:(NSDictionary*)collection;
    -(void)interestingStormsReceived:(NSDictionary*)storms;
    -(void)errorOccured:(NSError*)error;
Usage
==========
    
    //Full hourly forecast request.
    DarkCloud *cloud = [[[DarkCloud alloc] initinitWithAPIKey:@"API_KEY"] autorelease];
    cloud.delegate = self;
    [cloud getHourlyForcastForLatitude:40.673175 
                             longitude:-74.22492 brief:NO];
    ============================================================
    
    //Example Multiple Points and Times
    DarkCloud *cloud = [[[DarkCloud alloc] initinitWithAPIKey:@"API_KEY"] autorelease];
    cloud.delegate = self;
    
    NSMutableDictionary *point1 = [[NSMutableDictionary alloc] init];
    [point1 setValue:[NSNumber numberWithDouble:40.673175] forKey:@"LAT"];
    [point1 setValue:[NSNumber numberWithDouble:-74.22492] forKey:@"LON"];
    [point1 setValue:[NSNumber numberWithDouble:[DarkCloud getGMTFormatDate:[NSDate date]]] forKey:@"TIME"];
    
    NSMutableDictionary *point2 = [[NSMutableDictionary alloc] init];
    [point2 setValue:[NSNumber numberWithDouble:40.673175] forKey:@"LAT"];
    [point2 setValue:[NSNumber numberWithDouble:-74.22492] forKey:@"LON"];
    
    NSDate *now = [NSDate date];
    NSDate *later = [now dateByAddingTimeInterval:3600];
    [dict2 setValue:[NSNumber numberWithDouble:[DarkCloud getGMTFormatDate:later]] forKey:@"TIME"];

    [cloud getForecastCollection:[NSArray arrayWithObjects:point1,point2,nil]];                         
                             
                             
