// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Work.m instead.

#import "_Work.h"

const struct WorkAttributes WorkAttributes = {
	.clientName = @"clientName",
	.vehicleMade = @"vehicleMade",
	.vehicleYear = @"vehicleYear",
	.workDate = @"workDate",
	.workDescription = @"workDescription",
};

@implementation WorkID
@end

@implementation _Work

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Work" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Work";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Work" inManagedObjectContext:moc_];
}

- (WorkID*)objectID {
	return (WorkID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"vehicleYearValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"vehicleYear"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic clientName;

@dynamic vehicleMade;

@dynamic vehicleYear;

- (int16_t)vehicleYearValue {
	NSNumber *result = [self vehicleYear];
	return [result shortValue];
}

- (void)setVehicleYearValue:(int16_t)value_ {
	[self setVehicleYear:@(value_)];
}

- (int16_t)primitiveVehicleYearValue {
	NSNumber *result = [self primitiveVehicleYear];
	return [result shortValue];
}

- (void)setPrimitiveVehicleYearValue:(int16_t)value_ {
	[self setPrimitiveVehicleYear:@(value_)];
}

@dynamic workDate;

@dynamic workDescription;

@end

