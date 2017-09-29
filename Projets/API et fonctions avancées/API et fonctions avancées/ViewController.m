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

- (IBAction)auth:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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

@end
