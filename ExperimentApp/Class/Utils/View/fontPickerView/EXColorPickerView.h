//
//  EXColorPickerView.h
//  ExperimentApp
//
//  Created by GDBank on 2017/11/2.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EXColorPickerView;
@protocol EXColorPickerViewDataSource <NSObject>


/**
 * 所有字体类型个数
 
 @param pickerView pickerView description
 @return return value description
 */
- (NSInteger)numberOfColorsInColorPickerView:(EXColorPickerView *)pickerView;


/**
 * 字体类型标题
 
 @param pickerView pickerView description
 @param index index description
 @return return value description
 */
- (UIColor *)colorPickerView:(EXColorPickerView *)pickerView colorForItemAtIndex:(NSInteger)index;

@end

@protocol EXColorPickerViewDelegate <NSObject>

/**
 * 选中哪个下标

 @param pickerView pickerView description
 @param index index description
 */
- (void)colorPickerView:(EXColorPickerView *)pickerView didSelectIndex:(NSInteger)index;

/**
 * 选中哪种颜色

 @param pickerView pickerView description
 @param color color description
 */
- (void)colorPickerView:(EXColorPickerView *)pickerView didSelectColor:(UIColor *)color;
@end
@interface EXColorPickerView : UIView
/**
 *
 */
@property (nonatomic, weak) id<EXColorPickerViewDataSource> dataSource;
@property (nonatomic, weak) id<EXColorPickerViewDelegate> delegate;
/**
 * color左边到屏幕的间隙,默认20.0
 */
@property (nonatomic, assign) NSInteger spacingBetweenColors;

/**
 * color的颜色个数
 */
@property (nonatomic, readonly) NSInteger numberOfColors;

/**
 * 选中color的下标
 */
@property (nonatomic, readonly) NSInteger selectedIndex;

/**
 * 刷新界面
 */
- (void)reloadData;

/**
 * 选中下标

 @param index index description
 */
- (void)selectIndex:(NSInteger)index;
@end
