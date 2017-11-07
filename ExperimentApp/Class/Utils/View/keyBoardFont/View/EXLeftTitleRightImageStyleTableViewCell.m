//
//  EXFontSizeStyleTableViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/11/1.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXLeftTitleRightImageStyleTableViewCell.h"
#import "EXFontStyleModel.h"
#import "EXFontSizePickerView.h"
#import "EXColorPickerView.h"
#import "EXTitlePickerView.h"

@interface EXLeftTitleRightImageStyleTableViewCell ()<EXFontSizePickerViewDataSource,EXFontSizePickerViewDelegate,EXColorPickerViewDelegate,EXColorPickerViewDataSource>
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIImageView *unfoldImageView;
@property(nonatomic,strong)UIImageView *rightImageView;
@property(nonatomic,strong)UILabel *rightLabel;
@property(nonatomic,strong)CAShapeLayer *lineDashLayer;
@property(nonatomic,strong)EXFontSizePickerView *fontSizePickView;  //字体大小PickView
@property(nonatomic,strong)EXColorPickerView *colorPickerView;    //颜色PickerView
@property(nonatomic,strong)EXTitlePickerView *titlePickerView;   //普通标题
@end
@implementation EXLeftTitleRightImageStyleTableViewCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXLeftTitleRightImageStyleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXLeftTitleRightImageStyleTableViewCell class])];
    if (!cell) {
        cell = [[EXLeftTitleRightImageStyleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXLeftTitleRightImageStyleTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)EX_initConfingViews{
    self.titleLabel = [UILabel labelWithTitle:@"字号" color:HSYColorD8D8D8 font:FontPingFangSC(15.0) alignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.titleLabel];
    self.unfoldImageView = [UIImageView new];
    self.unfoldImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.unfoldImageView];
    self.rightImageView = [UIImageView new];
    self.rightImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.rightImageView.hidden = YES;
    [self.contentView addSubview:self.rightImageView];
    self.rightLabel = [UILabel labelWithTitle:@"普通" color:HSYColorD8D8D8 font:FontPingFangSC(15.0) alignment:NSTextAlignmentLeft];
    self.rightLabel.hidden = YES;
    [self.contentView addSubview:self.rightLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Number(10));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    [self.unfoldImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Number(10));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.unfoldImageView.mas_left).mas_offset(-Number(10.0));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.unfoldImageView.mas_left).mas_offset(-Number(10.0));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
}

/**
 Description
 
 @param model model description
 */
-(void)InitDataWithModel:(EXFontStyleModel *)model{
    self.titleLabel.text = model.title;
    self.unfoldImageView.image = [UIImage imageNamed:model.unfoldImage];
    if (model.rightTitle) {
        self.rightLabel.hidden = NO;
        self.rightLabel.text = model.rightTitle;
    }
    if (model.rightImage) {
        self.rightImageView.hidden = NO;
        self.rightImageView.image = [UIImage imageNamed:model.rightImage];
    }
}


/**
 Description
 
 @return return value description
 */
-(CAShapeLayer *)lineDashLayer{
    if (!_lineDashLayer) {
        _lineDashLayer = [CAShapeLayer layer];
        _lineDashLayer.fillColor = [UIColor clearColor].CGColor;
        _lineDashLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        _lineDashLayer.lineJoin = kCALineJoinRound;
        _lineDashLayer.lineDashPattern = @[@5, @2];
        _lineDashLayer.lineWidth = 1.f;
        [self.contentView.layer addSublayer:_lineDashLayer];
    }
    return _lineDashLayer;
}


/**
 * 重写setSelected方法
 
 @param selected selected description
 @param animated animated description
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    _lineDashLayer.hidden = !selected;
    
    self.colorPickerView.hidden = !selected;
    self.fontSizePickView.hidden = !selected;
    self.titlePickerView.hidden = !selected;
}


/**
 Description
 
 @param rect rect description
 */
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (!self.selected) {return;}
    
    CGRect layerFrame = rect;
    layerFrame.origin.x = 20.f;
    layerFrame.origin.y = 60.f;
    layerFrame.size.width -= 20.f * 2;
    layerFrame.size.height = 1.f;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0.5f)];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(layerFrame), 0.5f)];
    _lineDashLayer.path = path.CGPath;
    _lineDashLayer.frame = layerFrame;
}

#pragma mark pickView

-(EXFontSizePickerView *)fontSizePickView{
    if (!_fontSizePickView) {
        _fontSizePickView = [[EXFontSizePickerView alloc]init];
        _fontSizePickView.dataSource = self;
        _fontSizePickView.delegate = self;
    }
    return _fontSizePickView;
}

-(EXColorPickerView *)colorPickerView{
    if (!_colorPickerView) {
        _colorPickerView = [[EXColorPickerView alloc]init];
        _colorPickerView.dataSource = self;
        _colorPickerView.delegate = self;
    }
    return _colorPickerView;
}

-(EXTitlePickerView *)titlePickerView{
    if (!_titlePickerView) {
        _titlePickerView = [[EXTitlePickerView alloc]initWithFrame:CGRectZero withTitleItems:@[@"普通",@"小标题",@"中标题",@"大标题"] spacingBetweenEdge:Number(20)];
    }
    return _titlePickerView;
}

#pragma mark <EXFontSizePickerViewDataSource,EXFontSizePickerViewDelegate>



@end

