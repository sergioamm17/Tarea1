#import "Work.h"
//#import <MagicalRecord/MagicalRecord.h>

@interface Work ()

// Private interface goes here.

@end

@implementation Work

-(void)deleteMe
{
    [self MR_deleteEntity];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

+(Work*)newWorkWithClientName:(NSString *)name workDescription:(NSString *)descrition vehicleMade:(NSString *)made vehicleYear:(NSNumber *)year
{
    Work *newWork = [Work MR_createEntity];
    newWork.clientName = name;
    newWork.workDescription = descrition;
    newWork.vehicleMade = made;
    newWork.vehicleYear = year;
    newWork.workDate = [NSDate new];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    return  newWork;
}

+(NSFetchedResultsController*)getAllWorksWithDelegate:(id<NSFetchedResultsControllerDelegate>)delegate {
    
    return [Work MR_fetchAllSortedBy:@"clientName"
                           ascending:YES
                       withPredicate:nil
                             groupBy:nil
                            delegate:delegate];
    
}

+(NSFetchedResultsController*)getTodayWorksWithDelegate:(id<NSFetchedResultsControllerDelegate>)delegate{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    NSDate *date = [NSDate date];
    
    int daysToAdd = 1;
    NSDate *newDate = [date dateByAddingTimeInterval:60*60*24*daysToAdd];
    
    NSPredicate *where = [NSPredicate predicateWithFormat:@"workDate >= %@ && workDate < %@",
                          [dateFormatter dateFromString:[dateFormatter stringFromDate:date]], [dateFormatter dateFromString:[dateFormatter stringFromDate:newDate]]];
    
    return [Work MR_fetchAllSortedBy:@"workDate" ascending:NO withPredicate:where groupBy:nil delegate:delegate];
    
}


@end
