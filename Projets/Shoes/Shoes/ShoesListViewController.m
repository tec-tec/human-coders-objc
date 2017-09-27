//
//  ShoesListViewController.m
//  Shoes
//
//  Created by Ludovic Ollagnier on 27/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import "ShoesListViewController.h"
#import "Shoes.h"
#import "Shoesing.h"

@interface ShoesListViewController ()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray<Shoes*> *shoes;

@end

@implementation ShoesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.shoes = [[Shoesing demoShoeshing] allShoes];
    [self makeUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeUI {

    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = self.view.frame;
    self.tableView.dataSource = self;

//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"maCell"];

    [self.view addSubview:self.tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shoes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"maCell"];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"maCell"];
    }

    Shoes *currentShoes = self.shoes[indexPath.row];

    cell.textLabel.text = currentShoes.brand;
    cell.detailTextLabel.text = currentShoes.color;

    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
