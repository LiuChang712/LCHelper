//
//  UIColor+Extension.h
//  LCOCExtension
//
//  Created by 刘畅 on 16/7/6.
//  Copyright © 2016年 LiuChang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LCHelp)

/**
 *  十六进制转RGB颜色
 *
 *  @param hexStr 比如：@"0xF0F", @"66ccff", @"#66CCFF88"
 */
+ (instancetype)colorWithHexString:(NSString *)hexStr;

+ (UIColor *)colorWithRGB:(uint32_t)rgbValue;

+ (UIColor *)colorWithRGBA:(uint32_t)rgbaValue;

+ (UIColor *)colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha;

@end