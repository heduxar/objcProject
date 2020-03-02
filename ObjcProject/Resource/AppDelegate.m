//
//  AppDelegate.m
//  ObjcProject
//
//  Created by Юрий Султанов on 24.02.2020.
//  Copyright © 2020 Yuriy Sultanov. All rights reserved.
//

#import "AppDelegate.h"
#import "UIComponentsVC.h"
#import "TableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if (!self.window){
        self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    }
    TableViewController *table = [[TableViewController alloc] init];
    table.title = @"TableViewController";
    
//    UIComponentsVC *componetsViewController = [[UIComponentsVC alloc] init];
//    componetsViewController.view.backgroundColor = [UIColor whiteColor];
//    componetsViewController.title = @"Components";
//    UIViewController *mainViewController = [[UIViewController alloc] init];
//    mainViewController.view.backgroundColor = [UIColor redColor];
    
    UINavigationController *mainNavController = [[UINavigationController alloc] initWithRootViewController:table];
    mainNavController.navigationBar.translucent = NO;
    
    
    self.window.rootViewController = mainNavController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application { }


- (void)applicationDidEnterBackground:(UIApplication *)application { }


- (void)applicationWillEnterForeground:(UIApplication *)application { }


- (void)applicationDidBecomeActive:(UIApplication *)application { }


- (void)applicationWillTerminate:(UIApplication *)application { }


@end
