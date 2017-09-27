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

    [self makeUI];
}

- (void)makeUI {

    UILabel *brandLabel = [[UILabel alloc] init];
    brandLabel.frame = CGRectMake(16, 80, 100, 30);
    brandLabel.text = @"Brand";

    UILabel *sizeLabel = [[UILabel alloc] init];
    sizeLabel.frame = CGRectMake(16, 150, 100, 30);
    sizeLabel.text = @"Size";

    UILabel *colorLabel = [[UILabel alloc] init];
    colorLabel.frame = CGRectMake(16, 200, 100, 30);
    colorLabel.text = @"Color";

    UITextField *brandTextField = [[UITextField alloc] init];
    brandTextField.frame = CGRectMake(120, 80, 100, 30);

    [self.view addSubview:brandTextField];
    [self.view addSubview:sizeLabel];
    [self.view addSubview:colorLabel];
    [self.view addSubview:brandLabel];

    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    saveButton.frame = CGRectMake(16, 250, 100, 20);
    [self.view addSubview:saveButton];

    [saveButton addTarget:self action:@selector(saveForm) forControlEvents:UIControlEventTouchUpInside];
}

- (void)saveForm {

    //Perform a save from the form data
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showHelloWorld:(UIButton *)sender {
    self.demoLabel.text = @"Hello";
}

@end
