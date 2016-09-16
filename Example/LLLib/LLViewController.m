//
//  LLViewController.m
//  LLLib
//
//  Created by Zunware on 09/08/2016.
//  Copyright (c) 2016 Zunware. All rights reserved.
//

#import "LLViewController.h"

@interface LLViewController ()

@end

@implementation LLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Sampel usage of LLLib
    LLLib* libMan = [LLLib getInstance];  // Provides access via singleton
    
    // Create a new GameScore
    NSManagedObject* obj = [libMan createInstance:@"GameScore" withData:@{
        @"score": @100,
        @"playerName": @"testing01",
        @"cheatMode": @NO,
    }];
    
    // Another one
    NSManagedObject* obj2 = [libMan createInstance:@"GameScore" withData:@{
        @"score": @200,
        @"playerName": @"testing02",
        @"cheatMode": @YES,
    }];
    
    // save to disk
    [libMan saveContext];
    
    
    // Read fresh
    NSArray* allScores = [libMan getObjectsNamed:@"GameScore"];
    
    // Loop and print
    for(int i = 0; i < [allScores count]; ++i)
    {
        NSManagedObject* s = [allScores objectAtIndex:i];
        BOOL wasCheat = [[s valueForKey:@"cheatMode"] boolValue];
        NSLog(@"Score: %@ Username: %@ wasCheating: %@", [s valueForKey:@"score"], [s valueForKey:@"playerName"], ( wasCheat ? @"True" : @"False") );
    }
    
    // Make some updates
    NSManagedObject* score = [allScores objectAtIndex:0];
    [score setValue:@940 forKey:@"score"];
    
    // Save changes to disk
    [libMan saveContext];
    
    // Print fresh list
    NSArray* allNewScores = [libMan getObjectsNamed:@"GameScore"];
    for(int i = 0; i < [allNewScores count]; ++i)
    {
        NSManagedObject* s = [allScores objectAtIndex:i];
        
        BOOL wasCheat = [[s valueForKey:@"cheatMode"] boolValue];
        NSLog(@"Score: %@ Username: %@ wasCheating: %@", [s valueForKey:@"score"], [s valueForKey:@"playerName"], (wasCheat ? @"True" : @"False") );
        
        // Search and destroy a single object
        if([[s valueForKey:@"score"] isEqual:@940])
        {
            [libMan deleteInstance:s];
        }
    }
    
    // Always remember to save to disk any changes
    [libMan saveContext];
    NSArray* allNewScores2 = [libMan getObjectsNamed:@"GameScore"];
    NSLog(@"%lu",(unsigned long)[allNewScores2 count]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
