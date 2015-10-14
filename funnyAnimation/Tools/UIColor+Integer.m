//
//  UIColor+Integer.m
//  Xueba
//
//  Created by Li Xuening on 3/28/15.
//  Copyright (c) 2015 guikz. All rights reserved.
//

#import "UIColor+Integer.h"

static const CGFloat kColorRangeTopValue = 255.0f;

@implementation UIColor (Integer)

+ (UIColor *)colorFromInteger:(NSInteger)colorInteger {
    
    long alpha = (colorInteger >> 24) & 0x000000FF;
    long red = (colorInteger >> 16) & 0x000000FF;
    long green = (colorInteger >> 8) & 0x000000FF;
    long blue = colorInteger & 0x000000FF;
    
    return [UIColor colorWithRed:red / kColorRangeTopValue green:green / kColorRangeTopValue blue:blue / kColorRangeTopValue alpha:alpha / kColorRangeTopValue];
}

@end
