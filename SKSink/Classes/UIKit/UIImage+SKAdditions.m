//  Created by Alexander Skorulis on 26/07/2016.

#import "UIImage+SKAdditions.h"

@implementation UIImage (SKAdditions)

- (CGSize) pixelSize {
    return CGSizeMake(self.size.width*self.scale, self.size.height*self.scale);
}

- (UIImage*)reduceToPixelSize:(CGSize)pixelSize {
    if(self.pixelSize.width > pixelSize.width || self.pixelSize.height > pixelSize.height) {
        CGSize scaledSize = CGSizeMake(pixelSize.width / self.scale, pixelSize.height / self.scale);
        UIGraphicsBeginImageContextWithOptions(scaledSize,true,self.scale);
        [self drawInRect:CGRectMake(0, 0, scaledSize.width, scaledSize.height)];
        UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    } else {
        return self;
    }
}


@end
