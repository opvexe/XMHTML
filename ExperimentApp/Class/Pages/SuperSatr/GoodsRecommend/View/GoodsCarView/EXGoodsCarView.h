//
//  EXGoodsCarView.h
//  ExperimentApp
//
//  Created by GDBank on 2017/11/3.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_BaseView.h"

@class EXGoodsCarView;
@protocol EXGoodsCarViewDelegate <NSObject>

@optional

/**
 * 点击响应事件

 @param carView carView description
 @param index index description
 */
-(void)goodsCarView:(EXGoodsCarView *)carView selectIndex:(NSUInteger)index;
@end
@interface EXGoodsCarView : EX_BaseView

@property (nonatomic,weak) id <EXGoodsCarViewDelegate> xm_delegate;
@end
