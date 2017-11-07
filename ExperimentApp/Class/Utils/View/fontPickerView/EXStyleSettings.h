//
//  EXStyleSettings.h
//  ExperimentApp
//
//  Created by GDBank on 2017/11/6.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#ifndef EXStyleSettings_h
#define EXStyleSettings_h

static NSString * const EXStyleSettingsBoldName = @"bold";
static NSString * const EXStyleSettingsItalicName = @"italic";
static NSString * const EXStyleSettingsUnderlineName = @"underline";
static NSString * const EXStyleSettingsFontSizeName = @"fontSize";
static NSString * const EXStyleSettingsTextColorName = @"textColor";
static NSString * const EXStyleSettingsFormatName = @"format";

@protocol EXStyleSettings <NSObject>

- (void)xm_didChangeStyleSettings:(NSDictionary *)settings;

@end
#endif /* EXStyleSettings_h */
