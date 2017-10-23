//
//  EX_SubChannelModel.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/23.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_ChannelModel.h"

@interface EX_SubChannelModel : EX_ChannelModel

/**
 * 用途类型
 */
@property(nonatomic,copy)NSString *MIME;
/**
 * 数据ID
 */
@property(nonatomic,copy)NSString *idata_id;
/**
 * 频道名称
 */
@property(nonatomic,copy)NSString *channel_name;
/**
 * 频道名称
 */
@property(nonatomic,copy)NSString *ID;
/**
 * 频道icon_url
 */
@property(nonatomic,copy)NSString *icon_url;

@end
