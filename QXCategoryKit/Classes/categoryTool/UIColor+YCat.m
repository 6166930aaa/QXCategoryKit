//
//  UIColor+YCat.m
//  laiQianDao
//
//  Created by bt on 2019/3/12.
//  Copyright © 2019 syc. All rights reserved.
//

#import "UIColor+YCat.h"

@implementation UIColor (YCat)
+ (UIColor *)fontDarkGray{
    return HEX_COLOR(0x999999, 1.0);
}

+ (UIColor *)fontGray{
    return HEX_COLOR(0x999999, 1.0);
}

+ (UIColor *)fontLightGray{
    return HEX_COLOR(0x999999, 1.0);
}

+ (UIColor *)fontRed{
    return HEX_COLOR(0x999999, 1.0);
}

+ (UIColor *)fontBlack{
    return HEX_COLOR(0x999999, 1.0);
}

+ (UIColor *)mainColor{
    return HEX_COLOR(0x999999, 1.0);
}

+ (UIColor *)ppColor{
    return [UIColor colorWithHexString:@"#999999" alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha{
    NSString *cString = [[color
                          stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                         uppercaseString];
    
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    // r
    NSString *rString = [cString substringWithRange:range];
    // g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    // b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:alpha];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
