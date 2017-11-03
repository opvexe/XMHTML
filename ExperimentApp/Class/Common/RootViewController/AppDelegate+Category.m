//
//  AppDelegate+Category.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "AppDelegate+Category.h"
#import "EX_TabBarController.h"
#import "MCWiFiManager.h"
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

-(void)getWifiBSSID{
    MCWiFiManager *wifiManager = [[MCWiFiManager alloc] init];
    [wifiManager scanNetworksWithCompletionHandler:^(NSArray<MCWiFi *> * _Nullable networks, MCWiFi * _Nullable currentWiFi, NSError * _Nullable error) {
        NSLog(@"name:%@\\mac:%@",currentWiFi.wifiName,currentWiFi.wifiBSSID);
    }];
    NSLog(@"网关：%@",[wifiManager getGatewayIpForCurrentWiFi]);
}

@end
