//
//  AppDelegate.m
//  EveryDo
//
//  Created by Katrina de Guzman on 2017-06-14.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import "AppDelegate.h"
#import "ToDo.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
{
    NSMutableArray* _tasks;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _tasks = [NSMutableArray arrayWithCapacity:20];
    
    ToDo *task = [[ToDo alloc] init];
    task.toDoName = @"Get ready";
    task.toDoDescription = @"Wake up, eat breakfast, dilly-dally,take a shower. ";
    task.isCompleted = YES;
    [_tasks addObject:task];
    
    task = [[ToDo alloc] init];
    task.toDoName = @"Go to school";
    task.toDoDescription = @"Get on the skytrain, get off at blah blah, walk walk walk walk walk walk";
    task.isCompleted = YES;
    [_tasks addObject:task];
    
    task = [[ToDo alloc] init];
    task.toDoName = @"School";
    task.toDoDescription = @"work work work eat work work work eat work work work work ";
    task.isCompleted = NO;
    [_tasks addObject:task];
    
    UINavigationController *navigationController = (UINavigationController*)self.window.rootViewController;
    ViewController *toDoViewController = [navigationController viewControllers][0];
    toDoViewController.tasks = _tasks;
    
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application{}
- (void)applicationDidEnterBackground:(UIApplication *)application{}
- (void)applicationWillEnterForeground:(UIApplication *)application{}
- (void)applicationDidBecomeActive:(UIApplication *)application{}
- (void)applicationWillTerminate:(UIApplication *)application{}


@end
