//
//  DemoListTableViewController.m
//  PDCKit
//
//  Created by KH on 16/6/2.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "DemoListTableViewController.h"
#import "KeyControllerModel.h"

@interface DemoListTableViewController ()
@property (strong, nonatomic) NSArray<NSDictionary *> *keyControllerModels;
@end

@implementation DemoListTableViewController
-(void )viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Demo List";
}

-(NSArray<NSDictionary *> *)keyControllerModels
{
    if (_keyControllerModels == nil)
    {
        _keyControllerModels = [KeyControllerModel keyControllerModels];
    }
    return _keyControllerModels;
}

-(NSInteger )numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.keyControllerModels.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.font = [UIFont systemFontOfSize:13.0f];
    cell.textLabel.text = self.keyControllerModels[indexPath.row][@"name"];
    return cell;
}

-(void )tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = self.keyControllerModels[indexPath.row];
    NSString *string = dict[@"controller"];
    if (string == nil)
    {
        return;
    }
    [self.navigationController pushViewController:[NSClassFromString(string) new] animated:YES];
}
@end
