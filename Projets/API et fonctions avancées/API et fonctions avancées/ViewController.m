//
//  ViewController.m
//  API et fonctions avancées
//
//  Created by Ludovic Ollagnier on 29/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import "ViewController.h"

@import LocalAuthentication;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)auth:(id)sender;
- (IBAction)network:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.imageView.alpha = 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)auth:(id)sender {

    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *demande = @"Demande";

    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:demande reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {

                dispatch_async(dispatch_get_main_queue(), ^{
                    self.view.backgroundColor = [UIColor greenColor];
                });

            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.view.backgroundColor = [UIColor redColor];
                });

            }
        }];
    }
}

- (IBAction)network:(id)sender {

    NSURLSession* session = [NSURLSession sharedSession];

    // Si pas de https -> Info.plist pour configurer App Transport Security
    NSURL * url = [NSURL URLWithString:@"https://images.apple.com/v/home/dk/images/tier-one-heroes/iphone-8/iphone_8_large.jpg"];
    NSURLSessionTask *t = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *img = [UIImage imageWithData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = img;

                [UIView animateWithDuration:5 animations:^{
                    self.imageView.alpha = 1;
                }];

            });

            // SI JSON

            NSError *parseError = nil;

            id parsedObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            NSLog(@"%@", error.localizedDescription);
        }
    }];

    [t resume];
}

@end
