//
// CDIBatch.h 
// CoreDataImport
//
// Created by dmitriy on 28.08.13
// Copyright (c) 2013 Quotient Solutions. All rights reserved. 
//
#import <Foundation/Foundation.h>

@interface CDIBatch : NSObject {
	@private
	NSMutableArray *_mutableManagedObjects;
}

@property (nonatomic, copy, readonly) NSArray *objects;
@property (nonatomic, strong, readonly) NSArray *managedObjects;

@end