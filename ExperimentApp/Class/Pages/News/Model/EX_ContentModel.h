//
//  EX_ContentModel.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/23.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_SubChannelModel.h"

@interface EX_ContentModel : EX_SubChannelModel

/**
 * 代理活动ID
 */
@property(nonatomic,copy)NSString *actRepresentId;
/**
 * 活动ID
 */
@property(nonatomic,copy)NSString *activityId;
/**
 * brandID
 */
@property(nonatomic,copy)NSString *brandId;
/**
 * brandName
 */
@property(nonatomic,copy)NSString *brandName;
/**
 * brand描述
 */
@property(nonatomic,copy)NSString *brandDesc;
/**
 * brandLogo
 */
@property(nonatomic,copy)NSString *brandLogo;
/**
 * representFee
 */
@property(nonatomic,copy)NSString *representFee;
/**
 * ended
 */
@property(nonatomic,copy)NSString *ended;
/**
 * startDate
 */
@property(nonatomic,assign)CGFloat startDate;
/**
 * endDate
 */
@property(nonatomic,assign)CGFloat endDate;
/**
 * actimg活动图片
 */
@property(nonatomic,copy)NSString *actimg;
/**
 * actimg活动图片
 */
@property(nonatomic,copy)NSString *pic;
/**
 *actname
 */
@property(nonatomic,copy)NSString *actname;
/**
 *ttl
 */
@property(nonatomic,copy)NSString *ttl;
/**
 *participantCount
 */
@property(nonatomic,copy)NSString *participantCount;
/**
 *participantVideosCount
 */
@property(nonatomic,copy)NSString *participantVideosCount;
@end
