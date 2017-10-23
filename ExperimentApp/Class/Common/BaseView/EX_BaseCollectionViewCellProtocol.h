//
//  EX_BaseCollectionViewCellProtocol.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/23.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EX_BaseCollectionViewCellProtocol <NSObject>


/**
 *  初始视图
 */
- (void)EX_initConfingViews;
/**
 *  配置数据
 */
- (void)EX_SetupViewModel;

/**
 配置信号数据
 */
-(void)EX_ConfigSignalDataSoucre;
/**
 初始化数据
 */
-(void)InitDataViewModel:(EX_BaseModel*)model;
/**
 配置重用CellTableView
 */
+ (id)CellWithTableView:(UITableView *)tableview;
/**
 配置Cell高度
 */
+(CGFloat)getCellHeight:(EX_BaseModel *)model;
@end
