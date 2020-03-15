//
//  UIComponentsVC.m
//  ObjcProject
//
//  Created by Юрий Султанов on 24.02.2020.
//  Copyright © 2020 Yuriy Sultanov. All rights reserved.
//

#import "UIComponentsVC.h"

@interface UIComponentsVC ()

@end

@implementation UIComponentsVC

- (void) addUIView {
    CGRect redViewFrame = CGRectMake([UIScreen mainScreen].bounds.size.width / 4.f,
                                     [UIScreen mainScreen].bounds.size.height / 8.f,
                                     [UIScreen mainScreen].bounds.size.width / 2.f,
                                     [UIScreen mainScreen].bounds.size.height / 4.f );
    UIView *redView = [[UIView alloc] initWithFrame: redViewFrame];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview: redView];
}

- (void)addUILabel {
    CGRect labelFrame = CGRectMake(16.0,
                                   16.0,
                                   [UIScreen mainScreen].bounds.size.width - 32.0,
                                   80.0);
    UILabel *label = [[UILabel alloc] initWithFrame: labelFrame];
    label.font = [UIFont systemFontOfSize:24.0 weight:UIFontWeightHeavy];
    label.textColor = [UIColor darkGrayColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"Hello, I'm UIlabel";
    [self.view addSubview: label];
}

- (void)addUIButton {
    CGRect frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 80.0,
                              [UIScreen mainScreen].bounds.size.height/2 - 32.0,
                              150.0,
                              50.0);
    UIButton *button = [UIButton buttonWithType: UIButtonTypeSystem];
    [button setTitle:@"Push anotherVC" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    button.tintColor = [UIColor whiteColor];
    button.frame = frame;
    
    [button addTarget:self action:@selector(pushAnotherVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addUIView];
    [self addUILabel];
    [self addUIButton];
}

- (void)pushAnotherVC:(UIButton *)sender {
    UIViewController *anotherVC = [[UIViewController alloc] init];
    anotherVC.view.backgroundColor = [UIColor colorWithRed: random() %256 / 255.0f
                                                     green: random() %256 / 255.0f
                                                      blue: random() %256 / 255.0f
                                                     alpha:1.0];
    anotherVC.title = @"Colored VC";
    
    [self.navigationController pushViewController:anotherVC animated:YES];
}

@end
