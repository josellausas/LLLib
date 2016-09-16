//
//  LLAppDelegate.m
//  LLLib
//
//  Created by Zunware on 09/08/2016.
//  Copyright (c) 2016 Zunware. All rights reserved.
//

#import "LLAppDelegate.h"

@implementation LLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    // Setup the LLLib when the app launches
    [[LLLib getInstance] initCoreDataWithModel:@{
         @"GameScore" : @{
                 @"score":@"number",
                 @"playerName":@"string",
                 @"cheatMode": @"bool",
         },
         @"Task" : @{
                 @"title":@"string",
                 @"dueDate":@"date",
                 @"status":@"number",
         }
    }];
    
    return YES;
}

@end
