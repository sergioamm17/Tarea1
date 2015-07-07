// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Work.h instead.

@import CoreData;

extern const struct WorkAttributes {
	__unsafe_unretained NSString *clientName;
	__unsafe_unretained NSString *vehicleMade;
	__unsafe_unretained NSString *vehicleYear;
	__unsafe_unretained NSString *workDate;
	__unsafe_unretained NSString *workDescription;
} WorkAttributes;

@interface WorkID : NSManagedObjectID {}
@end

@interface _Work : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) WorkID* objectID;

@property (nonatomic, strong) NSString* clientName;

//- (BOOL)validateClientName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* vehicleMade;

//- (BOOL)validateVehicleMade:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* vehicleYear;

@property (atomic) int16_t vehicleYearValue;
- (int16_t)vehicleYearValue;
- (void)setVehicleYearValue:(int16_t)value_;

//- (BOOL)validateVehicleYear:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* workDate;

//- (BOOL)validateWorkDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* workDescription;

//- (BOOL)validateWorkDescription:(id*)value_ error:(NSError**)error_;

@end

@interface _Work (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveClientName;
- (void)setPrimitiveClientName:(NSString*)value;

- (NSString*)primitiveVehicleMade;
- (void)setPrimitiveVehicleMade:(NSString*)value;

- (NSNumber*)primitiveVehicleYear;
- (void)setPrimitiveVehicleYear:(NSNumber*)value;

- (int16_t)primitiveVehicleYearValue;
- (void)setPrimitiveVehicleYearValue:(int16_t)value_;

- (NSDate*)primitiveWorkDate;
- (void)setPrimitiveWorkDate:(NSDate*)value;

- (NSString*)primitiveWorkDescription;
- (void)setPrimitiveWorkDescription:(NSString*)value;

@end
