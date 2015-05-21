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
//red, orange, yellow, green, blue, purple, pink and monochrome a
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
+ (NSArray*) randomColorsWithHue:(UIColorHue) colorHue luminosity:(UIColorLuminosity) luminosity count:(NSUInteger) count;
+ (UIColor*) randomColorWithHue:(UIColorHue) colorHue luminosity:(UIColorLuminosity) luminosity;

+ (UIColor*) randomColor;
+ (NSArray*) randomColorsWithCount:(NSUInteger) count;

+ (UIColor*) randomColorWithHue:(UIColorHue) colorHue;
+ (NSArray*) randomColorsWithHue:(UIColorHue) colorHue count:(NSUInteger) count;

+ (UIColor*) randomColorWithLuminosity:(UIColorLuminosity) luminosity;
+ (NSArray*) randomColorsWithLuminosity:(UIColorLuminosity) luminosity count:(NSUInteger) count;
@end
