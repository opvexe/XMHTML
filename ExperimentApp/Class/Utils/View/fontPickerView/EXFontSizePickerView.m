//
//  EXPopupView.m
//  ExperimentApp
//
//  Created by GDBank on 2017/11/1.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXFontSizePickerView.h"

@interface EXFontSizePickerView () <UIScrollViewDelegate>

@end
@implementation EXFontSizePickerView
{
    UIScrollView *_scrollView;
    NSMutableArray *_itemViews;
    CAGradientLayer *_maskLayer;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initWithSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initWithSubviews];
    }
    return self;
}


/**
 * 初始化视图
 */
-(void)initWithSubviews{
    self.backgroundColor = [UIColor whiteColor];
    
    _normalFont = [UIFont systemFontOfSize:13.f];
    _selectedFont = [UIFont boldSystemFontOfSize:21.f];
    _normalTextColor = [UIColor grayColor];
    _selectedTextColor = [UIColor blackColor];
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
    ///设置字体渐变颜色
    _maskLayer = [CAGradientLayer layer];
    _maskLayer.colors = @[
                          (__bridge id)[UIColor clearColor].CGColor,
                          (__bridge id)[UIColor blackColor].CGColor,
                          (__bridge id)[UIColor blackColor].CGColor,
                          (__bridge id)[UIColor blackColor].CGColor,
                          (__bridge id)[UIColor clearColor].CGColor
                          ];
    _maskLayer.locations = @[@0, @0.25, @0.5, @0.75, @1];
    _maskLayer.startPoint = CGPointMake(0, 0);
    _maskLayer.endPoint = CGPointMake(1, 0);
    self.layer.mask = _maskLayer;
    ///添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:tap];
    
    _itemViews = [NSMutableArray array];
    _selectedIndex = -1;
}


/**
 * 点击手势

 @param tap tap description
 */
- (void)handleTap:(UITapGestureRecognizer *)tap {
    CGPoint point = [tap locationInView:_scrollView];
    for (NSInteger index = 0; index < _itemViews.count; index++) {
        UILabel *label = _itemViews[index];
        if (CGRectContainsPoint(label.frame, point)) {
            if (index != _selectedIndex && [self.delegate respondsToSelector:@selector(pickerView:didSelectIndex:)]) {
                [self selectIndex:index animated:YES];
                [self.delegate pickerView:self didSelectIndex:index];
            }else {
                [self selectIndex:index animated:YES];
            }
            break;
        }
    }
}


/**
 * 点击执行的动画

 @param index index description
 @param animated animated description
 */
- (void)selectIndex:(NSInteger)index animated:(BOOL)animated {
    
    if (_selectedIndex >= 0 && _selectedIndex < _itemViews.count) {
        UILabel *lastSelectedLabel = _itemViews[_selectedIndex];
        lastSelectedLabel.textColor = self.normalTextColor;
        lastSelectedLabel.font = self.normalFont;
    }
    
    _selectedIndex = index;
    UILabel *selectedLabel = _itemViews[index];
    selectedLabel.textColor = self.selectedTextColor;
    selectedLabel.font = self.selectedFont;
    [_scrollView setContentOffset:CGPointMake(selectedLabel.center.x - CGRectGetWidth(self.bounds) / 2, 0) animated:animated];
}

#pragma mark <UIScrollViewDelegate>
/**
 * 停止滚动，字体变大

 @param scrollView scrollView description
 */
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    CGPoint centerLocation = CGPointZero;
    centerLocation.x = _scrollView.contentOffset.x + CGRectGetWidth(self.bounds) / 2;
    
    for (NSInteger index = 0; index < _itemViews.count; index++) {
        UILabel *label = _itemViews[index];
        if ((index == 0 && centerLocation.x < CGRectGetMinX(label.frame)) ||
            (index == _itemViews.count - 1 && centerLocation.x > CGRectGetMaxX(label.frame)) ||
            CGRectContainsPoint(label.frame, centerLocation)) {
            if (index != _selectedIndex && [self.delegate respondsToSelector:@selector(pickerView:didSelectIndex:)]) {
                [self selectIndex:index animated:YES];
                [self.delegate pickerView:self didSelectIndex:index];
            }
            else {
                [self selectIndex:index animated:YES];
            }
            break;
        }
    }
}

#pragma mark  set 方法

/**
 * 获取字体类型个数

 @return return value description
 */
- (NSInteger)numberOfItems {
    return [self.dataSource numberOfItemsInPickerView:self];
}


/**
 * 刷新界面
 */
- (void)reloadData{
    
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    rect.origin = CGPointZero;
    rect.size.width = self.itemWidth == 0 ? CGRectGetWidth(rect) / 5 : self.itemWidth;
    for (NSInteger index = 0; index < _itemViews.count; index++) {
        UIView *subview = _itemViews[index];
        if (index == 0) {
            rect.origin.x -= CGRectGetWidth(rect) / 2;
        }
        subview.frame = rect;
        rect.origin.x += CGRectGetWidth(rect);
        if (index == _itemViews.count - 1) {
            rect.origin.x -= CGRectGetWidth(rect) / 2;
        }
    }
    CGFloat width = CGRectGetWidth(self.frame);
    _scrollView.contentSize = CGSizeMake(rect.origin.x, rect.size.height);
    _scrollView.contentInset = UIEdgeInsetsMake(0, width/2, 0, width/2);
    _scrollView.frame = self.bounds;
    _maskLayer.frame = self.bounds;
    
    if (_selectedIndex == -1 || _selectedIndex >= _itemViews.count) {
        [self selectIndex:0 animated:NO];
    }else {
        NSInteger index = _selectedIndex;
        _selectedIndex = -1;
        [self selectIndex:index animated:NO];
    }
}



@end
