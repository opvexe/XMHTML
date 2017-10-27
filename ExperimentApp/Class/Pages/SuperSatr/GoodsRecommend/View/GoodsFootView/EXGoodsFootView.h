//
//  EXGoodsFootView.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/27.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_BaseView.h"

typedef NS_ENUM(NSUInteger, GoodsFootType) {
    //咨询 购买
    GoodsFootTypeAll = 1,
    // 咨询，购物车
    GoodsFootTypeNone = 2
};
@interface EXGoodsFootView : EX_BaseView

@end
