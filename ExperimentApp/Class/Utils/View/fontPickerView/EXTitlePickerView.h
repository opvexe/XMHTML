//
//  EXHeadTitlePickerView.h
//  ExperimentApp
//
//  Created by GDBank on 2017/11/2.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 * 大标题 中标题 小标题
 */
@interface EXTitlePickerView : UIView

/**
 * 初始化控件

 @param frame frame description
 @param items items description
 @param space space description
 */
-(instancetype)initWithFrame:(CGRect)frame withTitleItems:(NSArray *)items spacingBetweenEdge:(CGFloat)space;
@end
