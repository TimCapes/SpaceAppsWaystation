//
//  SAWAppDelegate.m
//  Space Apps: Waystation
//
//  Created by Tim Capes on 2013-04-20.
//  Copyright (c) 2013 SpaceApps. All rights reserved.
//

#import "SAWAppDelegate.h"
#import "SAWWaystationViewController.h"
#import "LeftController.h"
#import "RightController.h"

@implementation SAWAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]autorelease];
    
    // Override point for customization after application launch.
    SAWWaystationViewController *mainController = [[[SAWWaystationViewController alloc] initWithNibName:@"SAWWaystationViewController" bundle:nil] autorelease];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainController];
    navController.navigationBar.hidden = YES;
    
    DDMenuController *rootController = [[DDMenuController alloc] initWithRootViewController:navController];
    mainController.root = rootController;
    _menuController = rootController;
    
    LeftController *leftController = [[LeftController alloc] init];
    leftController.root = rootController;
    rootController.leftViewController = leftController;
    
    RightController *rightController = [[RightController alloc] init];
    rightController.root = rootController;
    rootController.rightViewController = rightController;
    
    self.window.rootViewController = rootController;
    [[UIApplication sharedApplication] setStatusBarHidden:YES animated:NO];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    return YES;
//    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
//    // Override point for customization after application launch.
//
//    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainController];
//    navController.navigationBar.hidden = YES;
//    [[UIApplication sharedApplication] setStatusBarHidden:YES animated:NO];
//    //self.window.backgroundColor = [UIColor whiteColor];
//    self.window.rootViewController = mainController;
//    [self.window makeKeyAndVisible];
//    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
