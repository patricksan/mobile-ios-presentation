//
//  Utilities.h
//  Trovebox Presentation
//
//  Created by Patrick Santana on 18/02/14.
//  Copyright (c) 2014 Trovebox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utilities : NSObject


// to transform color from hex to RBG
//RGB color macro
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@end
