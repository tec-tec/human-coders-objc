//
//  AppDelegate.m
//  Objective-C
//
//  Created by Ludovic Ollagnier on 25/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import "AppDelegate.h"
#import "Car.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    Car* aCar = [[Car alloc] initWithBrand:@"Porsche" andSpeed:0];

    [aCar speed];
    [aCar setSpeed: 100];
    [aCar setSpeed: 100 numberOfPassengers: 4 andDestination: @"Paris"];

    NSString *aString = @"Une string";
    id obj = aString;
    NSArray *anArray = obj;

    if ([obj isKindOfClass:[NSArray class]]) {
        [obj count];
        NSLog(@"It's an array");
    } else if ([obj isKindOfClass:[NSString class]]) {
        [obj length];
        NSLog(@"It's a string");
    }
























    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
