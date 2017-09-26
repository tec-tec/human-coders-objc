//
//  Shoes.m
//  Shoes
//
//  Created by Ludovic Ollagnier on 26/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import "Shoes.h"

// Extension interface ou catégorie anonyme
@interface Shoes ()

//Permet de générer un setter "privé", car readonly dans le .h
@property (strong, nonatomic) NSString *uuid;

@end

@implementation Shoes

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.uuid = [[NSUUID alloc] init].UUIDString;
    }
    return self;
}

- (instancetype)initWithBrand:(NSString*)brand color:(NSString*)color size:(int)size andType:(ShoeType)type {
    self = [super init];
    if (self) {
        self.brand = brand;
        self.color = color;
        self.size = size;
        self.type = type;
        self.uuid = [[NSUUID alloc] init].UUIDString;
    }
    return self;
}

- (void)wear {
    self.worn = YES;

    NSLog(@"Je met mes %@", self.brand);
}

- (void)unWear {

    if (self.isWorn) {
        self.worn = NO;
    } else {
        NSLog(@"This is not my current shoes");
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Chaussure de marque %@, pointure: %d, %p", self.brand, self.size, self];
}

@end
