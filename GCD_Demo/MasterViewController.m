//
//  MasterViewController.m
//  GCD_Demo
//
//  Created by bdkj on 2018/1/2.
//  Copyright © 2018年 bdkj_wangguofeng. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

#import "VMProtocol.h"
#import "SemaphoreVM.h"
#import "GroupVM.h"

@interface MasterViewController ()

@property NSArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.objects = @[[SemaphoreVM new],
                     [GroupVM new],
                     ];

}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    id <VMProtocol> vm = self.objects[indexPath.row];
    cell.textLabel.text = [vm vmTitle];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    id <VMProtocol> vm = self.objects[indexPath.row];
    [vm testVM];
}

@end
