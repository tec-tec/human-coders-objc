//
//  ViewController.m
//  Shoes
//
//  Created by Ludovic Ollagnier on 26/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import "ViewController.h"
#import "Shoes.h"
#import "Shoesing.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *demoLabel;

- (IBAction)showHelloWorld:(UIButton *)sender;

@property (strong, nonatomic) UILabel *brandLabel;
@property (strong, nonatomic) UILabel *sizeLabel;
@property (strong, nonatomic) UILabel *colorLabel;
@property (strong, nonatomic) UITextField *brandTextField;
@property (strong, nonatomic) UITextField *colorTextField;
@property (strong, nonatomic) UISlider *demoSlider;

@property (strong, nonatomic) Shoesing *shoesing;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self makeUI];
}

- (void)makeUI {

    self.brandLabel = [[UILabel alloc] init];
    self.brandLabel.frame = CGRectMake(16, 80, 100, 30);
    self.brandLabel.text = @"Brand";

    self.sizeLabel = [[UILabel alloc] init];
    self.sizeLabel.frame = CGRectMake(16, 150, 100, 30);
    self.sizeLabel.text = @"Size";

    self.colorLabel = [[UILabel alloc] init];
    self.colorLabel.frame = CGRectMake(16, 200, 100, 30);
    self.colorLabel.text = @"Color";

    self.brandTextField = [[UITextField alloc] init];
    self.brandTextField.frame = CGRectMake(120, 80, 100, 30);

    self.colorTextField = [[UITextField alloc] init];
    self.colorTextField.frame = CGRectMake(120, 200, 100, 30);

    self.demoSlider = [[UISlider alloc] init];
    self.demoSlider.frame = CGRectMake(16, 250, 200, 20);
    self.demoSlider.minimumValue = 0;
    self.demoSlider.maximumValue = 10;

    [self.view addSubview:self.brandTextField];
    [self.view addSubview:self.sizeLabel];
    [self.view addSubview:self.colorLabel];
    [self.view addSubview:self.brandLabel];
    [self.view addSubview:self.demoSlider];
    [self.view addSubview:self.colorTextField];

    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    saveButton.frame = CGRectMake(16, 300, 100, 20);
    [self.view addSubview:saveButton];

    [saveButton addTarget:self action:@selector(saveForm) forControlEvents:UIControlEventTouchUpInside];
}

- (void)saveForm {

    //Perform a save from the form data

    Shoes *myShoes = [[Shoes alloc] initWithBrand:self.brandTextField.text color:self.colorTextField.text size:self.demoSlider.value andType:ShoeTypeSport];

    [self.shoesing addShoes:myShoes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showHelloWorld:(UIButton *)sender {
    self.demoLabel.text = @"Hello";
}

//Surcharge du getter pour lazy instanciation
- (Shoesing *)shoesing {
    if (_shoesing == nil) {
        _shoesing = [[Shoesing alloc] init];
    }
    return _shoesing;
}

@end
