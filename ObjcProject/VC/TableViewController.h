//
//  TableViewController.h
//  ObjcProject
//
//  Created by Юрий Султанов on 02.03.2020.
//  Copyright © 2020 Yuriy Sultanov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray * newsfeed;

@end

NS_ASSUME_NONNULL_END
