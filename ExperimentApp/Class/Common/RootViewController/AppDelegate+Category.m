//
//  AppDelegate+Category.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "AppDelegate+Category.h"
#import "EX_TabBarController.h"

@implementation AppDelegate (Category)

/**
 *  初始化主控制器
 */
-(void)initRootViewController{
    UIWindow *window                            = [[UIApplication sharedApplication].delegate window];
    EX_TabBarController *tabbarController = [[EX_TabBarController alloc]init];
    window.rootViewController                   = tabbarController;
    [window makeKeyAndVisible];
}
@end
