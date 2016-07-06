//
//  AppDelegate.m
//  RunningNote
//
//  Created by qingyun on 16/6/29.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "AppDelegate.h"
#import <AVOSCloud/AVOSCloud.h>
#import <AVUser.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [AVOSCloud setApplicationId:@"ffEtbcq1pwP43pIvnzUtKvg8-gzGzoHsz" clientKey:@"ADrWXda5eEhDEYTuhoCPfkEk"];
    
    UIViewController *rootVC;
    if ([AVUser currentUser] != nil) {
        //现实首页
        rootVC = [self getVCFromStoryBoardWithIdentifier:@""];
    }else {
        //注册登录
        rootVC = [self getVCFromStoryBoardWithIdentifier:@""];
    }
    return YES;
}

//根据id从storyBoard中获取控制器
-(UIViewController *)getVCFromStoryBoardWithIdentifier:(NSString *)identifier{
    
    if ([identifier isEqualToString:@""]) {
        _clientDelegate = [[AVIMClient alloc] initWithClientId:[AVUser currentUser].username];
    }
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"" bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:identifier];
}


-(void)showHomeVC{
    _window.rootViewController = [self getVCFromStoryBoardWithIdentifier:@""];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
