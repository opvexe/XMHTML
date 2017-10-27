//
//  EXGoodsModel.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/27.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXGoodsModel.h"

@implementation EXGoodsModel


+(NSDictionary *)mj_objectClassInArray{
    return @{@"star":@"StarModel"};
}
@end


@implementation StarModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}
@end
