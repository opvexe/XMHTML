//
//  EXFontStyleModel.h
//  ExperimentApp
//
//  Created by GDBank on 2017/11/1.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_BaseModel.h"

typedef NS_ENUM(NSUInteger,FontCellType ) {
    /// 基本类型Cell
    FontCellTypeBaseTableViewCell = 1,
    /// 字体粗细Cell
    FontCellTypeSpecialityTableViewCell = 2,
    /// 字体间隔Cell
    FontCellTypeSpaceTableViewCell = 3,
};
@interface EXFontStyleModel : EX_BaseModel

/**
 * 
 */
@property (nonatomic,assign) FontCellType  fontType;
/**
 * 文本标题
 */
@property (nonatomic,copy) NSString *title;
/**
 * 文本图片
 */
@property (nonatomic,copy) NSString *rightImage;
/**
 * 文本内容
 */
@property (nonatomic,copy) NSString *rightTitle;
/**
 * 展开图标
 */
@property (nonatomic,copy) NSString *unfoldImage;

@end


