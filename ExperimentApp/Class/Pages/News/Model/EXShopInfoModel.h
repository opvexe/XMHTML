//
//  EXVideoModel.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EX_BaseTableViewCellProtocol.h"
#import "EX_ContentModel.h"

@interface EXShopInfoModel : EX_BaseModel

/**
 *
 */
@property(nonatomic,copy)NSString *ID;
/**
 *
 */
@property(nonatomic,copy)NSString *name;

/**
 *
 */
@property(nonatomic,copy)NSString *hotline;

/**
 *
 */
@property(nonatomic,copy)NSString *userId;
/**
 *
 */
@property(nonatomic,copy)NSString *role;
/**
 *
 */
@property(nonatomic,copy)NSString *mark;
/**
 *
 */
@property(nonatomic,copy)NSString *picurl;
@end


@interface LogoModel : EX_BaseModel

/**
 * imageType
 */
@property(nonatomic,copy)NSString *imageType;
/**
 *
 */
@property(nonatomic,copy)NSString *ID;

/**
 *
 */
@property(nonatomic,copy)NSString *name;

/**
 *
 */
@property(nonatomic,copy)NSString *size;
/**
 *
 */
@property(nonatomic,copy)NSString *path;
/**
 *
 */
@property(nonatomic,copy)NSString *url;
/**
 *
 */
@property(nonatomic,copy)NSString *status;
/**
 *
 */
@property(nonatomic,copy)NSString *createTime;

@end


@interface EXVideoModel : EX_BaseModel

/**
  play url
 */
@property(nonatomic,copy)NSString *src_1;
@end


@interface EXShopModel : EX_ContentModel

/**
 * 内容类型
 */
@property(nonatomic,copy)NSString *content_data_type;
/**
 * shop
 */
@property(nonatomic,strong)EXShopInfoModel *shop;
/**
 * no
 */
@property(nonatomic,copy)NSString *no;
/**
 * name
 */
@property(nonatomic,copy)NSString *name;
/**
 *createTime
 */
@property(nonatomic,copy)NSString *createTime;
/**
 * updateTime
 */
@property(nonatomic,copy)NSString *updateTime;
/**
 * logo
 */
@property(nonatomic,strong)LogoModel *logo;
/**
 * categoryCode
 */
@property(nonatomic,copy)NSString *categoryCode;

/**
 * intro
 */
@property(nonatomic,copy)NSString *intro;

/**
 * postage
 */
@property(nonatomic,copy)NSString *postage;
/**
 * oldPrice
 */
@property(nonatomic,copy)NSString *oldPrice;

/**
 * price
 */
@property(nonatomic,copy)NSString *price;
/**
 * sales
 */
@property(nonatomic,copy)NSString *sales;
/**
 * status
 */
@property(nonatomic,copy)NSString *status;
/**
 * stockAmount
 */
@property(nonatomic,copy)NSString *stockAmount;
/**
 * tags
 */
@property(nonatomic,copy)NSString *tags;
/**
 * profit
 */
@property(nonatomic,copy)NSString *profit;
/**
 * brand_id
 */
@property(nonatomic,copy)NSString *brand_id;
/**
 * activity_id
 */
@property(nonatomic,copy)NSString *activity_id;
/**
 * activity_logo
 */
@property(nonatomic,copy)NSString *activity_logo;
/**
 * favores
 */
@property(nonatomic,copy)NSString *favores;
/**
 * shopId
 */
@property(nonatomic,copy)NSString *shopId;
/**
 * logoId
 */
@property(nonatomic,copy)NSString *logoId;
/**
 * userId
 */
@property(nonatomic,copy)NSString *userId;
/**
 * shopName
 */
@property(nonatomic,copy)NSString *shopName;
/**
 * spects
 */
@property(nonatomic,strong)NSArray *spects;
/**
 * videoPlayUrl
 */
@property(nonatomic,strong)EXVideoModel *videoPlayUrl;
/**
 * funs
 */
@property(nonatomic,copy)NSString *funs;
/**
 * user_id
 */
@property(nonatomic,copy)NSString *user_id;
/**
 * nickname
 */
@property(nonatomic,copy)NSString *nickname;

/**
 * pic_url
 */
@property(nonatomic,copy)NSString *pic_url;
/**
 * followed
 */
@property(nonatomic,assign)BOOL  followed;
/**
 * mark
 */
@property(nonatomic,copy)NSString *mark;

/**
 * isFollowd
 */
@property(nonatomic,assign)BOOL  isFollowd;
/**
 * title
 */
@property(nonatomic,copy)NSString *  title;
/**
 * note
 */
@property(nonatomic,copy)NSString *  note;

/**
 * videoitemid
 */
@property(nonatomic,copy)NSString *  videoitemid;
/**
 * picurl
 */
@property(nonatomic,copy)NSString *  picurl;

/**
 * picUrl
 */
@property(nonatomic,copy)NSString *  picUrl;

/**
 * playcount
 */
@property(nonatomic,copy)NSString *  playcount;
/**
 * likecount
 */
@property(nonatomic,copy)NSString *  likecount;

/**
 * isFollowd
 */
@property(nonatomic,assign)BOOL  isFollowed;
/**
 * likecount
 */
@property(nonatomic,copy)NSString *  idata_name;
/**
 * likecount
 */
@property(nonatomic,copy)NSString *  notecount;
/**
 * url
 */
@property(nonatomic,copy)NSString *  url;
/**
 * url
 */
@property(nonatomic,copy)NSString *  btn_name;

/**
 Description
 */
@property(nonatomic,assign) EXXBaseTableViewCellTouchType TouchType ;

/**
 Description
 */
@property(nonatomic,strong)NSArray *records;

/**
 Description
 */
@property(nonatomic,strong)EXShopModel *goods;
/**
 是否显示最右间距
 */
@property(nonatomic,assign)BOOL isShowRightMargin;

/**
 destination 类型
 */
@property(nonatomic,copy)NSString *  destination;
/***/

/**
 destination 类型
 */
@property(nonatomic,copy)NSString * agent_user;
/***/
/**
 destination 类型
 */
@property(nonatomic,copy)NSString *  related_id;

@end
