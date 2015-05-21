//
//  ChooserTableController.m
//  randomColor
//
//  Created by Yannick Heinrich on 21/05/15.
//  Copyright (c) 2015 yageek. All rights reserved.
//

#import "ChooserTableController.h"
#import "ColorDetailsViewController.h"
@interface ChooserTableController()
@property(nonatomic, copy ) NSString* colorString;
@property(nonatomic, copy) NSString* luminosityString;
@end

@implementation ChooserTableController
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if(indexPath.section == 0)
        self.colorString = [cell.textLabel.text lowercaseString];
    else
        self.luminosityString = [cell.textLabel.text lowercaseString];
    
    [self performSegueWithIdentifier:@"showColors" sender:cell];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ColorDetailsViewController * colorDetailsController = segue.destinationViewController;
    
    colorDetailsController.colors = [UIColor randomColorsWithHue:[self colorHueFromString:self.colorString] luminosity:[self colorLuminosityFromString:self.luminosityString] count:100];
}

- (UIColorHue) colorHueFromString:(NSString*) string
{
    if([string isEqualToString:@"red"])
        return UIColorHueRed;
    else if([string isEqualToString:@"orange"])
        return UIColorHueOrange;
    if ([string isEqualToString:@"green"])
        return UIColorHueGreen;
    if([string isEqualToString:@"blue"])
        return UIColorHueBlue;
    if([string isEqualToString:@"yellow"])
        return UIColorHueYellow;
    if([string isEqualToString:@"purple"])
        return UIColorHuePurple;
    if([string isEqualToString:@"monochrome"])
        return UIColorHueMonochrome;
    if([string isEqualToString:@"pink"])
        return UIColorHuePink;

    return UIColorHueRandom;
}

- (UIColorLuminosity) colorLuminosityFromString:(NSString*) string
{
    if([string isEqualToString:@"dark"])
        return UIColorLuminosityDark;
    else if([string isEqualToString:@"light"])
        return UIColorLuminosityLight;
    if ([string isEqualToString:@"bright"])
        return UIColorLuminosityBright;

    return UIColorLuminosityRandom;

    
}
@end
