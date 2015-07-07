#import "_Work.h"

@interface Work : _Work {}

+(Work*)newWorkWithClientName:(NSString*)name workDescription:(NSString*)descrition vehicleMade:(NSString*)made vehicleYear:(NSNumber*)year;

//+(NSFetchedResultsController*)getAllWorksWithDelegate:(id<NSFetchedResultsControllerDelegate>)delegate;

-(void)deleteMe;

+(NSFetchedResultsController*)getAllWorksWithDelegate:(id<NSFetchedResultsControllerDelegate>)delegate;

+(NSFetchedResultsController*)getTodayWorksWithDelegate:(id<NSFetchedResultsControllerDelegate>)delegate;

@end
