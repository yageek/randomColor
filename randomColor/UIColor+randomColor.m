//
//  UIColor+randomColor.m
//  randomColor
//
//  Created by Yannick Heinrich on 20/05/15.
//  Copyright (c) 2015 yageek. All rights reserved.
//
#import <objc/runtime.h>
#import "UIColor+randomColor.h"


static char kYGColorDictionary;

#define YGRange(MinVal, MaxVal) [YGColorRange newWithMin:MinVal max:MaxVal]

#pragma mark - Helpers Class

#pragma mark - YGColorRange
@interface YGColorRange : NSObject

+ (instancetype) newWithMin:(CGFloat) min max:(CGFloat)max;
- (instancetype) initWithMin:(CGFloat) min max:(CGFloat)max;

@property(nonatomic)CGFloat min;
@property(nonatomic)CGFloat max;
@end

@implementation YGColorRange

- (instancetype) initWithMin:(CGFloat) min max:(CGFloat)max
{
    if(self = [super init])
    {
        _max = max;
        _min = min;
    }
    return self;
}

+ (instancetype) newWithMin:(CGFloat) min max:(CGFloat)max
{
    return [[[self class] alloc] initWithMin:min max:max];
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"<%p:%@> min:%f max:%f", self, NSStringFromClass([self class]), self.min, self.max];
}
@end

#pragma mark - YGColorDefinition

@interface YGColorDefinition : NSObject

- (id) initWithHueRange:(YGColorRange*) hueRange lowerBounds:(NSArray*) lowerBounds;


@property(nonatomic, strong) YGColorRange* hueRange;
@property(nonatomic, strong) YGColorRange* saturationRange;
@property(nonatomic, strong) YGColorRange* brightnessRange;
@property(nonatomic, copy) NSArray* lowerBounds;


@end

@implementation YGColorDefinition

- (id) initWithHueRange:(YGColorRange*) hueRange lowerBounds:(NSArray*) lowerBounds
{
    if(self = [super init])
    {
        
        YGColorRange * sMin = [lowerBounds firstObject];
        YGColorRange * sMax = [lowerBounds lastObject];
        
        _hueRange = hueRange;
        _lowerBounds = [lowerBounds copy];
        _saturationRange = [YGColorRange newWithMin:sMin.min max:sMax.min];
        _brightnessRange = [YGColorRange newWithMin:sMax.max max:sMin.max];
        
    }
    return self;
}

@end


#pragma mark - UIColor random color extension

@implementation UIColor (randomColor)

