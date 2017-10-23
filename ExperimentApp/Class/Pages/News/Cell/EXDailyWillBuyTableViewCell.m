//
//  EXDailyWillBuyTableViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/23.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXDailyWillBuyTableViewCell.h"

@implementation EXDailyWillBuyTableViewCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXDailyWillBuyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXDailyWillBuyTableViewCell class])];
    if (!cell) {
        cell = [[EXDailyWillBuyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXDailyWillBuyTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
    }
    return self;
}

@end
