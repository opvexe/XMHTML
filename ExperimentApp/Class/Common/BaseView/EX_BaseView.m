//
//  EX_BaseView.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_BaseView.h"

@implementation EX_BaseView

-(instancetype)init{
    
    if (self = [super init]) {
        
        [self EX_initConfingViews];
        [self EX_AddSubviews];
    }
    return  self;
    
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self EX_initConfingViews];
    [self EX_AddSubviews];
    
}

/**
 添加视图
 */
-(void)EX_AddSubviews{
    
}

/**
 初始化视图
 */
- (void)EX_initConfingViews{
    
}

- (void)EX_SetupViewModel{
    
}
-(void)EX_GetDataSoucre{
    
}
-(void)InitDataWithModel:(EX_BaseModel*)model{
    
}
-(void)dealloc{
    
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
}
@end
