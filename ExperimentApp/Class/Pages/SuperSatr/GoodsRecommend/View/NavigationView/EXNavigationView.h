//
//  EXNavigationView.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/27.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_BaseView.h"

@interface EXNavigationView : EX_BaseView

@property(nonatomic, copy)void(^goodsNavBlock)(NSUInteger tag);
@end
