//  Created by Alexander Skorulis on 3/06/2016.
//  Copyright (c) 2015 com.skorulis. All rights reserved.

#import <Foundation/Foundation.h>

@interface SKImageGen : NSObject

+ (UIImage*)imageFromColor:(UIColor*)color;
+ (UIImage*)imageFromColor:(UIColor*)color size:(CGSize)size;
+ (UIImage *)borderImageWithColor:(UIColor *)color width:(CGFloat)width;
+ (CGContextRef)startContext:(CGSize)size opaque:(BOOL)opaque;
+ (CGContextRef)startContext:(CGSize)size opaque:(BOOL)opaque scale:(float)scale;
+ (UIImage*)endContext;

@end
