//
//  EXClassifiedTableViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/23.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXClassifiedTableViewCell.h"

@implementation EXClassifiedTableViewCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXClassifiedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXClassifiedTableViewCell class])];
    if (!cell) {
        cell = [[EXClassifiedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXClassifiedTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
    }
    return self;
}
@end
