//
//  LLDataController.h
//  Pods
//
//  Created by PP on 9/16/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

/**
 *  Manages the CoreData internals.
 */
@interface LLDataController : NSObject

@property (strong) NSManagedObjectContext* moc;
@property (strong) NSPersistentStore* store;

/**
 *  Initializes with the given model
 *
 *  @param model The model
 *
 *  @return Self
 */
-(id)initWithModel:(NSManagedObjectModel*) model;


/**
 *  The context
 *
 *  @return The context for the current thread
 */
-(NSManagedObjectContext*)getDataContext;

/**
 *  Returns an array of all the objects for the given class name
 *
 *  @param name The class name
 *
 *  @return An array of NSManagedObjects
 */
-(NSArray*)getObjectsNamed:(NSString*)name;

@end
