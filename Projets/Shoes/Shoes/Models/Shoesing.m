//
//  Shoesing.m
//  Shoes
//
//  Created by Ludovic Ollagnier on 26/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import "Shoesing.h"

@interface Shoesing ()

@property (strong, nonatomic) NSArray<NSString *> *shoesArray;

@end

@implementation Shoesing

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.shoesArray = @[@"Shoe 1", @"Shoe2"];

    }
    return self;
}

@end
