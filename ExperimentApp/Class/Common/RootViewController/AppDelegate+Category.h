//
//  AppDelegate+Category.h
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Category)

/**
 *  初始化主控制器
 */

-(void)initRootViewController;


/**
 * 获取wifi信息
 */
-(void)getWifiBSSID;
@end
