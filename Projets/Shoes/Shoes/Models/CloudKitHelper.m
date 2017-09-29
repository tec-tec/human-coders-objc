//
//  CloudKitHelper.m
//  Shoes
//
//  Created by Ludovic Ollagnier on 29/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import "CloudKitHelper.h"
#import "Shoes.h"

@import CloudKit;

@implementation CloudKitHelper

- (void)cloudifyShoes:(Shoes*)s {

    CKContainer *defaultContainer = [CKContainer defaultContainer];
    CKDatabase *privateDb = [defaultContainer privateCloudDatabase];

    CKRecord *shoes = [[CKRecord alloc] initWithRecordType:@"Shoes"];
    shoes[@"brand"] = s.brand;
    shoes[@"color"] = s.color;
    shoes[@"uuid"] = s.uuid;

    shoes[@"size"] = @(s.size);
    shoes[@"type"] = @(s.type);
    shoes[@"worn"] = @(s.worn);

    [privateDb saveRecord:shoes completionHandler:^(CKRecord * _Nullable record, NSError * _Nullable error) {

        if (error) {
            NSLog(@"%@", error.localizedDescription);
        } else {
            NSLog(@"Object saved %@", record.recordType);
        }
    }];
}

@end
