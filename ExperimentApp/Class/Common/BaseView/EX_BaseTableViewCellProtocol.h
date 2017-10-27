//
//  EX_BaseTableViewCellProtocol.h
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, EXXBaseTableViewCellTouchType) {
    /**
     商品
     */
    EXBaseTableViewCellTouchTypeGOOD = 100,
    /**
     视频
     */
    EXBaseTableViewCellTouchTypeVIDEO,
    /**
     代言活动
     */
    EXBaseTableViewCellTouchTypeACTIVITY,
    /**
     展示
     */
    EXBaseTableViewCellTouchTypeREPRESENT,
    /**
     
     */
    EXBaseTableViewCellTouchTypeARTIS,
    /**
     轮播
     */
    EXBaseTableViewCellTouchTypeBANNER,
    /**
     频道
     */
    EXBaseTableViewCellTouchTypeCHANNEL,
    /**
     更多
     */
    EXBaseTableViewCellTouchTypeEVENMORE,
    
};

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
 配置信号数据
 */
-(void)EX_ConfigSignalDataSoucre;
/**
 初始化数据
 */
-(void)InitDataWithModel:(EX_BaseModel*)model;
/**
 配置重用CellTableView
 */
+ (id)CellWithTableView:(UITableView *)tableview;
/**
 配置Cell高度
 */
+(CGFloat)getCellHeight:(EX_BaseModel *)model;
@end

