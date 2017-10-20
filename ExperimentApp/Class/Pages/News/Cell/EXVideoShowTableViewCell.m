//
//  EXVideoShowTableViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXVideoShowTableViewCell.h"

@implementation EXVideoShowTableViewCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXVideoShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXVideoShowTableViewCell class])];
    if (!cell) {
        cell = [[EXVideoShowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXVideoShowTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
    }
    return self;
}

@end
