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
UIColor *color;
int PINGMU_KUAN;
int PINGMU_GAO;
@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark-首方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UIViewController alloc]init];
    PINGMU_KUAN=[[UIScreen mainScreen] bounds].size.width;
    PINGMU_GAO=[[UIScreen mainScreen] bounds].size.height;
    color=[UIColor colorWithRed:252.0/255.0 green:110.0/255.0 blue:10.0/255.0 alpha:1];
    [self.window makeKeyAndVisible];
    [self fengZhuangTabBar];
    
    
    return YES;
}

#pragma mark-封装TabBar
-(void)fengZhuangTabBar
{
    
    UITabBarController*tabBarCont=[UITabBarController new];
    //设置所有Item的字体颜色
    UITabBarItem*allItem=[UITabBarItem appearance];
    NSMutableDictionary*titleTextDict=[NSMutableDictionary dictionary];
    titleTextDict[NSForegroundColorAttributeName]=color;
    [allItem setTitleTextAttributes:titleTextDict forState:UIControlStateSelected];
    //首页Item
    ShouYeController*shouYe=[ShouYeController new];
    UIImage *shouYe_Image=[UIImage imageNamed:@"tabbar_home@2x"];
    UIImage *shouYe_Image_Selectde=[UIImage imageNamed:@"tabbar_home_selected@2x"];
    shouYe_Image=[shouYe_Image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    shouYe_Image_Selectde=[shouYe_Image_Selectde imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    shouYe.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"首页" image:shouYe_Image selectedImage:shouYe_Image_Selectde];
    //消息Item
    XiaoXiController*xiaoXi=[XiaoXiController new];
    UIImage *xiaoXi_Image=[UIImage imageNamed:@"tabbar_message_center@2x"];
    UIImage *xiaoXi_Image_Selectde=[UIImage imageNamed:@"tabbar_message_center_selected@2x"];
    xiaoXi_Image=[xiaoXi_Image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    xiaoXi_Image_Selectde=[xiaoXi_Image_Selectde imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    xiaoXi.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"消息" image:xiaoXi_Image selectedImage:xiaoXi_Image_Selectde];
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
    UIImage *faXian_Image=[UIImage imageNamed:@"tabbar_discover@2x"];
    UIImage *faXian_Image_Selectde=[UIImage imageNamed:@"tabbar_discover_selected@2x"];
    faXian_Image=[faXian_Image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    faXian_Image_Selectde=[faXian_Image_Selectde imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    faXian.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"发现" image:faXian_Image selectedImage:faXian_Image_Selectde];
    //我Item
    WoController*wo=[WoController new];
    UIImage *wo_Image=[UIImage imageNamed:@"tabbar_profile@2x"];
    UIImage *wo_Image_Selectde=[UIImage imageNamed:@"tabbar_profile_highlighted@2x"];
    wo_Image=[wo_Image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    wo_Image_Selectde=[wo_Image_Selectde imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    wo.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"我" image:wo_Image selectedImage:wo_Image_Selectde];
    
    tabBarCont.viewControllers=@[shouYe,xiaoXi,gengDuo,faXian,wo];
    tabBarCont.selectedIndex=3;
    self.window.rootViewController=tabBarCont;
}
#pragma mark-更多按钮的点击事件
-(void)gengDuoAnNiuDianJiShiJian
{
//    GengDuoController*gengDuo=[GengDuoController new];
    
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
