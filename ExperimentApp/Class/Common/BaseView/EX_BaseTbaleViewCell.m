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
        
    }
    return  self ;
}


-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self EX_initConfingViews];
 
}
-(void)EX_initConfingViews{
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}
-(void)EX_SetupViewModel{
    
}


-(void)InitDataViewModel:(EX_BaseModel *)model{
    
    
}

+(id)CellWithTableView:(UITableView *)tableview{
    
    return nil;
};

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}
+(CGFloat)getCellHeight:(EX_BaseModel *)model{
    
    return 0;
}
@end
