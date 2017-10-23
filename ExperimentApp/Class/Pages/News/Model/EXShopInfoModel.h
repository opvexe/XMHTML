//
//  EXVideoModel.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EX_ChannelModel.h"

@interface EXShopInfoModel : EX_ChannelModel

@property(nonatomic, copy)NSString *MIME;
@property(nonatomic, copy)NSString *pic;
@property(nonatomic, copy)NSString *url;
@property(nonatomic, copy)NSString *picurl;
@property(nonatomic, copy)NSString *brandLogo;
@property(nonatomic, copy)NSString *actimg;
@property(nonatomic, copy)NSString *icon_url;
@property(nonatomic, copy)NSString *picUrl;
@property(nonatomic, copy)NSString *destination;
@property(nonatomic,assign)CJXBaseTableViewCellTouchType TouchType ;


@end
