//
//  EX_ChannelModel.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *
 */
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


/**
 Description

 - InterfaceTypeNew: InterfaceTypeNew description
 - InterfaceTypeOld: InterfaceTypeOld description
 */
typedef NS_ENUM(NSUInteger, InterfaceType) {
    
    InterfaceTypeNew,
    
    InterfaceTypeOld,
};

@interface EX_ChannelModel : EX_BaseModel

/**
 模板类型
 */
@property(nonatomic, assign) TemplateCellType template_type;
/**
 * 频道ID
 */
@property(nonatomic,copy)NSString *channel_id;
/**
 * 内容ID
 */
@property(nonatomic,copy)NSString *content_id;

/**
 * 内容类型
 */
@property(nonatomic,copy)NSString *content_type;
/**
 * 内容名称
 */
@property(nonatomic,copy)NSString *content_name;

/**
 * 内容数据URL
 */
@property(nonatomic,copy)NSString *content_data_url;
/**
 * 内容版本
 */
@property (nonatomic,copy) NSString *ver;
/**
 子频道据源
 */
@property(nonatomic,strong)NSArray *datas;
/**
 频道描述
 */
@property(nonatomic,copy)NSString *channel_dec;

/**
 * 模板类型
 */
@property(nonatomic,copy)NSString *interface_type;

@property(nonatomic,assign)InterfaceType interfaceType;

@end
