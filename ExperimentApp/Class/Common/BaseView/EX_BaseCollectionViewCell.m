//
//  EX_BaseCollectionViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/23.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_BaseCollectionViewCell.h"

@implementation EX_BaseCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
        [self EX_initConfingViews];
        [self EX_SetupViewModel];
        [self EX_ConfigSignalDataSoucre];
        
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self EX_initConfingViews];
    [self EX_SetupViewModel];
    [self EX_ConfigSignalDataSoucre];
}


/**
 *  初始视图
 */
- (void)EX_initConfingViews{
    
}
/**
 *  配置数据
 */
- (void)EX_SetupViewModel{
    
}

/**
 配置信号数据
 */
-(void)EX_ConfigSignalDataSoucre{
    
}
/**
 初始化数据
 */
-(void)InitDataViewModel:(EX_BaseModel*)model{
    
}
/**
 配置重用CellTableView
 */
+ (id)CellWithTableView:(UITableView *)tableview{
       return nil;
}
/**
 配置Cell高度
 */
+(CGFloat)getCellHeight:(EX_BaseModel *)model{
    
    return 0;
}
@end
