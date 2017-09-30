//
//  EX_BaseTableViewCellProtocol.h
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EX_BaseModel;
@protocol EX_BaseTableViewCellProtocol <NSObject>

/**
 *  初始视图
 */
- (void)EX_initConfingViews;
/**
 *  配置数据
 */
- (void)EX_SetupViewModel;
/**
 初始化数据
 */
-(void)InitDataViewModel:(EX_BaseModel*)model;
@end
