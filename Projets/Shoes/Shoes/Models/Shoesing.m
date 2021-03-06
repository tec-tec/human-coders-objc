//
//  Shoesing.m
//  Shoes
//
//  Created by Ludovic Ollagnier on 26/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import "Shoesing.h"
#import "Shoes.h"
#import "CloudKitHelper.h"

@interface Shoesing ()

@property (strong, nonatomic) NSArray<Shoes *> *shoesArray;
@property (strong, nonatomic) CloudKitHelper *cloudHelper;

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
    [self.cloudHelper whiteShoes];
    return [self.shoesArray copy];
}

- (void)addShoes:(Shoes *)s {
    self.shoesArray = [self.shoesArray arrayByAddingObject:s];

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"modelUpdated" object:self userInfo:nil];

    [self save];
    [self.cloudHelper cloudifyShoes:s];
}

- (void)removeShoes:(Shoes *)s {
    NSMutableArray<Shoes*> *mutCopy = self.shoesArray.mutableCopy;
    [mutCopy removeObject:s];
    self.shoesArray = [NSArray arrayWithArray:mutCopy];

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"modelUpdated" object:self userInfo:nil];

    [self save];
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

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.shoesArray forKey:@"shoesArray"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.shoesArray = [aDecoder decodeObjectForKey:@"shoesArray"];
    }
    return  self;
}

- (void)save {

    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    NSURL *archiveURL = [[Shoesing documentDirectoryURL] URLByAppendingPathComponent:@"archivedShoesing.plist"];

    [data writeToURL:archiveURL atomically:YES];
}

+ (Shoesing *)shoesingFromArchive {

    NSURL *archiveURL = [[self documentDirectoryURL] URLByAppendingPathComponent:@"archivedShoesing.plist"];

    NSData *data = [NSData dataWithContentsOfURL:archiveURL];

    Shoesing *s = [NSKeyedUnarchiver unarchiveObjectWithData:data];

    if ([s isKindOfClass:[Shoesing class]]) {
        return s;
    }

    return [[Shoesing alloc] init];
}

+ (NSURL *)documentDirectoryURL {

    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *urls = [fm URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];

    return [urls firstObject];
}

-(CloudKitHelper *)cloudHelper {

    if (_cloudHelper == nil) {
        _cloudHelper = [[CloudKitHelper alloc] init];
    }
    return  _cloudHelper;
}
@end
