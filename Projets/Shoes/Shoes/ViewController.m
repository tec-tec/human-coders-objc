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
    self.brandLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.brandLabel.text = @"Brand";

    [self.view addSubview:self.brandLabel];

    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.brandLabel attribute:NSLayoutAttributeTop multiplier:1 constant:16];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.brandLabel attribute:NSLayoutAttributeLeading multiplier:1 constant:8];
    [self.brandLabel addConstraints:@[top, leading]];

    self.sizeLabel = [[UILabel alloc] init];
    self.sizeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.sizeLabel.text = @"Size";

    self.colorLabel = [[UILabel alloc] init];
    self.colorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.colorLabel.text = @"Color";

    self.brandTextField = [[UITextField alloc] init];
    self.brandLabel.translatesAutoresizingMaskIntoConstraints = NO;


    self.colorTextField = [[UITextField alloc] init];
    self.colorTextField.translatesAutoresizingMaskIntoConstraints = NO;

    self.demoSlider = [[UISlider alloc] init];
    self.demoSlider.translatesAutoresizingMaskIntoConstraints = NO;

    self.demoSlider.minimumValue = 0;
    self.demoSlider.maximumValue = 10;

    [self.view addSubview:self.brandTextField];
    [self.view addSubview:self.sizeLabel];
    [self.view addSubview:self.colorLabel];
    [self.view addSubview:self.demoSlider];
    [self.view addSubview:self.colorTextField];

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
