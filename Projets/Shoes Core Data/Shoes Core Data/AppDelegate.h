//
//  AppDelegate.h
//  Shoes Core Data
//
//  Created by Ludovic Ollagnier on 29/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

