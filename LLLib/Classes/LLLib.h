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

/**
 *  The LL Library by jose [at] zunware.com
 */
@interface LLLib : NSObject

@property LLDataController* dataController;

/**
 *  Provides access to the Library Singleton
 *
 *  @return Singleton Instance
 */
+(id)getInstance;

/**
 *  Initializes a Core Data storage with the model provided.
 *  The model expected to look like this:
 *
 *  ```
 *  {
 *      @"className": {
 *          @"aStringProperty":@"string",
 *          @"aNumberProperty":@"number",
 *          @"aBoolProperty":@"bool",
 *          @"aDateProperty":@"date",
 *      },
 *      @"foo": {
 *          @"bar":@"string",
 *      }
 * }
 * ```
 *
 *  @param modelDict The schema for the model
 */
-(void)initCoreDataWithModel:(NSDictionary*)modelDict;

/**
 *  Returns an array of all the objects for the given class name
 *
 *  @param name The name of the class to fetch from the CoreData store
 *
 *  @return An array with the objects (if any)
 */
-(NSArray*)getObjectsNamed:(NSString*)name;

/**
 *  Creates a new instance of the class with the given data. DOES NOT SAVE! SAVE NEEDS TO BE DONE AFTER THIS
 *
 *  @param className The name of the class
 *  @param data      A dictionary with the params as keys and the data as value
 *
 *  @return A new managed object instance of the given class filled up with the data
 */
-(NSManagedObject*)createInstance:(NSString*)className withData:(NSDictionary*)data;

/**
 *  Deletes an object from the CoreData store. MUST SAVE AFTER!
 *
 *  @param objToDelete The object that will be deleted
 */
-(void)deleteInstance:(NSManagedObject*)objToDelete;

/**
 *  Deletes an array of objects from the CoreData store. MUST SAVE AFTER!
 *
 *  @param instancesToDelete The array of things to delete
 */
-(void)deleteObjects:(NSArray*)instancesToDelete;

/**
 *  Saves all the changes made to the CoreData objects
 *
 *  @return YES if success, else NO
 */
-(BOOL)saveContext;

@end
