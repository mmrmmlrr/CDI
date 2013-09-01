//
// CDIOperation+Protected.h 
// CoreDataImport
//
// Created by dmitriy on 27.08.13
// Copyright (c) 2013 Quotient Solutions. All rights reserved. 
//
#import <Foundation/Foundation.h>
#import "CDIOperation.h"

@class CDIBatch;

@interface CDIOperation (Protected)

- (void)willBeginBatchImport:(CDIBatch *)batch;
- (void)willEndBatchImport:(CDIBatch *)batch;
- (void)didEndBatchImport:(CDIBatch *)batch;

- (NSManagedObject *)managedObjectUsingDictionary:(NSDictionary *)dictionary;

@end