//
//  EX_ChannelModel.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_ChannelModel.h"

@implementation EX_ChannelModel

-(InterfaceType)interfaceType{
    if ([self.interface_type  isEqualToString:@"oldShop"]) {
        return InterfaceTypeOld;
    }else{
        return InterfaceTypeNew;
    }
}
@end
