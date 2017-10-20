//
//  EX_LeftTableViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/9.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_LeftTableViewCell.h"
@interface EX_LeftTableViewCell ()
@property(nonatomic, strong)UILabel *contentLabel;
@end
@implementation EX_LeftTableViewCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EX_LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EX_LeftTableViewCell class])];
    if (!cell) {
        cell = [[EX_LeftTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EX_LeftTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _contentLabel = [UILabel labelWithTitle:@"" color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] alignment:NSTextAlignmentLeft];
        [self.contentView addSubview:self.contentLabel];
        
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).mas_offset(SCREEN_WIDTH*0.3+50.0);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
        }];
        
    }
    return self;
}

-(void)InitDataViewModel:(EX_BaseModel *)model{
   
}



@end
