//
//  EXShopBannerTableViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXShopBannerTableViewCell.h"

@implementation EXShopBannerTableViewCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXShopBannerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXShopBannerTableViewCell class])];
    if (!cell) {
        cell = [[EXShopBannerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXShopBannerTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
    }
    return self;
}


@end
