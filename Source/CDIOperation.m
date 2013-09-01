//
// CDIOperation.m 
// CoreDataImport
//
// Created by dmitriy on 27.08.13
// Copyright (c) 2013 Quotient Solutions. All rights reserved. 
//
#import "CDIOperation.h"
#import "CDIOperation+Protected.h"

#import "CDIBatch.h"
#import "CDIBatch+Package.h"

const NSUInteger CDIOperationBatchSize = 500;

@interface CDIOperation () {
	NSMutableArray *_managedObjects;
	NSMutableArray *_managedObjectIDs;


}

@end

@implementation CDIOperation

#pragma mark - Init

- (instancetype)initWithEntity:(NSEntityDescription *)entity
                       objects:(NSArray *)objects
	                   context:(NSManagedObjectContext *)context {
//	NSParameterAssert(entity != nil);
//	NSParameterAssert(objects != nil);
//	NSParameterAssert(context != nil);

	self = [super init];
	if (self) {
		_entity = entity;
		_objects = [objects copy];
		_managedObjectContext = context;
		_batchSize = CDIOperationBatchSize;
		_managedObjects = [[NSMutableArray alloc] initWithCapacity:_objects.count];
		_managedObjectIDs = [[NSMutableArray alloc] initWithCapacity:_objects.count];
	}

	return self;
}

+ (instancetype)operationWithEntity:(NSEntityDescription *)entity
                            objects:(NSArray *)objects
	                        context:(NSManagedObjectContext *)context {
	return [[self alloc] initWithEntity:nil objects:objects context:context];
}

#pragma mark - Import

- (void)main {
	NSUInteger batchSize = self.batchSize ?: NSUIntegerMax;
	NSUInteger batchCount = (self.objects.count + batchSize - 1) / batchSize;

	for (NSUInteger index = 0; index < batchCount; index++) {
		NSUInteger location = index * batchSize;
		NSRange batchRange = { .location = location, .length = MIN(self.objects.count - location, batchSize) };

		CDIBatch *batch = [[CDIBatch alloc] initWithObjects:[self.objects subarrayWithRange:batchRange]];
		[self willBeginBatchImport:batch];

		for (NSDictionary *inputDictionary in batch.objects) {
			@autoreleasepool {
				NSManagedObject *object = [self managedObjectUsingDictionary:inputDictionary];
				if (object != nil) {
					[_managedObjects addObject:object];
					[batch addManagedObject:object];
				}
			}
		}

		[self willEndBatchImport:batch];

		__autoreleasing NSError *error = nil;
		[self.managedObjectContext save:&error];
		NSAssert(error == nil, @"NSManagedObjectContext save error:%@", [error localizedDescription]);

		[_managedObjectIDs addObjectsFromArray:[_managedObjects valueForKey:@"objectID"]];

		[self didEndBatchImport:batch];
	}
}

@end

@implementation CDIOperation (Protected)

- (void)willBeginBatchImport:(CDIBatch *)batch {

}

- (void)willEndBatchImport:(CDIBatch *)batch {

}

- (void)didEndBatchImport:(CDIBatch *)batch {

}

- (NSManagedObject *)managedObjectUsingDictionary:(NSDictionary *)dictionary {
	return nil;
}

@end