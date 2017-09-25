//
//  Car.m
//  Objective-C
//
//  Created by Ludovic Ollagnier on 25/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)setSpeed:(int)speed numberOfPassengers:(int)passengers andDestination:(NSString *)dest {

    _speed = speed;

    // Bonne pratique
    [self setSpeed:speed];
}

+ (Car *)ferrari {

    Car *f = [[Car alloc] init];
    [f setBrand:@"Ferrari"];

    return f;
}

@end
