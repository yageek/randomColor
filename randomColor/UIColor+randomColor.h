//
//  UIColor+randomColor.h
//  randomColor
//
//  Created by Yannick Heinrich on 20/05/15.
//  Copyright (c) 2015 yageek. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UIColorLuminosity) {
    UIColorLuminosityDark,
    UIColorLuminosityBright,
    UIColorLuminosityLight,
    UIColorLuminosityRandom
};

typedef NS_ENUM(NSUInteger, UIColorHue) {
    UIColorHueRed,
    UIColorHueOrange,
    UIColorHueYellow,
    UIColorHueGreen,
    UIColorHueBlue,
    UIColorHuePurple,
    UIColorHuePink,
    UIColorHueMonochrome,
    UIColorHueRandom
};

@interface UIColor (randomColor)
/**
 *  Generate an array of colors with specified hue and luminosity value
 *
 *  @param colorHue   The wanted hue color
 *  @param luminosity The wanted luminosity
 *  @param count      The number of colors to generate
 *
 *  @return An array of `UIColor` instances
 */
+ (NSArray*) randomColorsWithHue:(UIColorHue) colorHue luminosity:(UIColorLuminosity) luminosity count:(NSUInteger) count;
/**
 *  Generate a color with specified hue and luminosity value
 *
 *  @param colorHue   The wanted hue color
 *  @param luminosity The wanted luminosity
 *
 *  @return An instance of `UIColor`
 */
+ (UIColor*) randomColorWithHue:(UIColorHue) colorHue luminosity:(UIColorLuminosity) luminosity;

/**
 *  Generate a random color. Same as invoking `randomColorWithHue:luminosity:` with `UIColorHueRandom` and `UIColorLuminosityRandom`
 *
 *  @return A `UIColor` instance
 */
+ (UIColor*) randomColor;
/**
 *  Generate an array of random colors. 
 *  Same as invoking `randomColorsWithHue:luminosity:count:` with `UIColorHueRandom` and `UIColorLuminosityRandom`
 *
 *  @param count The number of colors to generate
 *
 *  @return An array of `UIColor` instances
 */
+ (NSArray*) randomColorsWithCount:(NSUInteger) count;

/**
 *  Generate a randomcolor with a specified hue value.  
 *  Same as invoking `randomColorWithHue:luminosity:` with a luminosity equals to `UIColorLuminosityRandom`
 *
 *  @param colorHue The wanted hue color
 *
 *  @return A `UIColor` instance
 */
+ (UIColor*) randomColorWithHue:(UIColorHue) colorHue;
/**
 *  Generate an array of random colors with a specified hue value.  Same as invoking
 * `randomColorsWithHue:luminosity:count:` with with a luminosity equals to `UIColorLuminosityRandom`
 *
 *  @param colorHue The wanted hue value
 *  @param count    The number of colors to generate
 *
 *  @return An array of `UIColor` instances
 */
+ (NSArray*) randomColorsWithHue:(UIColorHue) colorHue count:(NSUInteger) count;

/**
 *  Generate a randomcolor with a specified luminosity value.
 *  Same as invoking `randomColorWithHue:luminosity:` with a hue equals to `UIColorHueRandom`
 *  @param luminosity The wanted luminosity value
 *
 *  @return  A `UIColor` instance
 */
+ (UIColor*) randomColorWithLuminosity:(UIColorLuminosity) luminosity;
/**
 *  Generate an array of random colors with a specified luminosity value.  Same as invoking
 * `randomColorsWithHue:luminosity:count:` with with a hueColor equals to `UIColorHueRandom`
 *
 *  @param luminosity The wanted luminosity
 *  @param count      The number of color to generate
 *
 *  @return An array of `UIColor` instances
 */
+ (NSArray*) randomColorsWithLuminosity:(UIColorLuminosity) luminosity count:(NSUInteger) count;
@end
