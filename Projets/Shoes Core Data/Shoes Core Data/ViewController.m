//
//  ViewController.m
//  Shoes Core Data
//
//  Created by Ludovic Ollagnier on 29/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataManager.h"
#import "Shoes+CoreDataProperties.h"
#import "Shoesing+CoreDataProperties.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    [self createShoes];
    [self listShoes];
}

- (void)createShoes {

    CoreDataManager *manager = [CoreDataManager defaultManager];
    NSPersistentContainer *container = manager.persistentContainer;
    NSManagedObjectContext *context = container.viewContext;

    // On utilise initWithContext pour créer l'objet dans le bon contexte
    Shoes *s = [[Shoes alloc] initWithContext:context];
    s.brand = @"Nike";
    s.color = @"White";
    s.size = 43;

    Shoesing *shoesing = [[Shoesing alloc] initWithContext:context];
    shoesing.name = @"Mon Shoesing";
    shoesing.location = @"New-York";

    [shoesing addShoesObject:s];

    [manager saveContext];
}

- (void)listShoes {

    CoreDataManager *manager = [CoreDataManager defaultManager];
    NSPersistentContainer *container = manager.persistentContainer;
    NSManagedObjectContext *context = container.viewContext;

    NSFetchRequest *request = [Shoes fetchRequest];

    NSError *error = nil;
    NSArray *result = [context executeFetchRequest:request error:&error];

    if (error) {
        NSLog(@"%@", error.localizedDescription);
        return;
    }

    NSLog(@"%@", result);
}

@end
