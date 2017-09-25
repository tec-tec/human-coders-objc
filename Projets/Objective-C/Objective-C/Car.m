//
//  Car.m
//  Objective-C
//
//  Created by Ludovic Ollagnier on 25/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import "Car.h"

// Catégorie anonyme, pour définir les méthodes/propriétés privé
@interface Car ()

@property (strong, nonatomic) NSString *privateProperty;

@end

@implementation Car

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBrand:@""];
        [self setSpeed:0];
    }
    return self;
}

- (instancetype)initWithBrand:(NSString*)b
{
    self = [super init];
    if (self) {
        [self setBrand:b];
        [self setSpeed:0];
    }
    return self;
}

- (void)setSpeed:(int)speed numberOfPassengers:(int)passengers andDestination:(NSString *)dest {

    _speed = speed;

    // Bonne pratique
    [self setSpeed:speed];
}

+ (Car *)ferrari {

    Car *f = [[Car alloc] init];
    [f setBrand:@"Ferrari"];

    // Pour de la localisation
    NSLocalizedString(@"VALIDATE_BUTTON", @"This is the text for the validate button");

    return f;
}

@end
