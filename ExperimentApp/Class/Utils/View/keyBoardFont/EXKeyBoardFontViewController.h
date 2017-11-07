//
//  EXKeyBoardFontViewController.h
//  ExperimentApp
//
//  Created by GDBank on 2017/11/1.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EXTextStyle;
@class EXParagraphConfig;

@protocol LMStyleSettingsControllerDelegate <NSObject>

- (void)lm_didChangedTextStyle:(EXTextStyle *)textStyle;
- (void)lm_didChangedParagraphIndentLevel:(NSInteger)level;
- (void)lm_didChangedParagraphType:(NSInteger)type;

@end

@interface EXKeyBoardFontViewController : UIViewController

@property (nonatomic, weak) id<LMStyleSettingsControllerDelegate> delegate;
@property (nonatomic, strong) EXTextStyle *textStyle;

- (void)reload;
- (void)setParagraphConfig:(EXParagraphConfig *)paragraphConfig;
@end
