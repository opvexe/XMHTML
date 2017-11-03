//
//  EXGoodsCarActionDelegate.h
//  ExperimentApp
//
//  Created by GDBank on 2017/11/3.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EXGoodsCarActionDelegate <NSObject>
@optional

/**
 * Cell上Button点击事件

 @param tableViewCell tableViewCell description
 @param index index description
 */
-(void)goodsCarTableView:(EX_BaseTbaleViewCell *)tableViewCell selectIndex:(NSUInteger)index;

@end
