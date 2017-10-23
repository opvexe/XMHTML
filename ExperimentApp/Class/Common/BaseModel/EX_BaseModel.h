//
//  EX_BaseModel.h
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, AnswerType) {
    AnswerChoiceSingleType  = 1 << 0, //单选 // 是把1 按2进制 左移0位，结果还是 1 ,2进制 0000 0001
    AnswerChoiceMultipletype= 1 << 1,//多选
};

@interface EX_BaseModel : NSObject

/**
 * 类的名称
 */
@property(nonatomic,copy)NSString *ClassName;

/**
 *  区
 */
@property(nonatomic,strong)NSArray *sections;
/**
 * Cell高度
 */
@property(nonatomic, assign) CGFloat CellHeight;

/**
 * 答题类型
 */
@property(nonatomic,assign)AnswerType answerType;

@end
