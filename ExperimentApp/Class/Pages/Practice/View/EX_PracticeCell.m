//
//  EX_PracticeCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/9.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_PracticeCell.h"

@interface EX_PracticeCell ()

@end
@implementation EX_PracticeCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EX_PracticeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EX_PracticeCell class])];
    if (!cell) {
        cell = [[EX_PracticeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EX_PracticeCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
  
    }
    return self;
}


@end
