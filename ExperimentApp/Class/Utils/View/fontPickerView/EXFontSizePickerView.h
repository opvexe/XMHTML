//
//  EXPopupView.h
//  ExperimentApp
//
//  Created by GDBank on 2017/11/1.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EXFontSizePickerView;


@protocol EXFontSizePickerViewDataSource <NSObject>


/**
 * 所有字体类型个数

 @param pickerView pickerView description
 @return return value description
 */
- (NSInteger)numberOfItemsInPickerView:(EXFontSizePickerView *)pickerView;


/**
 * 字体类型标题

 @param pickerView pickerView description
 @param index index description
 @return return value description
 */
- (NSString *)pickerView:(EXFontSizePickerView *)pickerView titleForItemAtIndex:(NSInteger)index;

@end

@protocol EXFontSizePickerViewDelegate <NSObject>
/**
 * 选中哪个

 @param pickerView pickerView description
 @param index index description
 */
- (void)pickerView:(EXFontSizePickerView *)pickerView didSelectIndex:(NSInteger)index;
@end
/**
 * 字体大小弹出框PickerView
 */
@interface EXFontSizePickerView : UIView

/**
 * 
 */
@property (nonatomic, weak) id<EXFontSizePickerViewDataSource> dataSource;
@property (nonatomic, weak) id<EXFontSizePickerViewDelegate> delegate;

/**
 * 正常字体
 */
@property (nonatomic, strong) UIFont *normalFont;
/**
 * 选中字体
 */
@property (nonatomic, strong) UIFont *selectedFont;
/**
 * 正常字体颜色
 */
@property (nonatomic, strong) UIColor *normalTextColor;

/**
 * 选中字体颜色
 */
@property (nonatomic, strong) UIColor *selectedTextColor;

/**
 * 字体所占宽度
 */
@property (nonatomic, assign) CGFloat itemWidth;

/**
 * 所有字体类型个数
 */
@property (nonatomic, readonly) NSInteger numberOfItems;

/**
 * 选中字体下标
 */
@property (nonatomic, readonly) NSInteger selectedIndex;
/**
 * 刷新数据
 */
- (void)reloadData;
/**
 * 选中字体动画效果

 @param index index description
 @param animated animated description
 */
- (void)selectIndex:(NSInteger)index animated:(BOOL)animated;

@end
