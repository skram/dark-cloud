//
//  OMAppDelegate.m
//  DarkCloudTest
//
//  Created by Mark on 5/26/12.
//  Copyright (c) 2012 TapFactory LLC. All rights reserved.
//

#import "OMAppDelegate.h"

#import "OMViewController.h"

@implementation OMAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    
    //223df37b55363eda88e3000baa4a592c
    DarkCloud *cloud = [[[DarkCloud alloc] initWithAPIKey:@"API_KEY"] autorelease];
    cloud.delegate = self;
        
    //Example full forecast. set YES for brief.
    [cloud getHourlyForcastForLatitude:40.673175 
                             longitude:-74.22492 brief:NO];
    

    // Example Multiple Points and Times
    /*
    NSMutableDictionary *dict = [[[NSMutableDictionary alloc] init] autorelease];
    [dict setValue:[NSNumber numberWithDouble:40.673175] forKey:@"LAT"];
    [dict setValue:[NSNumber numberWithDouble:-74.22492] forKey:@"LON"];
    [dict setValue:[NSNumber numberWithDouble:[DarkCloud getGMTFormatDate:[NSDate date]]] forKey:@"TIME"];
    
    NSMutableDictionary *dict2 = [[[NSMutableDictionary alloc] init] autorelease];
    [dict2 setValue:[NSNumber numberWithDouble:40.673175] forKey:@"LAT"];
    [dict2 setValue:[NSNumber numberWithDouble:-74.22492] forKey:@"LON"];
    
    NSDate *now = [NSDate date];
    NSDate *later = [now dateByAddingTimeInterval:3600];
    
    [dict2 setValue:[NSNumber numberWithDouble:[DarkCloud getGMTFormatDate:later]] forKey:@"TIME"];

    [cloud getForecastCollection:[NSArray arrayWithObjects:dict,dict2,nil]];
     */
    
    
    //Interesting Storms Example.
    //    [cloud getInterestingStorms];

    
    
    
    self.viewController = [[[OMViewController alloc] initWithNibName:@"OMViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark DarkCloud Delegate Methods
-(void)briefForecastReceived:(NSDictionary *)forecast {
    
    NSLog(@"%@",forecast);
}

-(void)fullForecastReceived:(NSDictionary *)forecast {
    
    NSLog(@"%@",forecast);
}

-(void)forecastCollectionReceived:(NSDictionary *)collection {
    
    NSLog(@"%@",collection);
    
}

-(void)interestingStormsReceived:(NSDictionary*)storms {
    
    NSLog(@"%@",storms);

}

-(void)errorOccured:(NSError*)error {
    
    NSLog(@"Error occured: %@", [error description]);
}
#pragma mark -

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
