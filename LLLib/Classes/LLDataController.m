//
//  LLDataController.m
//  Pods
//
//  Created by PP on 9/16/16.
//
//

#import "LLDataController.h"
#import <CoreData/CoreData.h>

@implementation LLDataController

-(id)init
{
    self = [super init];
    
    if(self != nil)
    {
        
        
    }
    
    return self;
}

-(id)initWithModel:(NSManagedObjectModel*) model
{
    self = [super init];
    
    if(self != nil)
    {
        [self initCoreDataWithModel:model];
    }
    
    return self;
}

-(NSManagedObject*)getObjectWithID:(NSManagedObjectID*)objId
{
    return [[self moc] objectWithID:objId];
}

-(NSManagedObjectContext*)getDataContext
{
    return [self moc];
}

-(void)initCoreDataWithModel:(NSManagedObjectModel*)mom
{
    NSAssert(mom != nil, @"Error initializing Managed Object Model");
    
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    NSManagedObjectContext *moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [moc setPersistentStoreCoordinator:psc];
    [self setMoc:moc];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"DataModel.sqlite"];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        NSError *error = nil;
        NSPersistentStoreCoordinator *psc = [[self moc] persistentStoreCoordinator];
        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
        NSAssert(store != nil, @"Error initializing PSC: %@\n%@", [error localizedDescription], [error userInfo]);
    });
    
}

-(NSArray*)getObjectsNamed:(NSString*)name
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:name];
    NSError *error = nil;
    NSArray *results = [self.moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    
    return results;
}

@end
