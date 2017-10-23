//
//  EXVideoModel.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXShopInfoModel.h"

@implementation EXShopInfoModel
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}
@end



@implementation LogoModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}
@end


@implementation EXVideoModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}
@end



@implementation EXShopModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}
+(NSDictionary *)mj_objectClassInArray{
    return @{@"datas":@"EXShopModel",@"records":@"EXShopModel"};
    
}
-(NSUInteger)TouchType{
    NSUInteger type = 0;
    if ([self.MIME  isEqualToString:@"APPLICATION/GOOD"]) {
        type = EXBaseTableViewCellTouchTypeGOOD;
    }else if ([self.MIME  isEqualToString:@"APPLICATION/VIDEO"]){
        type = EXBaseTableViewCellTouchTypeVIDEO;
    }else if ([self.MIME  isEqualToString:@"APPLICATION/ACTIVITY"]){
        type = EXBaseTableViewCellTouchTypeACTIVITY;
    }else if ([self.MIME  isEqualToString:@"APPLICATION/REPRESENT"]){
        type = EXBaseTableViewCellTouchTypeREPRESENT;
    }else if ([self.MIME  isEqualToString:@"APPLICATION/ARTIS"]){
        type = EXBaseTableViewCellTouchTypeARTIS;
    }else if ([self.MIME  isEqualToString:@"APPLICATION/BANNER"]){
        
        if ([self.destination isEqualToString:@"0"]) {
            
            type = EXBaseTableViewCellTouchTypeBANNER;
        }else if ([self.destination isEqualToString:@"0"]){
            
            
        }else if ([self.destination isEqualToString:@"4"]){
            
            
        }else if ([self.destination isEqualToString:@"5"]){
            type = EXBaseTableViewCellTouchTypeVIDEO;
            
        }else if ([self.destination isEqualToString:@"6"]){
            type = EXBaseTableViewCellTouchTypeGOOD;
            
        }else if ([self.destination isEqualToString:@"7"]){
            type = EXBaseTableViewCellTouchTypeARTIS;
            
        }else if ([self.destination isEqualToString:@"8"]){
            type = EXBaseTableViewCellTouchTypeACTIVITY;
        }
    }else if ([self.MIME  isEqualToString:@"APPLICATION/CHANNEL"]){
        type = EXBaseTableViewCellTouchTypeCHANNEL;
    }else if([self.MIME isEqualToString:@"APPLICATION/EVENMORE"]){
        type =EXBaseTableViewCellTouchTypeEVENMORE;
    }
    return type;
}
@end
