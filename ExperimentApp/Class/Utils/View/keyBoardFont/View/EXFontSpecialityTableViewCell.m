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
@property(nonatomic,strong)NSDictionary *settings;
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
        
        self.settings = [NSDictionary dictionary];
    }
    return self;
}
/**
 Description
 */
-(void)EX_initConfingViews{
    self.bold = [UIButton buttonWithType:UIButtonTypeCustom]; //{top, left, bottom, right
    self.bold.contentMode = UIViewContentModeScaleAspectFill;
    [self.bold setImage:[UIImage imageNamed:@"b_icon"] forState:UIControlStateNormal];
    [self.bold setImage:[UIImage imageNamed:@"b_select_icon"] forState:UIControlStateSelected];
    [self.bold addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.bold];
    self.italic = [UIButton buttonWithType:UIButtonTypeCustom];
    self.italic.contentMode = UIViewContentModeScaleAspectFill;
    [self.italic setImage:[UIImage imageNamed:@"i_icon"] forState:UIControlStateNormal];
    [self.italic setImage:[UIImage imageNamed:@"i_select_icon"] forState:UIControlStateSelected];
    [self.italic addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.italic];
    self.underline = [UIButton buttonWithType:UIButtonTypeCustom];
    self.underline.contentMode = UIViewContentModeScaleAspectFill;
    [self.underline setImage:[UIImage imageNamed:@"under_icon"] forState:UIControlStateNormal];
    [self.underline setImage:[UIImage imageNamed:@"under_select_icon"] forState:UIControlStateSelected];
    [self.underline addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.underline];
    NSArray *temple = @[self.bold,self.italic,self.underline];
    CGFloat width = SCREEN_WIDTH/temple.count;
    [temple enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setTag:100 +idx];
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.left.mas_equalTo(width/2+width*idx);
            make.width.mas_equalTo(15);
            make.height.mas_equalTo(Number(15));
        }];
    }];
}
/**
 Description

 @param sender sender description
 */
-(void)dothings:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender == self.bold){
        self.settings = @{ EXStyleSettingsBoldName: @(self.isBold) };
    } else if (sender == self.italic) {
        self.settings = @{ EXStyleSettingsItalicName: @(self.isItalic) };
    } else if (sender == self.underline) {
        self.settings = @{ EXStyleSettingsUnderlineName: @(self.isUnderline) };
    }
    [self.xm_delegate xm_didChangeStyleSettings:self.settings];
}

-(void)setIsBold:(BOOL)isBold{
    self.bold.selected = isBold;
}

-(BOOL)isBold{
    return self.bold.selected;
}

-(void)setIsItalic:(BOOL)isItalic{
    self.italic.selected = isItalic;
}

-(BOOL)isItalic{
    return self.italic.selected;
}

-(void)setIsUnderline:(BOOL)isUnderline{
    self.underline.selected = isUnderline;
}

-(BOOL)isUnderline{
    return self.underline.selected;
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
//    self.list.contentEdgeInsets = UIEdgeInsetsMake(18, 25, 18, 25);
    self.list.contentMode = UIViewContentModeScaleAspectFill;
    [self.list setImage:[UIImage imageNamed:@"list_icon"] forState:UIControlStateNormal];
    [self.list setImage:[UIImage imageNamed:@"list_select_icon"] forState:UIControlStateSelected];
    [self.list addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.list];
    self.ows = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.ows.contentEdgeInsets = UIEdgeInsetsMake(18, 25, 18, 25);
    self.ows.contentMode = UIViewContentModeScaleAspectFill;
    [self.ows setImage:[UIImage imageNamed:@"123_icon"] forState:UIControlStateNormal];
    [self.ows setImage:[UIImage imageNamed:@"123_select_icon"] forState:UIControlStateSelected];
    [self.ows addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.ows];
    self.check = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.check.contentEdgeInsets = UIEdgeInsetsMake(18, 25, 18, 25);
    self.check.contentMode = UIViewContentModeScaleAspectFill;
    [self.check setImage:[UIImage imageNamed:@"check_icon"] forState:UIControlStateNormal];
    [self.check setImage:[UIImage imageNamed:@"check_select_icon"] forState:UIControlStateSelected];
    [self.check addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.check];
    self.left = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.left.contentEdgeInsets = UIEdgeInsetsMake(18, 25, 18, 25);
    self.left.contentMode = UIViewContentModeScaleAspectFill;
    [self.left setImage:[UIImage imageNamed:@"left_icon"] forState:UIControlStateNormal];
    [self.left setImage:[UIImage imageNamed:@"left_icon"] forState:UIControlStateSelected];
    [self.left addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.left];
    self.right = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.right.contentEdgeInsets = UIEdgeInsetsMake(18, 25, 18, 25);
    self.right.contentMode = UIViewContentModeScaleAspectFill;
    [self.right setImage:[UIImage imageNamed:@"right_icon"] forState:UIControlStateNormal];
    [self.right setImage:[UIImage imageNamed:@"right_icon"] forState:UIControlStateSelected];
    [self.right addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.right];
    NSArray *temple = @[self.list,self.ows,self.check,self.left,self.right];
    CGFloat width = SCREEN_WIDTH/temple.count;
    [temple enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.left.mas_equalTo(width/2 + width*idx);
            make.width.mas_equalTo(Number(15));
            make.height.mas_equalTo(Number(15));
        }];
    }];
}

/**
 Description
 
 @param sender sender description
 */
-(void)dothings:(UIButton *)sender{
    sender.selected = !sender.selected;
    
    if (sender == self.left) {
        [self.xm_delegate lm_paragraphChangeIndentWithDirection:LMStyleIndentDirectionLeft];
    }else if (sender == self.right) {
        [self.xm_delegate lm_paragraphChangeIndentWithDirection:LMStyleIndentDirectionRight];
    }else {
        __block NSInteger type = 0;
        NSArray *buttons = @[self.list, self.ows, self.check];
        [buttons enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL * _Nonnull stop) {
            if (sender == button) {
                button.selected = !button.selected;
                if (button.selected) {
                    type = [@[self.list, self.ows, self.check] indexOfObject:button] + 1;
                }
                else {
                    type = 0;
                }
            }
            else {
                button.selected = NO;
            }
        }];
        [self.xm_delegate lm_paragraphChangeType:type];
    }
}

- (void)setType:(NSInteger)type {
    self.list.selected = type == 1;
    self.ows.selected = type == 2;
    self.check.selected = type == 3;
}

- (NSInteger)type {
    if (self.list.selected) {
        return 1;
    }
    else if (self.ows.selected) {
        return 2;
    }
    else if (self.check.selected) {
        return 3;
    }
    return 0;
}

- (BOOL)isList {
    return self.list.selected;
}

- (BOOL)isNumberList {
    return self.ows.selected;
}

- (BOOL)isCheckBox {
    return self.check.selected;
}

@end


