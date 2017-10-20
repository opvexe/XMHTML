//
//  EX_VideoCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXVideoPoorTableViewCell.h"

@implementation EXVideoPoorTableViewCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXVideoPoorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXVideoPoorTableViewCell class])];
    if (!cell) {
        cell = [[EXVideoPoorTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXVideoPoorTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        

    }
    return self;
}

@end
