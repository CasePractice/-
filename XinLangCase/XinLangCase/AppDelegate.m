//
//  AppDelegate.m
//  XinLangCase
//
//  Created by mac on 16/5/11.
//  Copyright © 2016年 zhiYou. All rights reserved.
//

#import "AppDelegate.h"
#import "ShouYeController.h"
#import "XiaoXiController.h"
#import "GengDuoController.h"
#import "FaXianController.h"
#import "WoController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UIViewController alloc]init];
    [self.window makeKeyAndVisible];
    [self fengZhuangTabBar];
    
    
    return YES;
}

#pragma mark-封装TabBar
-(void)fengZhuangTabBar
{
    UITabBarController*tabBarCont=[UITabBarController new];
    ShouYeController*shouYe=[ShouYeController new];
    //首页Item
    shouYe.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"tabbar_home@2x"] selectedImage:[UIImage imageNamed:@"tabbar_home_selected@2x"]];
    //消息Item
    XiaoXiController*xiaoXi=[XiaoXiController new];
    xiaoXi.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"消息" image:[UIImage imageNamed:@"tabbar_message_center@2x"] selectedImage:[UIImage imageNamed:@"tabbar_message_center_selected@2x"]];
    //更多（中间的“+”）Item
    GengDuoController*gengDuo=[GengDuoController new];
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    UIImage*image=[UIImage imageNamed:@"tabbar_compose_button@2x"];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted@2x"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(gengDuoAnNiuDianJiShiJian) forControlEvents:UIControlEventTouchUpInside];
    button.frame=CGRectMake(0, 0, image.size.width, image.size.height);
    button.center=tabBarCont.tabBar.center;
    [tabBarCont.view addSubview:button];
    gengDuo.tabBarItem=[[UITabBarItem alloc]initWithTitle:nil image:nil selectedImage:nil];
    //发现Item
    FaXianController*faXian=[FaXianController new];
    faXian.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"tabbar_discover@2x"] selectedImage:[UIImage imageNamed:@"tabbar_discover_selected@2x"]];
    //我Item
    WoController*wo=[WoController new];
    wo.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"我" image:[UIImage imageNamed:@"tabbar_profile@2x"] selectedImage:[UIImage imageNamed:@"tabbar_profile_highlighted@2x"]];
    
    
    tabBarCont.viewControllers=@[shouYe,xiaoXi,gengDuo,faXian,wo];
    //设置所有Item的颜色
    tabBarCont.tabBar.tintColor=[UIColor colorWithRed:252.0/255.0 green:110.0/255.0 blue:10.0/255.0 alpha:1];
    tabBarCont.selectedIndex=3;
    self.window.rootViewController=tabBarCont;
}
-(void)gengDuoAnNiuDianJiShiJian
{
    NSLog(@"加号");
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
