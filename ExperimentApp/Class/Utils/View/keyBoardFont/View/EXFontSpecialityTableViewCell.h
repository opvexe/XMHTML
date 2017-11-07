//
//  EXFontSpecialityTableViewCell.h
//  ExperimentApp
//
//  Created by GDBank on 2017/11/1.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_BaseTbaleViewCell.h"
/**
 Description
 */
@interface EXFontSpecialityTableViewCell :EX_BaseTbaleViewCell
@property (nonatomic,weak) id <EXStyleSettings>xm_delegate;
@property (nonatomic, assign) BOOL isBold;
@property (nonatomic, assign) BOOL isItalic;
@property (nonatomic, assign) BOOL isUnderline;
@end



typedef NS_ENUM(NSUInteger, LMStyleIndentDirection) {
    LMStyleIndentDirectionLeft = -1,
    LMStyleIndentDirectionRight = 1,
};

@protocol EXStyleParagraphCellDelegate <EXStyleSettings>

- (void)lm_paragraphChangeIndentWithDirection:(LMStyleIndentDirection)direction;
- (void)lm_paragraphChangeType:(NSInteger)type;

@end
/**
 Description
 */
@interface EXFontSpaceTableViewCell : EX_BaseTbaleViewCell

@property (nonatomic, assign) BOOL isList;
@property (nonatomic, assign) BOOL isNumberList;
@property (nonatomic, assign) BOOL isCheckbox;
@property (nonatomic, assign) NSInteger type;

@property (nonatomic, weak) id<EXStyleParagraphCellDelegate> xm_delegate;
@end