+ (void) yg_setRandomColorDictionary:(NSMutableDictionary*) dictionary
{
    objc_setAssociatedObject([self class], &kYGColorDictionary, dictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
+ (NSMutableDictionary*) yg_randomColorDictionary
{
    return objc_getAssociatedObject([self class], &kYGColorDictionary);
}

+ (void) load
{
    
    //Init the shared color dictionary
    [[self class] yg_setRandomColorDictionary:[[NSMutableDictionary alloc] init]];
    
    //Populate the dictionary
    [self loadColorBounds];
}

+ (void) defineColorWithName:(NSString*) name hueRange:(YGColorRange*) hueRange lowerBounds:(NSArray*) lowerBounds
{
    YGColorDefinition *definition = [[YGColorDefinition alloc] initWithHueRange:hueRange lowerBounds:lowerBounds];
    
    NSMutableDictionary* colorDict = [self yg_randomColorDictionary];
    colorDict[name] = definition;
}


+ (void) loadColorBounds
{
    [self defineColorWithName:@"monochrome"
                             hueRange:nil
                          lowerBounds:@[YGRange(0,0),YGRange(100,0)]];

    [self defineColorWithName:@"red"
                             hueRange:YGRange(-26,18)
                          lowerBounds:@[YGRange(20,100),YGRange(30,92),YGRange(40,89),YGRange(50,85),YGRange(60,78),YGRange(70,70),YGRange(80,60),YGRange(90,55),YGRange(100,50)]];

    
    [self defineColorWithName:@"orange"
                             hueRange:YGRange(19,46)
                          lowerBounds:@[YGRange(20,100),YGRange(30,93),YGRange(40,88),YGRange(50,86),YGRange(60,85),YGRange(70,70),YGRange(100,70)]];


    [self defineColorWithName:@"yellow"
                             hueRange:YGRange(47, 62)
                                       lowerBounds:@[YGRange(25,100),YGRange(40,94),YGRange(50,89),YGRange(60,86),YGRange(70,84),YGRange(80,82),YGRange(90,80),YGRange(100,75)]];

    [self defineColorWithName:@"green"
                             hueRange:YGRange(63, 178)
                          lowerBounds:@[YGRange(30,100),YGRange(40,90),YGRange(50,85),YGRange(60,81),YGRange(70,74),YGRange(80,64),YGRange(90,50),YGRange(100,40)]];

    [self defineColorWithName:@"blue"
                             hueRange:YGRange(179, 257)
                          lowerBounds:@[YGRange(20,100),YGRange(30,86),YGRange(40,80),YGRange(50,74),YGRange(60,60),YGRange(70,52),YGRange(80,44),YGRange(90,39), YGRange(100, 35)]];

    [self defineColorWithName:@"purple"
                             hueRange:YGRange(258, 282)
                          lowerBounds:@[YGRange(20,100),YGRange(30,87),YGRange(40,79),YGRange(50,70),YGRange(60,65),YGRange(70,59),YGRange(80,52),YGRange(90,45), YGRange(100, 42)]];
    
    [self defineColorWithName:@"pink"
                             hueRange:YGRange(283, 334)
                          lowerBounds:@[YGRange(20,100),YGRange(30,90),YGRange(40,86),YGRange(60,84),YGRange(80,80),YGRange(90,75),YGRange(100,73)]];

}

+ (YGColorRange*) hueRange:(id) colorInput
{
    if([colorInput isKindOfClass:[NSNumber class]])
    {
        CGFloat number = [colorInput floatValue];
        return (number < 360 && number > 0) ? YGRange(number, number) : YGRange(0, 360);
    }
    else if([colorInput isKindOfClass:[NSString class]])
    {
        YGColorDefinition * color = [[self class] yg_randomColorDictionary][colorInput];
        return color.hueRange ?: YGRange(0, 360);
    }
    
    
    return YGRange(0, 360);

}


+ (CGFloat) pickHue:(id) colorInput
{
    YGColorRange * range = [[self class] hueRange:colorInput];
    CGFloat hue = [self randomWithin:range];
    if (hue < 0) {hue = 360 + hue;}
    return hue;
}


+ (CGFloat) randomWithin:(YGColorRange*) range
{
    return floor(range.min + random()*(range.max + 1 - range.min));
}


+ (YGColorRange*) saturationRange:(CGFloat) hue
{
    return [[self colorInfo:hue] saturationRange];
}

+ (CGFloat) pickSaturationWithHueValue:(CGFloat) hue luminosity:(UIColorLuminosity) luminosity monochrome:(BOOL) isMonochrome
{
    
    if(isMonochrome)
        return 0;
    
    YGColorRange *saturationRange = [self saturationRange:hue];
    
    CGFloat sMin = saturationRange.min;
    CGFloat sMax = saturationRange.max;
    
    switch (luminosity) {
        case UIColorLuminosityBright:
            sMin  = 55;
            break;
        case UIColorLuminosityDark:
            sMin = sMax -10;
            break;
        case UIColorLuminosityLight:
            sMax = 55;
            break;
        case UIColorLuminosityRandom:
            return [self randomWithin:YGRange(0, 100)];
            break;
    }
    
    return [self randomWithin:YGRange(sMin, sMax)];
}

+ (CGFloat) minimumBrightnessWithHue:(CGFloat) hue saturation:(CGFloat) saturation
{
    NSArray * lowerBounds = [self colorInfo:hue].lowerBounds;
    
    __block CGFloat value = 0;
    [lowerBounds enumerateObjectsUsingBlock:^(YGColorRange* range, NSUInteger idx, BOOL *stop) {
        
        CGFloat s1 = range.min;
        CGFloat v1 = range.max;
        
        CGFloat s2 = [lowerBounds[idx+1] min];
        CGFloat v2 = [lowerBounds[idx+1] max];
        
        if(saturation >= s1 && saturation <= s2)
        {
            CGFloat m = (v2 - v1)/(s2 - s1);
            CGFloat  b = v1 - m*s1;
            value = m*saturation + b;
            *stop = YES;
        }
    }];
    
    return value;
}


+ (CGFloat) pickBrightnessWitHueValue:(CGFloat) hue saturationValue:(CGFloat) saturation luminosity:(UIColorLuminosity) luminosity
{
    CGFloat bMin = [self minimumBrightnessWithHue:hue saturation:saturation];
    CGFloat bMax = 100;
    
    switch (luminosity) {
        case UIColorLuminosityDark:
            bMax = bMin + 20;
            break;
        case UIColorLuminosityLight:
            bMin = (bMax + bMin)/2.0f;
            break;
        case UIColorLuminosityRandom:
            bMin = 0;
            bMax = 100;
            break;
        default:
            break;
    }
    return [self randomWithin:YGRange(bMin, bMax)];
}


+ (YGColorDefinition*) colorInfo:(CGFloat) hue
{
    if (hue >= 334 && hue <= 360) {
        hue-= 360;
    }
    
    for(YGColorDefinition* color in [[self yg_randomColorDictionary] allValues])
    {
        if(color.hueRange &&
           hue >= color.hueRange.min &&
           hue <= color.hueRange.max)
            return color;
    }
    
    return nil;
}

+ (NSString*) colorNameFromEnum:(UIColorHue) hueEnum
{
    switch (hueEnum)
    {
        case UIColorHueRed : return @"red";
        case UIColorHueOrange: return @"orange";
        case UIColorHueYellow: return @"yellow";
        case UIColorHueGreen: return @"green";
        case UIColorHueBlue: return @"blue";
        case UIColorHuePurple: return @"purple";
        case UIColorHuePink: return @"pink";
        case UIColorHueMonochrome: return @"monochrome";
        case UIColorHueRandom: return nil;

    }
}


+ (UIColor*) randomColorWithHue:(UIColorHue) colorHue luminosity:(UIColorLuminosity) luminosity count:(NSUInteger) count
{
    CGFloat H = [self pickHue:[self colorNameFromEnum:colorHue]];
    CGFloat S = [self pickSaturationWithHueValue:H luminosity:luminosity monochrome:(colorHue==UIColorHueMonochrome)];
    CGFloat B = [self pickBrightnessWitHueValue:H saturationValue:S luminosity:luminosity];
    
    return [UIColor colorWithHue:H saturation:S brightness:B alpha:1.0f];
}

+ (UIColor*) randomColor
{
    return [self randomColorWithHue:UIColorHueRandom luminosity:UIColorLuminosityRandom count:0];
}
+ (UIColor*) randomColorWithHue:(UIColorHue) colorHue
{
   return [self randomColorWithHue:colorHue luminosity:UIColorLuminosityRandom count:0];
}
+ (UIColor*) randomColorWithLuminosity:(UIColorLuminosity) luminosity
{
    return [self randomColorWithHue:UIColorHueRandom luminosity:luminosity count:0];

}

@end
