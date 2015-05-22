[![Version](http://img.shields.io/cocoapods/v/randomColor.svg?style=flat)](http://cocoapods.org/?q=randomColor) [![Platform](http://img.shields.io/cocoapods/p/randomColor.svg?style=flat)](http://cocoapods.org/?q=randomColor) [![License](http://img.shields.io/cocoapods/l/randomColor.svg?style=flat)](LICENSE)

# Random Color Objective-C

Inspired by David Merfield's [randomColor.js](https://github.com/davidmerfield/randomColor)
and the [Swift port](https://github.com/onevcat/RandomColorSwift) by Wei Wang. 

## Cocoapods

    pod 'randomColor'

## OSX

```ObjC
#import <NSColor+randomColor.h>

NSColor * rand = [NSColor randomColor];

NSColor * blueRand = [NSColor randomColorWithHue:YGColorHueBlue];

NSColor* greenBright = [NSColor randomColorWithHue:YGColorHueGreen luminosity:YGColorLuminosityBright];

NSArray * tenRandom = [NSColor randomColorsWithCount:10];

NSArray * tenYellow = [NSColor randomColorsWithHue:YGColorHueYellow count:10];
```

## iOS

```ObjC
#import <UIColor+randomColor.h>

UIColor * rand = [UIColor randomColor];

NSColor * blueRand = [UIColor randomColorWithHue:YGColorHueBlue];

NSColor* greenBright = [UIColor randomColorWithHue:YGColorHueGreen luminosity:YGColorLuminosityBright];

NSArray * tenRandom = [UIColor randomColorsWithCount:10];

NSArray * tenYellow = [UIColor randomColorsWithHue:YGColorHueYellow count:10];
```

## Acknowledgements

Thanks for David Merfield bringing us randomColor.js, which is a great utility.

## License

This project is licensed under the terms of the MIT license.
