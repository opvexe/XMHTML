//
//  EXVideoModel.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXShopInfoModel.h"

@implementation EXShopInfoModel

-(NSUInteger)TouchType{
    NSUInteger type = 0;
    if ([self.MIME  isEqualToString:@"APPLICATION/GOOD"]) {
        type = CJXBaseTableViewCellTouchTypeGOOD;
    }else if ([self.MIME  isEqualToString:@"APPLICATION/VIDEO"]){
        type = CJXBaseTableViewCellTouchTypeVIDEO;
    }else if ([self.MIME  isEqualToString:@"APPLICATION/ACTIVITY"]){
        type = CJXBaseTableViewCellTouchTypeACTIVITY;
    }else if ([self.MIME  isEqualToString:@"APPLICATION/REPRESENT"]){
        type = TCJXBaseTableViewCellTouchTypeREPRESENT;
    }else if ([self.MIME  isEqualToString:@"APPLICATION/ARTIS"]){
        type = TCJXBaseTableViewCellTouchTypeARTIS;
    }else if ([self.MIME  isEqualToString:@"APPLICATION/BANNER"]){
        
        if ([self.destination isEqualToString:@"0"]) {
            
            type = TCJXBaseTableViewCellTouchTypeBANNER;
        }else if ([self.destination isEqualToString:@"0"]){
            
            
        }else if ([self.destination isEqualToString:@"4"]){
            
            
        }else if ([self.destination isEqualToString:@"5"]){
            type = CJXBaseTableViewCellTouchTypeVIDEO;
            
        }else if ([self.destination isEqualToString:@"6"]){
            type = CJXBaseTableViewCellTouchTypeGOOD;
            
        }else if ([self.destination isEqualToString:@"7"]){
            type = TCJXBaseTableViewCellTouchTypeARTIS;
            
        }else if ([self.destination isEqualToString:@"8"]){
            type = CJXBaseTableViewCellTouchTypeACTIVITY;
        }
    }else if ([self.MIME  isEqualToString:@"APPLICATION/CHANNEL"]){
        type = TCJXBaseTableViewCellTouchTypeCHANNEL;
    }else if([self.MIME isEqualToString:@"APPLICATION/EVENMORE"]){
        type =TCJXBaseTableViewCellTouchTypeEVENMORE;
    }
    return type;
}
@end
