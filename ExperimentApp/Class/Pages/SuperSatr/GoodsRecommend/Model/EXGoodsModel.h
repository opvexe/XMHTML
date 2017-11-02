//
//  EXGoodsModel.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/27.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXShopInfoModel.h"


/**
 * 商品
 */
typedef NS_ENUM(NSUInteger, TemplateGoodsCellType) {
    //商品介绍
    TemplateCellTypeGoodsIntroduceTableViewCell = 1,
    //商品店主
    TemplateCellTypeGoodsShopkeeperTableViewCell = 2,
    //商品选择
    TemplateCellTypeGoodsChoiceTableViewCell = 3,
};

@class StarModel;
@interface EXGoodsModel : EXShopModel

/**
 * 商品
 */
@property(nonatomic,assign) TemplateGoodsCellType goodsCellType;

/**
 Description
 */
@property (nonatomic,copy) NSString *videoCount;

/**
 Description
 */
@property (nonatomic,copy) NSString *following;

/**
 Description
 */
@property (nonatomic,copy) NSString *sortCondition;

/**
 Description
 */
@property (nonatomic,strong)StarModel *star;

@end

@interface StarModel : EX_BaseModel

/**
 Description
 */
@property (nonatomic,copy) NSString *ID;
/**
 Description
 */
@property (nonatomic,copy) NSString *name;

/**
 Description
 */
@property (nonatomic,copy) NSString *picUrl;

/**
 Description
 */
@property (nonatomic,copy) NSString *followed;

/**
 Description
 */
@property (nonatomic,copy) NSString *mark;
@end



