//
//  LLDataController.h
//  Pods
//
//  Created by PP on 9/16/16.
//
//

#import <Foundation/Foundation.h>

@interface LLDataController : NSObject

@property (strong) NSManagedObjectContext* moc;

-(id)initWithModel:(NSManagedObjectModel*) model;
-(NSManagedObjectContext*)getDataContext;
-(void)initCoreData;
-(NSArray*)getObjectsNamed:(NSString*)name;

@end
