//
//  AppDelegate.m
//  Shoes
//
//  Created by Ludovic Ollagnier on 26/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import "AppDelegate.h"
#import "Shoesing.h"
#import "Shoes.h"

#import "ShoesListViewController.h"
#import "ViewController.h"
#import "Constant.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (void)demoDescription {
    Shoes *s = [[Shoes alloc] initWithBrand:@"Nike" color:@"Rose poudré" size:38 andType:ShoeTypeNight];

    NSLog(@"%@", s);
}

- (void)demoDictionary {

    NSDictionary<NSString* , NSString*> *dict = @{@"firstName":@"Ludovic", @"lastName":@"Ollagnier"};
    NSLog(@"%@",[dict objectForKey:@"firstName"]);
    NSLog(@"%@",dict[@"firstName"]);

    NSMutableDictionary *mutDict = [dict mutableCopy];
    [mutDict setObject:@"Truc" forKey:@"Clé"];
    mutDict[@"Clé"] = @"Autre chose";
}

- (void)demoSet {

    NSSet *s = [[NSSet alloc] initWithArray:@[@"Paris", @"Marseille", @"Lyon"]];
    NSSet *s2 = [[NSSet alloc] initWithArray:@[@"Bordeaux", @"Toulouse", @"Lyon"]];

    [s intersectsSet:s2];

    NSMutableSet *mutS = [s mutableCopy];
    [mutS minusSet:s2];
    NSLog(@"%@", mutS );
    
}

- (void)demoNumber {

    NSNumber *n1 = [NSNumber numberWithInt:5];
    [n1 intValue];

    NSNumber *n2 = @YES;
//    NSNumber *n2 = [NSNumber numberWithBool:YES];
}

- (void)testShoesing {
    Shoesing *s = [Shoesing demoShoeshing];
    NSLog(@"%ld",[[s allShoes] count]);

    Shoes *firstShoes = [[s allShoes] firstObject];

    [s removeShoes:firstShoes];
    NSLog(@"%ld",[[s allShoes] count]);
}

- (void)saveNameInDefaults:(NSString *)name {

    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
// En cas d'utilisation d'app group pour partager entre plusieurs apps
//    [NSUserDefaults alloc] initWithSuiteName:

    [prefs setObject:name forKey:UserDefaultsKeyFirstName];
    [prefs setBool:YES forKey:@"onboardingDone"];
    [prefs synchronize];
}

- (void)readDefaults {

    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *name =[prefs stringForKey:UserDefaultsKeyFirstName];
    BOOL done = [prefs boolForKey:@"onboardingDone"];

    NSLog(@"Done : %d, name :  %@", done, name);

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [self demoDescription];
    [self demoDictionary];
    [self demoSet];
    [self demoNumber];
    [self testShoesing];
//    [self saveNameInDefaults:@"Ludovic"];
    [self readDefaults];
    
    self.window = [[UIWindow alloc] init];
    ShoesListViewController *listController = [[ShoesListViewController alloc] init];
    ViewController *form = [[ViewController alloc] init];

    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:listController];

    [self.window setRootViewController: navController];

    [self.window makeKeyAndVisible];

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
