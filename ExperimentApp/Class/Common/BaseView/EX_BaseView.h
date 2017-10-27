//
//  EX_BaseView.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EX_BaseViewProtocol.h"
#import "EXBaseViewActionProtocol.h"

@interface EX_BaseView : UIView<EX_BaseViewProtocol,EXBaseViewActionProtocol>
@property(nonatomic,weak)id<EXBaseViewActionProtocol>delegate;
@end
