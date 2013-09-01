//
// CDIBatch.m 
// CoreDataImport
//
// Created by dmitriy on 28.08.13
// Copyright (c) 2013 Quotient Solutions. All rights reserved. 
//
#import "CDIBatch.h"
#import "CDIBatch+Package.h"

@implementation CDIBatch

@dynamic managedObjects;

- (NSArray *)managedObjects {
	return [_mutableManagedObjects copy];
}

@end

@implementation CDIBatch (Package)

#pragma mark - Init

- (instancetype)initWithObjects:(NSArray *)objects {
	NSParameterAssert(objects != nil);

	self = [super init];
	if (self != nil) {
		_objects = [objects copy];
		_mutableManagedObjects = [[NSMutableArray alloc] initWithCapacity:_objects.count];
	}

	return self;
}

#pragma mark - processedObjects mutation

- (void)addManagedObject:(NSManagedObject *)object {
	[_mutableManagedObjects addObject:object];
}

- (void)removeManagedObject:(NSManagedObject *)object {
	[_mutableManagedObjects removeObject:object];
}

@end