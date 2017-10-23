//
//  EX_BaseCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/9.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_BaseTbaleViewCell.h"

@implementation EX_BaseTbaleViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self EX_initConfingViews];
        [self EX_SetupViewModel];
    }
    return  self ;
}


-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self EX_initConfingViews];
    [self EX_SetupViewModel];
 
}

/**
 初始视图
 */
-(void)EX_initConfingViews{
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}


/**
 配置数据
 */
-(void)EX_SetupViewModel{
    
}

/**
 *  配置信号数据
 */
-(void)EX_ConfigSignalDataSoucre{
    
}


/**
  数据模型赋值
 */
-(void)InitDataViewModel:(EX_BaseModel *)model{
    
}

+(id)CellWithTableView:(UITableView *)tableview{
    
    return nil;
};

+(CGFloat)getCellHeight:(EX_BaseModel *)model{
    
    return 0;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}
@end
