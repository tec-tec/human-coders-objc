//
//  UIColor+MoreColors.m
//  Shoes
//
//  Created by Ludovic Ollagnier on 27/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

#import "UIColor+MoreColors.h"

@implementation UIColor (MoreColors)

+ (UIColor*)pinkColor {

    double red = (double)255/255;
    double green = (double)45/255;
    double blue = (double)90/255;

    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

@end
