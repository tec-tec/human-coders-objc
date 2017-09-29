//
//  LocationViewController.m
//  API et fonctions avancées
//
//  Created by Ludovic Ollagnier on 29/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import "LocationViewController.h"
@import CoreLocation;

@interface LocationViewController () <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *manager;

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.manager = [[CLLocationManager alloc] init];
    self.manager.delegate = self;

    [self.manager requestWhenInUseAuthorization];

    [self.manager setDesiredAccuracy:kCLLocationAccuracyBest];

    [self.manager requestLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"%@", locations);

    CLLocation *last = [locations lastObject];

    CLGeocoder *geo = [[CLGeocoder alloc] init];
    [geo reverseGeocodeLocation:last completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        NSLog(@"%@", placemarks);
    }];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {

}

@end
