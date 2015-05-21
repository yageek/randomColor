//
//  ColorDetailsViewController.m
//  randomColor
//
//  Created by Yannick Heinrich on 21/05/15.
//  Copyright (c) 2015 yageek. All rights reserved.
//

#import "ColorDetailsViewController.h"

@implementation ColorDetailsViewController


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.colors.count;
}
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellId = @"ColorCell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.contentView.backgroundColor = self.colors[indexPath.row];
    
    return cell;
    
}
@end
