//
// NSManagedObject+CDIPrimaryKeys.h 
// CoreDataImport
//
// Created by dmitriy on 27.08.13
// Copyright (c) 2013 Quotient Solutions. All rights reserved. 
//
#import <Foundation/Foundation.h>

@interface NSManagedObject (CDIPrimaryKeys)

+ (NSDictionary *)cdi_primaryKeysMap;

@end