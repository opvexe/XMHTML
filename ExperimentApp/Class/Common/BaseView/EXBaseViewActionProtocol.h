//
//  EXBaseViewActionProtocol.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/27.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EX_BaseModel;
@class EX_BaseCollectionViewCell;
@class EX_BaseTbaleViewCell;
@protocol EXBaseViewActionProtocol <NSObject>


/**
 * Shop点击对应的Model

 @param type type description
 @param model model description
 */
-(void)didSelectViewAtType:(EXXBaseTableViewCellTouchType)type model:(EX_BaseModel *)model;

/**
 * TableView上Button点击事件
 
 @param tableViewCell tableViewCell description
 @param index index description
 */
-(void)XM_ClickButtonTableViewCell:(EX_BaseTbaleViewCell *)tableViewCell selectIndex:(NSUInteger)index;

/**
 * CollectionView上Button点击事件

 @param CollectionViewCell CollectionViewCell description
 @param index index description
 */
-(void)XM_ClickButtonCollectionViewCell:(EX_BaseCollectionViewCell *)CollectionViewCell selectIndex:(NSUInteger)index;
@end
