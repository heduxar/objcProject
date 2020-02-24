//
//  ViewController.m
//  ObjcProject
//
//  Created by Юрий Султанов on 24.02.2020.
//  Copyright © 2020 Yuriy Sultanov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:(float)rand()
                                                green:(float)rand()
                                                 blue:(float)rand()
                                                alpha: 1.0];
}


@end
