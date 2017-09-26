//
//  Shoesing.h
//  Shoes
//
//  Created by Ludovic Ollagnier on 26/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Shoes;

@interface Shoesing : NSObject

- (void)addShoes:(nonnull Shoes *)s;
- (void)removeShoes:(nonnull Shoes *)s;
- (nonnull NSArray<Shoes*> *)allShoes;

+ (nonnull Shoesing *)demoShoeshing;
@end
