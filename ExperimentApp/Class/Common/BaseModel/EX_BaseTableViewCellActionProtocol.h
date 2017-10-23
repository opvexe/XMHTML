//
//  EX_BaseTableViewCellActionProtocol.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/23.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EX_BaseModel;
@protocol EX_BaseTableViewCellActionProtocol <NSObject>
/**
 Description

 @param type type description
 @param model model description
 @param atSectionModel atSectionModel description
 */
-(void)didSelectItemAtType:(CJXBaseTableViewCellTouchType)type model:(EX_BaseModel *)model atSectionModel:(EX_BaseModel*) atSectionModel;
@end
