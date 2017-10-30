//
//  EXSegmentedControl.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EXSegmentedControl;

@protocol EXSegmentedControlDelegate <NSObject>

- (void)ex_segmentedControl:(EXSegmentedControl *)control didTapAtIndex:(NSInteger)index;

@end


/**
 * 键盘高度上44控制视图
 */
@interface EXSegmentedControl : UIControl
@property (nonatomic, assign) BOOL changeSegmentManually;
@property (nonatomic, readonly) NSInteger numberOfSegments;
@property (nonatomic, readonly) NSInteger selectedSegmentIndex;
@property (nonatomic,weak) id <EXSegmentedControlDelegate> delegate;

/**
 * 初始化Items

 @param items items description
 @return return value description
 */
- (instancetype)initWithItems:(NSArray<UIImage *> *)items;

/**
 *选中Items

 @param selectedSegmentIndex selectedSegmentIndex description
 @param animated animated description
 */
- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex animated:(BOOL)animated;
@end
