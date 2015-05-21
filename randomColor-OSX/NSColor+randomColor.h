//
//  NSColor+randomColor.h
//  randomColor
//
//  Created by Yannick Heinrich on 21/05/15.
//  Copyright (c) 2015 yageek. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "YGColorDefinition.h"
@interface NSColor (randomColor)
/**
 *  Generate an array of colors with specified hue and luminosity value
 *
 *  @param colorHue   The wanted hue color
 *  @param luminosity The wanted luminosity
 *  @param count      The number of colors to generate
 *
 *  @return An array of `NSColor` instances
 */
+ (NSArray*) randomColorsWithHue:(YGColorHue) colorHue luminosity:(YGColorLuminosity) luminosity count:(NSUInteger) count;
/**
 *  Generate a color with specified hue and luminosity value
 *
 *  @param colorHue   The wanted hue color
 *  @param luminosity The wanted luminosity
 *
 *  @return An instance of `NSColor`
 */
+ (NSColor*) randomColorWithHue:(YGColorHue) colorHue luminosity:(YGColorLuminosity) luminosity;

/**
 *  Generate a random color. Same as invoking `randomColorWithHue:luminosity:` with `YGColorHueRandom` and `YGColorLuminosityRandom`
 *
 *  @return A `NSColor` instance
 */
+ (NSColor*) randomColor;
/**
 *  Generate an array of random colors.
 *  Same as invoking `randomColorsWithHue:luminosity:count:` with `YGColorHueRandom` and `YGColorLuminosityRandom`
 *
 *  @param count The number of colors to generate
 *
 *  @return An array of `NSColor` instances
 */
+ (NSArray*) randomColorsWithCount:(NSUInteger) count;

/**
 *  Generate a randomcolor with a specified hue value.
 *  Same as invoking `randomColorWithHue:luminosity:` with a luminosity equals to `YGColorLuminosityRandom`
 *
 *  @param colorHue The wanted hue color
 *
 *  @return A `NSColor` instance
 */
+ (NSColor*) randomColorWithHue:(YGColorHue) colorHue;
/**
 *  Generate an array of random colors with a specified hue value.  Same as invoking
 * `randomColorsWithHue:luminosity:count:` with with a luminosity equals to `YGColorLuminosityRandom`
 *
 *  @param colorHue The wanted hue value
 *  @param count    The number of colors to generate
 *
 *  @return An array of `NSColor` instances
 */
+ (NSArray*) randomColorsWithHue:(YGColorHue) colorHue count:(NSUInteger) count;

/**
 *  Generate a randomcolor with a specified luminosity value.
 *  Same as invoking `randomColorWithHue:luminosity:` with a hue equals to `YGColorHueRandom`
 *  @param luminosity The wanted luminosity value
 *
 *  @return  A `NSColor` instance
 */
+ (NSColor*) randomColorWithLuminosity:(YGColorLuminosity) luminosity;
/**
 *  Generate an array of random colors with a specified luminosity value.  Same as invoking
 * `randomColorsWithHue:luminosity:count:` with with a hueColor equals to `YGColorHueRandom`
 *
 *  @param luminosity The wanted luminosity
 *  @param count      The number of color to generate
 *
 *  @return An array of `NSColor` instances
 */
+ (NSArray*) randomColorsWithLuminosity:(YGColorLuminosity) luminosity count:(NSUInteger) count;

@end
