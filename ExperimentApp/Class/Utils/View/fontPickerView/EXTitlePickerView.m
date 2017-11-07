//
//  EXHeadTitlePickerView.m
//  ExperimentApp
//
//  Created by GDBank on 2017/11/2.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXTitlePickerView.h"

@interface EXTitlePickerView ()
@property (nonatomic,strong) NSArray *items;
@property (nonatomic,assign) CGFloat space;
@end
@implementation EXTitlePickerView


-(instancetype)initWithFrame:(CGRect)frame withTitleItems:(NSArray *)items spacingBetweenEdge:(CGFloat)space{
    self = [super initWithFrame:frame];
    if (self) {
        _items = [NSArray arrayWithArray:items];
        _space = space;
        [self initWithSubviews];
    }
    return self;
}

/**
 * 初始化
 */
-(void)initWithSubviews{
    self.backgroundColor = [UIColor whiteColor];
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:_items.count];
    for (int i = 0; i< _items.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [btn.titleLabel setFont:FontPingFangLG(14.0)];
        [btn setTitle:_items[i] forState:UIControlStateNormal];
        [btn setTitle:_items[i] forState:UIControlStateSelected];
        [btn setTitleColor:TitleColor forState:UIControlStateNormal];
        [btn setTitleColor:BaseContenTextColor forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [temp addObject:btn];
    }
    CGFloat width = (SCREEN_WIDTH - _space*2)/temp.count;
    [temp enumerateObjectsUsingBlock:^(UIButton  *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setTag:100 +idx];
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_centerY);
            make.left.mas_equalTo(_space+width*idx);
            make.width.mas_equalTo(width);
        }];
    }];
}


/**
 Description

 @param sender sender description
 */
-(void)dothings:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender.titleLabel setFont:FontPingFangLG(18)];
    }else{
         [sender.titleLabel setFont:FontPingFangLG(14.0)];
    }
}

@end
