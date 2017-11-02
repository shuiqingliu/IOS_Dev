//
//  RandomColor.m
//  Assignment2
//
//  Created by qingliu on 10/28/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "RandomColor.h"

@implementation RandomColor

+ (UIColor *)randomColor{
    CGFloat colorHue = (arc4random() % 256/ 256.0);
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    return [UIColor colorWithHue:colorHue saturation:saturation brightness:brightness alpha:1];
}

@end
