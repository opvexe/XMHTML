//
//  EXStyleColorsCell.m
//  ExperimentApp
//
//  Created by Facebook on 2017/11/7.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXStyleColorsCell.h"
#import "EXColorPickerView.h"
#import "EXFontStyleModel.h"

@interface EXStyleColorsCell ()<EXColorPickerViewDelegate,EXColorPickerViewDataSource>
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIImageView *unfoldImageView;
@property(nonatomic,strong)UIImageView *rightImageView;
@property(nonatomic,strong)UILabel *rightLabel;
@property(nonatomic,strong)CAShapeLayer *lineDashLayer;
@property(nonatomic,copy)NSArray<UIColor *> *colors;
@property(nonatomic,strong)EXColorPickerView *colorPickerView;    //颜色PickerView
@end
@implementation EXStyleColorsCell
+(id)CellWithTableView:(UITableView *)tableView{
    
    EXStyleColorsCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXStyleColorsCell class])];
    if (!cell) {
        cell = [[EXStyleColorsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXStyleColorsCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _colors = @[
                    [UIColor blackColor],
                    [UIColor colorWithRed:10/255.f green:41/255.f blue:147/255.f alpha:1],
                    [UIColor colorWithRed:218/255.f green:101/255.f blue:320/255.f alpha:1],
                    [UIColor colorWithRed:135/255.f green:135/255.f blue:135/255.f alpha:1],
                    [UIColor colorWithRed:101/255.f green:152/255.f blue:201/255.f alpha:1],
                    [UIColor colorWithRed:240/255.f green:200/255.f blue:50/255.f alpha:1],
                    [UIColor colorWithRed:103/255.f green:18/255.f blue:124/255.f alpha:1],
                    [UIColor colorWithRed:27/255.f green:131/255.f blue:79/255.f alpha:1],
                    [UIColor colorWithRed:207/255.f green:7/255.f blue:29/255.f alpha:1],
                    [UIColor colorWithRed:163/255.f green:125/255.f blue:207/255.f alpha:1],
                    [UIColor colorWithRed:164/255.f green:195/255.f blue:108/255.f alpha:1],
                    [UIColor colorWithRed:244/255.f green:169/255.f blue:135/255.f alpha:1],
                    ];
        
        [self.contentView.layer addSublayer:self.lineDashLayer];
        [self.contentView addSubview:self.colorPickerView];
        [self.colorPickerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView).mas_offset(Number(60.0));
            make.left.right.bottom.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

-(void)EX_initConfingViews{
    self.titleLabel = [UILabel labelWithTitle:@"字号" color:BaseContenTextColor font:FontPingFangSC(15.0) alignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.titleLabel];
    self.unfoldImageView = [UIImageView new];
    self.unfoldImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.unfoldImageView];
    self.rightImageView = [UIImageView new];
    self.rightImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.rightImageView.hidden = YES;
    [self.contentView addSubview:self.rightImageView];
    self.rightLabel = [UILabel labelWithTitle:@"普通" color:BaseContenTextColor font:FontPingFangSC(15.0) alignment:NSTextAlignmentLeft];
    self.rightLabel.hidden = YES;
    [self.contentView addSubview:self.rightLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Number(10));
        make.top.mas_equalTo(self.contentView).mas_offset(Number(10.0));
    }];
    [self.unfoldImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Number(10));
        make.top.mas_equalTo(self.titleLabel.mas_top);
    }];
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.unfoldImageView.mas_left).mas_offset(-Number(10.0));
        make.top.mas_equalTo(self.titleLabel.mas_top);
    }];
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.unfoldImageView.mas_left).mas_offset(-Number(10.0));
        make.top.mas_equalTo(self.titleLabel.mas_top);
    }];
}

-(void)InitDataWithModel:(EXFontStyleModel *)model{
    self.titleLabel.text = model.title;
    self.unfoldImageView.image = [UIImage imageNamed:model.unfoldImage];
    if (model.rightTitle) {
        self.rightLabel.hidden = NO;
        self.rightLabel.text = model.rightTitle;
    }
    if (model.rightImage) {
        self.rightImageView.hidden = NO;
        self.rightImageView.backgroundColor = model.rightImage;
    }
}

-(CAShapeLayer *)lineDashLayer{
    if (!_lineDashLayer) {
        _lineDashLayer = [CAShapeLayer layer];
        _lineDashLayer.fillColor = [UIColor clearColor].CGColor;
        _lineDashLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        _lineDashLayer.lineJoin = kCALineJoinRound;
        _lineDashLayer.lineDashPattern = @[@5, @2];
        _lineDashLayer.lineWidth = 1.f;
    }
    return _lineDashLayer;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    _lineDashLayer.hidden = !selected;
    self.colorPickerView.hidden = !selected;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (!self.selected) {return;}
    
    CGRect layerFrame = rect;
    layerFrame.origin.x = Number(20.0f);
    layerFrame.origin.y = Number(60.0f);
    layerFrame.size.width -= Number(20.0f) * 2;
    layerFrame.size.height = Number(1.0f);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0.5f)];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(layerFrame), 0.5f)];
    _lineDashLayer.path = path.CGPath;
    _lineDashLayer.frame = layerFrame;
}

-(EXColorPickerView *)colorPickerView{
    if (!_colorPickerView) {
        _colorPickerView = [[EXColorPickerView alloc]initWithFrame:CGRectZero];
        _colorPickerView.dataSource = self;
        _colorPickerView.delegate = self;
        _colorPickerView.hidden = YES;
    }
    return _colorPickerView;
}

#pragma mark <EXColorPickerViewDataSource>

-(void)setColors:(NSArray<UIColor *> *)colors{
    _colors = [colors copy];
    [self.colorPickerView reloadData];
}
- (NSInteger)numberOfColorsInColorPickerView:(EXColorPickerView *)pickerView{
    return self.colors.count;
}
- (UIColor *)colorPickerView:(EXColorPickerView *)pickerView colorForItemAtIndex:(NSInteger)index{
    return self.colors[index];
}
- (void)colorPickerView:(EXColorPickerView *)pickerView didSelectColor:(UIColor *)color{
    self.rightImageView.backgroundColor = color;
    [self.xm_delegate xm_didChangeStyleSettings:@{EXStyleSettingsTextColorName: color}];
}

- (void)colorPickerView:(EXColorPickerView *)pickerView didSelectIndex:(NSInteger)index {
    NSLog(@"选中颜色下标:%ld",index);
}



@end
