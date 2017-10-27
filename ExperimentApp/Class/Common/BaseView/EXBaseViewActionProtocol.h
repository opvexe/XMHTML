//
//  EXBaseViewActionProtocol.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/27.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EX_BaseModel;
@protocol EXBaseViewActionProtocol <NSObject>

-(void)didSelectViewAtType:(EXXBaseTableViewCellTouchType)type model:(EX_BaseModel *)model;
@end
