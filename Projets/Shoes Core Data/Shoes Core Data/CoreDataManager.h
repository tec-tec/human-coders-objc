//
//  CoreDataManager.h
//  Shoes Core Data
//
//  Created by Ludovic Ollagnier on 29/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreData;

@interface CoreDataManager : NSObject

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

+ (CoreDataManager*)defaultManager;

@end
