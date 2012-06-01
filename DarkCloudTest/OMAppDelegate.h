//
//  OMAppDelegate.h
//  DarkCloudTest
//
//  Created by Mark on 5/26/12.
//  Copyright (c) 2012 TapFactory LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DarkCloud.h"

@class OMViewController;

@interface OMAppDelegate : UIResponder <UIApplicationDelegate,DarkCloudDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) OMViewController *viewController;

@end
