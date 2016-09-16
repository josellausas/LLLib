//
//  LLLib.m
//  Pods
//
//  Created by PP on 9/8/16.
//
//

#import "LLLib.h"


@implementation LLLib

-(id)init
{
    self = [super init];
    
    if(self != nil)
    {
        self.dataController = nil;
    }
    
    return self;
}


+(id)getInstance
{
    static LLLib *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LLLib alloc] init];
    });
    return sharedInstance;
}

-(NSManagedObject*)createNewObject:(NSString*)objectName
{
    NSManagedObject* entity = [NSEntityDescription
                                   insertNewObjectForEntityForName:objectName
                                   inManagedObjectContext:[self.dataController getDataContext]];

    return entity;
}

-(BOOL)saveContext
{
    // Attempt to save
    NSError* error;
    [self.dataController.moc save:&error];
    
    if(error)
    {
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
    
    return YES;
}

-(void)initCoreDataWithModel:(NSDictionary*)modelDict
{
    NSManagedObjectModel* model = [[NSManagedObjectModel alloc] init];
    NSMutableArray* allClassesForModel = [NSMutableArray array];
    
    for(NSString* key in [modelDict allKeys])
    {
        NSEntityDescription* entity = [[NSEntityDescription alloc]init];
        
        [entity setName:key];
        [entity setManagedObjectClassName:key];
        
        // Cretate the attributes
        NSMutableArray* properties = [NSMutableArray array];
        
        
        // Generate the properties
        NSDictionary* props = [modelDict objectForKey:key];
        for (NSString* keyName in [props allKeys])
        {
            NSString* typeString  = [props objectForKey:keyName];
            NSAttributeDescription* attr = [[NSAttributeDescription alloc] init];
            [attr setName:keyName];
            
            if([typeString isEqualToString:@"string"])
            {
                [attr setAttributeType:NSStringAttributeType];
            }
            
            if([typeString isEqualToString:@"number"])
            {
                [attr setAttributeType:NSDoubleAttributeType];
            }
            
            if([typeString isEqualToString:@"date"])
            {
                [attr setAttributeType:NSDateAttributeType];
            }
            
            if([typeString isEqualToString:@"bool"])
            {
                [attr setAttributeType:NSBooleanAttributeType];
            }
            
            [attr setOptional:NO];
            [properties addObject:attr];
        }
        
        // Set them to the entity
        [entity setProperties:properties];
        
        // Add the entity to the list
        [allClassesForModel addObject:entity];
    }
    
    [model setEntities:allClassesForModel];
    
    // Create a Data controller with the model
    self.dataController = [[LLDataController alloc] initWithModel:model];
    
    [self saveContext];
}

-(NSArray*)getObjectsNamed:(NSString*)name
{
    return [self.dataController getObjectsNamed:name];
}

-(NSManagedObject*)createInstance:(NSString*)className withData:(NSDictionary*)data
{
    NSManagedObject* obj = [self createNewObject:className];
    
    if(obj != nil)
    {
        for(NSString* key in [data allKeys])
        {
            [obj setValue:[data valueForKey:key] forKey:key];
        }
    }
    else
    {
        NSLog(@"Error: Could not create ManagedObject");
    }
    
    return obj;
    
}

-(void)deleteInstance:(NSManagedObject*)objToDelete
{
    [[self.dataController getDataContext] deleteObject:objToDelete];
}

-(void)deleteObjects:(NSArray*)instancesToDelete
{
    for(int i = 0; i < [instancesToDelete count]; ++i)
    {
        [self deleteInstance:[instancesToDelete objectAtIndex:i]];
    }
}







@end
