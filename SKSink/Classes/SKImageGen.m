//  Created by Alexander Skorulis on 3/06/2016.
//  Copyright (c) 2015 com.skorulis. All rights reserved.

#import "SKImageGen.h"

@implementation SKImageGen

+ (UIImage*)imageFromColor:(UIColor*)color {
    return [self imageFromColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage*)imageFromColor:(UIColor*)color size:(CGSize)size {
    CGContextRef ctx = [self startContext:size opaque:false];
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextFillRect(ctx, CGRectMake(0, 0, 1, 1));
    return [self endContext];
}


+ (CGContextRef)startContext:(CGSize)size opaque:(BOOL)opaque {
    CGFloat scale = [[UIScreen mainScreen] scale];
    return [self startContext:size opaque:opaque scale:scale];
}

+ (CGContextRef)startContext:(CGSize)size opaque:(BOOL)opaque scale:(float)scale {
    NSAssert(size.width > 0 && size.height > 0,@"Attempt to create image context with size %@",NSStringFromCGSize(size));
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    return ctx;
}

+ (UIImage*)endContext {
    UIImage* img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
