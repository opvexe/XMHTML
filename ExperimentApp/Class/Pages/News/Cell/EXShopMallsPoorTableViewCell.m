//
//  EXShopMallsPoorTableViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/23.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXShopMallsPoorTableViewCell.h"

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

@end
