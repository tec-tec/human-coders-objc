//
//  Car.h
//  Objective-C
//
//  Created by Ludovic Ollagnier on 25/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (strong, nonatomic) NSString *brand;
@property (nonatomic) int speed;

- (void)setSpeed:(int)speed numberOfPassengers:(int)passengers andDestination:(NSString*)dest;
+ (Car *)ferrari;



@end
