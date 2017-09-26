//
//  ViewController.m
//  Shoes
//
//  Created by Ludovic Ollagnier on 26/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *demoLabel;

- (IBAction)showHelloWorld:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [myButton setTitle:@"Code button" forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    myButton.frame = CGRectMake(50, 50, 100, 20);
    [self.view addSubview:myButton];

    [myButton addTarget:self action:@selector(showCodeLabel) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showCodeLabel {

    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(200, 50, 200, 30)];
    lbl.text = @"Mon label code";

    [self.view addSubview:lbl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showHelloWorld:(UIButton *)sender {
    self.demoLabel.text = @"Hello";
}

@end
