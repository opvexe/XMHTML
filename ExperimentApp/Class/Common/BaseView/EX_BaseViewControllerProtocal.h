//
//  EX_BaseViewControllerProtocal.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EX_BaseViewControllerProtocal <NSObject>

/**
 获取数据源
 */
-(void)EX_GetDataSoucre;

/**
 添加视图
 */
-(void)EX_AddSubviews;
/**
 *  初始视图
 */
- (void)EX_initConfingViews;
/**
 *  配置数据
 */
- (void)EX_SetupViewModel;

@end
