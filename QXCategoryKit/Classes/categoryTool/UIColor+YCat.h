//
//  UIColor+YCat.h
//  laiQianDao
//
//  Created by bt on 2019/3/12.
//  Copyright © 2019 syc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define HEX_COLOR(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

@interface UIColor (YCat)

+ (UIColor *)fontDarkGray;
+ (UIColor *)fontGray;
+ (UIColor *)fontLightGray;
+ (UIColor *)fontRed;
+ (UIColor *)fontBlack;

/**
 App theme color
 @return color
 */
+ (UIColor *)mainColor;

/**
 push & present for secondary pages
 
 @return color
 */
+ (UIColor *)ppColor;

/**
 Create image by color
 
 @param color color
 @return image
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
