//
// CDIOperation.h 
// CoreDataImport
//
// Created by dmitriy on 27.08.13
// Copyright (c) 2013 Quotient Solutions. All rights reserved. 
//
#import <Foundation/Foundation.h>

extern const NSUInteger CDIOperationBatchSize;

@class CDIOperation;

typedef void (^CDIOperationCallback)(CDIOperation *sender, id output);

@interface CDIOperation : NSOperation

- (instancetype)initWithEntity:(NSEntityDescription *)entity objects:(NSArray *)objects context:(NSManagedObjectContext *)context;
+ (instancetype)operationWithEntity:(NSEntityDescription *)entity objects:(NSArray *)objects context:(NSManagedObjectContext *)context;

@property (nonatomic, strong, readonly) NSEntityDescription *entity;
@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, copy, readonly) NSArray *objects;

@property (nonatomic, strong, readonly) NSArray *managedObjects;
@property (nonatomic, strong, readonly) NSArray *managedObjectIDs;

@property (nonatomic) NSUInteger batchSize;

@property (nonatomic, copy) CDIOperationCallback callback;
@property (nonatomic, strong) dispatch_queue_t callbackQueue;

@end