//
//  EX_PracticeCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/9.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_PracticeCell.h"

@interface EX_PracticeCell ()
@property(nonatomic, strong)UIButton *foldButton;   //折叠
@property(nonatomic, strong)UILabel  *headerLabel;  //标题
@property(nonatomic, strong)UILabel  *pageLabel;    //分页
@property(nonatomic, strong)UIButton *practiceButton; //练习按钮
@property(nonatomic, strong)UIView   *progressView; //进度
@end
@implementation EX_PracticeCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EX_PracticeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EX_PracticeCell class])];
    if (!cell) {
        cell = [[EX_PracticeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EX_PracticeCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _foldButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_foldButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        _foldButton.backgroundColor = [UIColor brownColor];
        _foldButton.tag = 100;
        [_foldButton addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
        _headerLabel = [UILabel SinglelabelWithTitle:@"第一篇：桥梁工程原材料,构件等" color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] alignment:NSTextAlignmentLeft];
        _pageLabel   = [UILabel SinglelabelWithTitle:@"0/33" color:[UIColor lightGrayColor] font:[UIFont systemFontOfSize:12.0] alignment:NSTextAlignmentRight];
        _practiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_practiceButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        _practiceButton.tag =101;
         [_practiceButton addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
        _practiceButton.backgroundColor = [UIColor brownColor];
        _progressView = [[UIView alloc]init];
        _progressView.backgroundColor =[UIColor colorWithRed:237/255.0 green: 237/255.0 blue:237/255.0 alpha:.5];
        
        [self.contentView addSubview:self.foldButton];
        [self.contentView addSubview:self.headerLabel];
        [self.contentView addSubview:self.pageLabel];
        [self.contentView addSubview:self.practiceButton];
        [self.contentView addSubview:self.progressView];
        
        [_foldButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10.0);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.width.and.height.mas_equalTo(20.0);
        }];
        
        [_headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10.0);
            make.left.mas_equalTo(self.foldButton.mas_right).mas_offset(20.0);
            make.width.mas_equalTo(200.0);
        }];
        
        [_pageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.headerLabel.mas_centerY);
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10.0);
        }];
        
        [_practiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10.0);
            make.top.mas_equalTo(self.pageLabel.mas_bottom).mas_offset(10.0);
            make.width.and.height.mas_equalTo(20.0);
        }];
        
        [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headerLabel.mas_left);
            make.centerY.mas_equalTo(self.practiceButton.mas_centerY);
            make.height.mas_equalTo(5.0);
            make.width.mas_equalTo(220.0);
        }];

    }
    return self;
}

-(void)dothings:(UIButton *)sender{
    NSLog(@"%ld",sender.tag);
}

- (void)setFrame:(CGRect)frame{
    
    frame.origin.x = 10.0;
    frame.size.width -= 10.0 * 2;
    
    frame.origin.y += 10.0;
    frame.size.height -= 10.0;
    
    [super setFrame:frame];
}

@end

