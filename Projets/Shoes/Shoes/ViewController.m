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
#import "UIColor+MoreColors.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *demoLabel;

- (IBAction)showHelloWorld:(UIButton *)sender;

@property (strong, nonatomic) UILabel *brandLabel;
@property (strong, nonatomic) UILabel *sizeLabel;
@property (strong, nonatomic) UILabel *colorLabel;
@property (strong, nonatomic) UITextField *brandTextField;
@property (strong, nonatomic) UITextField *colorTextField;
@property (strong, nonatomic) UISlider *demoSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self makeUI];
}

- (void)makeUI {

    self.view.backgroundColor = [UIColor whiteColor];

    self.brandLabel = [[UILabel alloc] init];
    self.brandLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.brandLabel.text = @"Brand";

    [self.view addSubview:self.brandLabel];

    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.brandLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1 constant:16];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.brandLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeLeading multiplier:1 constant:8];
    [self.view addConstraints:@[top, leading]];

    self.sizeLabel = [[UILabel alloc] init];
    self.sizeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.sizeLabel.text = @"Size";
    [self.view addSubview:self.sizeLabel];

    [[self.sizeLabel.centerYAnchor constraintEqualToAnchor:self.brandLabel.centerYAnchor constant:0] setActive:YES];
    [[self.sizeLabel.leadingAnchor constraintEqualToAnchor:self.brandLabel.trailingAnchor constant:16] setActive:YES];

    self.colorLabel = [[UILabel alloc] init];
    self.colorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.colorLabel.text = @"Color";

    self.colorTextField = [[UITextField alloc] init];
    self.colorTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.colorTextField.backgroundColor = [UIColor redColor];

    [self.view addSubview:self.colorLabel];
    [self.view addSubview:self.colorTextField];

    NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-[label(100)]-[textField]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:@{@"label":self.colorLabel, @"textField":self.colorTextField}];
    NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[brand]-[label]" options:0 metrics:nil views:@{@"label":self.colorLabel, @"brand":self.brandLabel}];

    [self.view addConstraints:hConstraints];
    [self.view addConstraints:vConstraints];

    self.brandTextField = [[UITextField alloc] init];
    self.brandLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.brandTextField];
    [self.view addSubview:self.sizeLabel];


    self.demoSlider = [[UISlider alloc] init];
    self.demoSlider.translatesAutoresizingMaskIntoConstraints = NO;
    self.demoSlider.minimumValue = 0;
    self.demoSlider.maximumValue = 10;

    UILabel *sliderLabel = [[UILabel alloc] init];
    sliderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    sliderLabel.text = @"Pointure";

    UIStackView *demoStack = [[UIStackView alloc] initWithArrangedSubviews:@[sliderLabel, self.demoSlider]];
    demoStack.translatesAutoresizingMaskIntoConstraints = NO;
    demoStack.axis = UILayoutConstraintAxisHorizontal;
    demoStack.distribution = UIStackViewDistributionFill;
    demoStack.alignment = UIStackViewAlignmentCenter;
    demoStack.spacing = 8;

    [self.view addSubview:demoStack];

    [[demoStack.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:8]setActive:YES];
    [[demoStack.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:8]setActive:YES];
    [[demoStack.topAnchor constraintEqualToAnchor:self.colorLabel.bottomAnchor constant:8]setActive:YES];

    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    saveButton.translatesAutoresizingMaskIntoConstraints = NO;
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor pinkColor] forState:UIControlStateNormal];
    [self.view addSubview:saveButton];

    [saveButton addTarget:self action:@selector(saveForm) forControlEvents:UIControlEventTouchUpInside];
}

- (void)saveForm {

    //Perform a save from the form data

    //Check du formulaire

    if (self.brandTextField.text.length < 3) {
        [self showAlert];
        return;
    }

    Shoes *myShoes = [[Shoes alloc] initWithBrand:self.brandTextField.text color:self.colorTextField.text size:self.demoSlider.value andType:ShoeTypeSport];

    [self.shoesing addShoes:myShoes];

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)showAlert {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Formulaire incomplet" message:@"Votre formulaire présente des erreurs" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

    }];

    [alert addAction:ok];

    [self presentViewController:alert animated:YES completion:nil];
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
