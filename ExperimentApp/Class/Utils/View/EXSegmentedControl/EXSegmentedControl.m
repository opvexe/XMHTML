//
//  EXSegmentedControl.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXSegmentedControl.h"

@implementation EXSegmentedControl
{
    NSMutableArray *_itemsView;
    UIView *_slideBlockView;
}
- (instancetype)initWithItems:(NSArray<UIImage *> *)items{
    
    self = [super init];
    if (self) {
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        _itemsView = [NSMutableArray arrayWithCapacity:items.count];
        for (UIImage *itemImage in items) {
            UIImageView *itemView = [[UIImageView alloc] initWithImage:itemImage];
            itemView.contentMode = UIViewContentModeScaleAspectFit;
            [self addSubview:itemView];
            [_itemsView addObject:itemView];
        }
        
        _slideBlockView = [[UIView alloc] init];
        _slideBlockView.backgroundColor = [UIColor darkGrayColor];
        [self addSubview:_slideBlockView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

- (NSInteger)numberOfSegments {
    return _itemsView.count;
}

- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex animated:(BOOL)animated {
    
    if (_selectedSegmentIndex == selectedSegmentIndex) {
        return;
    }
    
    _selectedSegmentIndex = selectedSegmentIndex;
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            [self layoutSubviews];
        }];
    }
    else {
        [self layoutSubviews];
    }
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    CGFloat itemWidth = CGRectGetWidth(rect) / self.numberOfSegments;
    CGFloat itemHeight = CGRectGetHeight(rect) - 4.f;
    rect.size = CGSizeMake(itemWidth, itemHeight);
    rect.origin.y = 1.f;
    
    for (UIView *itemView in _itemsView) {
        itemView.frame = CGRectInset(rect, itemWidth / 4, itemHeight / 4);
        rect.origin.x += itemWidth;
    }
    
    rect.size.width = itemWidth - 20.f;
    rect.size.height = 2.f;
    rect.origin.y = CGRectGetHeight(self.bounds) - 3.f;
    UIView *selectedItemView = _itemsView[self.selectedSegmentIndex];
    rect.origin.x = selectedItemView.center.x - CGRectGetWidth(rect) / 2;
    _slideBlockView.frame = rect;
}


-(void)handleTap:(UITapGestureRecognizer *)tap{
    CGPoint point = [tap locationInView:self];
    CGFloat itemWidth = CGRectGetWidth(self.bounds) / self.numberOfSegments;
    NSInteger index = point.x / itemWidth;
    if ([self.delegate respondsToSelector:@selector(ex_segmentedControl:didTapAtIndex:)]) {
        [self.delegate ex_segmentedControl:self didTapAtIndex:index];
    }
    if (!self.changeSegmentManually) {
        [self setSelectedSegmentIndex:index animated:YES];
    }
}


/**
 绘制底部线条

 @param rect rect description
 */
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0.5f)];
    [path addLineToPoint:CGPointMake(CGRectGetMaxX(rect), 0.5f)];
    [path moveToPoint:CGPointMake(0, CGRectGetMaxY(rect) - 0.5f)];
    [path addLineToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect) - 0.5f)];
    path.lineWidth = 1.f;
    [[UIColor colorWithWhite:0.9 alpha:1.f] setStroke];
    [path stroke];
}


@end
