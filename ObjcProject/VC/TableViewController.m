//
//  TableViewController.m
//  ObjcProject
//
//  Created by Юрий Султанов on 02.03.2020.
//  Copyright © 2020 Yuriy Sultanov. All rights reserved.
//

#import "TableViewController.h"
#import "CustomCell.h"
#import "APIManager.h"
#import "News.h"
#import <SafariServices/SafariServices.h>

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak TableViewController *weakSelf = self;
    [[APIManager sharedInstance] newsForRequest:[NSString stringWithFormat:@"Objective C"] withComplition:^(NSMutableArray * _Nonnull newsArray) {
        if (newsArray.count > 0) {
            weakSelf.newsfeed = newsArray;
            [[weakSelf tableView] reloadData];
        }
    }];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.tableView.frame.size.width, 0.01)];
    
//    self.tableView.estimatedRowHeight = 300;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _newsfeed.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StandartCell"];
    if (!cell) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"StandartCell"];
    }
    [cell setNews:_newsfeed[indexPath.row]];
//    [cell setNeedsUpdateConstraints];
//    [cell updateConstraintsIfNeeded];
    
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 800.0;
//}
//
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 256;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"url: %@", [_newsfeed[indexPath.row] url]);
    NSURL *url = [[NSURL alloc] initWithString:[_newsfeed[indexPath.row] url]];
    SFSafariViewController *safari = [[SFSafariViewController alloc] initWithURL:url entersReaderIfAvailable:YES];
    [self presentViewController:safari animated:YES completion:nil];
//        SFSafariViewController *sfvc = [[SFSafariViewController alloc] initWithURL:[_newsfeed[indexPath.row] url] configuration:YES];
//        [self showViewController:sfvc sender:nil];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
