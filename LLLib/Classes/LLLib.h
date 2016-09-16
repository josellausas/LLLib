//
//  LLLib.h
//  Pods
//
//  Created by PP on 9/8/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "LLDataController.h"

@interface LLLib : NSObject

@property LLDataController* dataController;

+(id)getInstance;

-(void)initCoreDataWithModel:(NSDictionary*)modelDict;

-(NSArray*)getObjectsNamed:(NSString*)name;

@end
