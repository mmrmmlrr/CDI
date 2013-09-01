//
// CDIBatch+Package.h 
// CoreDataImport
//
// Created by dmitriy on 28.08.13
// Copyright (c) 2013 Quotient Solutions. All rights reserved. 
//
#import <Foundation/Foundation.h>
#import "CDIBatch.h"

@interface CDIBatch (Package)

- (instancetype)initWithObjects:(NSArray *)objects;

- (void)addManagedObject:(NSManagedObject *)object;
- (void)removeManagedObject:(NSManagedObject *)object;

@end