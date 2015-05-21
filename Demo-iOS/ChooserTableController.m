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

- (YGColorHue) colorHueFromString:(NSString*) string
{
    if([string isEqualToString:@"red"])
        return YGColorHueRed;
    else if([string isEqualToString:@"orange"])
        return YGColorHueOrange;
    if ([string isEqualToString:@"green"])
        return YGColorHueGreen;
    if([string isEqualToString:@"blue"])
        return YGColorHueBlue;
    if([string isEqualToString:@"yellow"])
        return YGColorHueYellow;
    if([string isEqualToString:@"purple"])
        return YGColorHuePurple;
    if([string isEqualToString:@"monochrome"])
        return YGColorHueMonochrome;
    if([string isEqualToString:@"pink"])
        return YGColorHuePink;

    return YGColorHueRandom;
}

- (YGColorLuminosity) colorLuminosityFromString:(NSString*) string
{
    if([string isEqualToString:@"dark"])
        return YGColorLuminosityDark;
    else if([string isEqualToString:@"light"])
        return YGColorLuminosityLight;
    if ([string isEqualToString:@"bright"])
        return YGColorLuminosityBright;

    return YGColorLuminosityRandom;

    
}
@end
