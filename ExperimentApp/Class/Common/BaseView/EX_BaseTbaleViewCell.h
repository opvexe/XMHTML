//
//  EX_BaseCell.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/9.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EX_BaseTableViewCellProtocol.h"
#import "EX_BaseTableViewCellActionProtocol.h"
#import "EXTableViewCellButtonActionProtocol.h"

@interface EX_BaseTbaleViewCell : UITableViewCell<EX_BaseTableViewCellProtocol,EXTableViewCellButtonActionProtocol>
@property(nonatomic,weak)id<EX_BaseTableViewCellActionProtocol>delegate;
@property (nonatomic,weak) id <EXTableViewCellButtonActionProtocol>xg_delegate;
@end
