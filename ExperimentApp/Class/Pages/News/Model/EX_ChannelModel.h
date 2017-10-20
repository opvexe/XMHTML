//
//  EX_ChannelModel.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TemplateCellType) {
    
    //轮播Cell
    TemplateCellTypeShopingBanderTableViewCell =  0,
    
    //视频展示Cell
    TemplateCellTypeVideoShowTableViewCell = 1 << 0,
    
    //分类Cell
    TemplateCellTypeClassifiedTableViewCell = 1 << 1,
 
    //必买Cell
    TemplateCellTypeDailyWillBuyTableViewCell = 1 << 2,
    
    //推荐Cell
    TemplateCellTypeRecommendTableViewCell = 1 << 3,
 
    //单品Cell
    TemplateCellTypeThePoorTableViewCell = 1 << 4,
};

@interface EX_ChannelModel : EX_BaseModel

/**
 * 模板类型
 */
@property(nonatomic, assign) TemplateCellType *template_type;
@end
