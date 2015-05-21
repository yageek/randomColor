//
//  NSColor+randomColor.m
//  randomColor
//
//  Created by Yannick Heinrich on 21/05/15.
//  Copyright (c) 2015 yageek. All rights reserved.
//

#import "NSColor+randomColor.h"

@implementation NSColor (randomColor)

#pragma mark - Public Methods
+ (NSArray*) randomColorsWithHue:(YGColorHue) colorHue luminosity:(YGColorLuminosity) luminosity count:(NSUInteger) count
{
    NSMutableArray * colors = [NSMutableArray arrayWithCapacity:count];
    
    for(NSUInteger i = 0; i < count ; ++i)
    {
        [colors addObject:[self randomColorWithHue:colorHue luminosity:luminosity]];
    }
    return colors;
}

+ (NSArray*) randomColorsWithCount:(NSUInteger) count
{
    return [self randomColorsWithHue:YGColorHueRandom luminosity:YGColorLuminosityRandom count:count];
}

+ (NSArray*) randomColorsWithHue:(YGColorHue) colorHue count:(NSUInteger) count
{
    return [self randomColorsWithHue:colorHue luminosity:YGColorLuminosityRandom count:count];
}

+ (NSArray*) randomColorsWithLuminosity:(YGColorLuminosity) luminosity count:(NSUInteger) count
{
    return [self randomColorsWithHue:YGColorHueRandom luminosity:luminosity count:count];
}

+ (NSColor*) randomColorWithHue:(YGColorHue) colorHue luminosity:(YGColorLuminosity) luminosity
{
    CGFloat H = [YGColorDefinition pickHueWithEnum:colorHue];
    CGFloat S = [YGColorDefinition pickSaturationWithHueValue:H luminosity:luminosity monochrome:(colorHue==YGColorHueMonochrome)];
    CGFloat B = [YGColorDefinition pickBrightnessWitHueValue:H saturationValue:S luminosity:luminosity];
    
    return [NSColor colorWithDeviceHue:(H/360.0f) saturation:(S/100.0f) brightness:(B/100.0f) alpha:1.0f];
}

+ (NSColor*) randomColor
{
    return [self randomColorWithHue:YGColorHueRandom luminosity:YGColorLuminosityRandom];
}
+ (NSColor*) randomColorWithHue:(YGColorHue) colorHue
{
    return [self randomColorWithHue:colorHue luminosity:YGColorLuminosityRandom];
}



+ (NSColor*) randomColorWithLuminosity:(YGColorLuminosity) luminosity
{
    return [self randomColorWithHue:YGColorHueRandom luminosity:luminosity];
}

@end
