//
//  EX_VideoCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_VideoCell.h"

@implementation EX_VideoCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EX_VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EX_VideoCell class])];
    if (!cell) {
        cell = [[EX_VideoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EX_VideoCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        

    }
    return self;
}

@end
