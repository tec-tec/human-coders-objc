//
//  Shoes.h
//  Shoes
//
//  Created by Ludovic Ollagnier on 26/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ShoeType) {
    ShoeTypeSport,
    ShoeTypeNight,
    ShoeTypeBallet,
    ShoeTypeBoot,
    ShoeTypeFlipFlopSandals
};

@interface Shoes : NSObject <NSCoding>

@property (strong, nonatomic) NSString *brand;
@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic, readonly) NSString *uuid;
@property (nonatomic) int size;
@property (nonatomic) ShoeType type;
@property (nonatomic, getter=isWorn) BOOL worn;

- (instancetype)initWithBrand:(NSString*)brand color:(NSString*)color size:(int)size andType:(ShoeType)type;

- (void)wear;
- (void)unWear;

@end
