//
//  Shoesing.m
//  Shoes
//
//  Created by Ludovic Ollagnier on 26/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import "Shoesing.h"
#import "Shoes.h"

@interface Shoesing ()

@property (strong, nonatomic) NSArray<Shoes *> *shoesArray;

@end

@implementation Shoesing

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.shoesArray = @[];
    }
    return self;
}

- (NSArray<Shoes *> *)allShoes {
    return [self.shoesArray copy];
}

- (void)addShoes:(Shoes *)s {
    self.shoesArray = [self.shoesArray arrayByAddingObject:s];

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"modelUpdated" object:self userInfo:nil];
}

- (void)removeShoes:(Shoes *)s {
    NSMutableArray<Shoes*> *mutCopy = self.shoesArray.mutableCopy;
    [mutCopy removeObject:s];
    self.shoesArray = [NSArray arrayWithArray:mutCopy];
}

+ (nonnull Shoesing *)demoShoeshing {

    Shoesing *s = [[Shoesing alloc] init];

    for (int i = 0; i<=10; i++) {
        int size = arc4random_uniform(8);
        int type = arc4random_uniform(4);
        NSString *brand = [NSString stringWithFormat:@"Marque %d", i];
        NSString *color = [NSString stringWithFormat:@"Couleur %d", i];

        Shoes *shoes = [[Shoes alloc] initWithBrand:brand color:color size:size andType:type];
        [s addShoes:shoes];
    }

    return s;
}

@end
