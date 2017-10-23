//
//  EXShopMallsPoorTableViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/23.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXShopMallsPoorTableViewCell.h"
#import "EXShopInfoModel.h"

@implementation EXShopMallsPoorTableViewCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXShopMallsPoorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXShopMallsPoorTableViewCell class])];
    if (!cell) {
        cell = [[EXShopMallsPoorTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXShopMallsPoorTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
    }
    return self;
}


+(CGFloat)getCellHeight:(EXShopModel *)model{
    
    return Number(120.0);
}
@end
