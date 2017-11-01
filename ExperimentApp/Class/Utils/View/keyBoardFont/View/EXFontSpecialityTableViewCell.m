//
//  EXFontSpecialityTableViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/11/1.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXFontSpecialityTableViewCell.h"

@interface EXFontSpecialityTableViewCell ()
@property (nonatomic,strong) UIButton *bold;
@property (nonatomic,strong) UIButton *italic;
@property (nonatomic,strong) UIButton *underline;
@end

@implementation EXFontSpecialityTableViewCell
+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXFontSpecialityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXFontSpecialityTableViewCell class])];
    if (!cell) {
        cell = [[EXFontSpecialityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXFontSpecialityTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}


/**
 Description
 */
-(void)EX_initConfingViews{
    self.bold = [UIButton buttonWithType:UIButtonTypeCustom]; //{top, left, bottom, right
    self.bold.contentEdgeInsets = UIEdgeInsetsMake(22, 25, 22, 25);
    [self.bold setImage:[UIImage imageNamed:@"b_icon"] forState:UIControlStateNormal];
    [self.bold setImage:[UIImage imageNamed:@"b_select_icon"] forState:UIControlStateSelected];
    [self.bold addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.bold];
    self.italic = [UIButton buttonWithType:UIButtonTypeCustom];
    self.italic.contentEdgeInsets = UIEdgeInsetsMake(22, 25, 22, 25);
    [self.italic setImage:[UIImage imageNamed:@"i_icon"] forState:UIControlStateNormal];
    [self.italic setImage:[UIImage imageNamed:@"i_select_icon"] forState:UIControlStateSelected];
    [self.italic addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.italic];
    self.underline = [UIButton buttonWithType:UIButtonTypeCustom];
    self.underline.contentEdgeInsets = UIEdgeInsetsMake(22, 25, 22, 25);
    [self.underline setImage:[UIImage imageNamed:@"under_icon"] forState:UIControlStateNormal];
    [self.underline setImage:[UIImage imageNamed:@"under_select_icon"] forState:UIControlStateSelected];
    [self.underline addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.underline];
    NSArray *temple = @[self.bold,self.italic,self.underline];
    CGFloat width = SCREEN_WIDTH/temple.count;
    [temple enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setTag:100 +idx];
        [obj setFrame:CGRectMake(width*idx, 0,width, Number(60))];
    }];
}


/**
 Description

 @param sender sender description
 */
-(void)dothings:(UIButton *)sender{
    sender.selected = !sender.selected;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end


#pragma mark   --------- <EXFontSpaceTableViewCell> --------------

@interface EXFontSpaceTableViewCell ()
@property (nonatomic,strong) UIButton *list;
@property (nonatomic,strong) UIButton *ows;
@property (nonatomic,strong) UIButton *check;
@property (nonatomic,strong) UIButton *left;
@property (nonatomic,strong) UIButton *right;
@end
@implementation EXFontSpaceTableViewCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXFontSpaceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXFontSpaceTableViewCell class])];
    if (!cell) {
        cell = [[EXFontSpaceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXFontSpaceTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    }
    return self;
}

-(void)EX_initConfingViews{
    self.list = [UIButton buttonWithType:UIButtonTypeCustom];
    self.list.contentEdgeInsets = UIEdgeInsetsMake(18, 25, 18, 25);
    [self.list setImage:[UIImage imageNamed:@"list_icon"] forState:UIControlStateNormal];
    [self.list setImage:[UIImage imageNamed:@"list_select_icon"] forState:UIControlStateSelected];
    [self.list addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.list];
    self.ows = [UIButton buttonWithType:UIButtonTypeCustom];
    self.ows.contentEdgeInsets = UIEdgeInsetsMake(18, 25, 18, 25);
    [self.ows setImage:[UIImage imageNamed:@"123_icon"] forState:UIControlStateNormal];
    [self.ows setImage:[UIImage imageNamed:@"123_select_icon"] forState:UIControlStateSelected];
    [self.ows addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.ows];
    self.check = [UIButton buttonWithType:UIButtonTypeCustom];
    self.check.contentEdgeInsets = UIEdgeInsetsMake(18, 25, 18, 25);
    [self.check setImage:[UIImage imageNamed:@"check_icon"] forState:UIControlStateNormal];
    [self.check setImage:[UIImage imageNamed:@"check_select_icon"] forState:UIControlStateSelected];
    [self.check addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.check];
    self.left = [UIButton buttonWithType:UIButtonTypeCustom];
    self.left.contentEdgeInsets = UIEdgeInsetsMake(18, 25, 18, 25);
    [self.left setImage:[UIImage imageNamed:@"left_icon"] forState:UIControlStateNormal];
    [self.left setImage:[UIImage imageNamed:@"left_icon"] forState:UIControlStateSelected];
    [self.left addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.left];
    self.right = [UIButton buttonWithType:UIButtonTypeCustom];
    self.right.contentEdgeInsets = UIEdgeInsetsMake(18, 25, 18, 25);
    [self.right setImage:[UIImage imageNamed:@"right_icon"] forState:UIControlStateNormal];
    [self.right setImage:[UIImage imageNamed:@"right_icon"] forState:UIControlStateSelected];
    [self.right addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.right];
    NSArray *temple = @[self.list,self.ows,self.check,self.left,self.right];
    CGFloat width = SCREEN_WIDTH/temple.count;
    [temple enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setTag:100 +idx];
        [obj setFrame:CGRectMake(width*idx, 0,width, Number(60))];
    }];
}

/**
 Description
 
 @param sender sender description
 */
-(void)dothings:(UIButton *)sender{
    sender.selected = !sender.selected;
}

@end


