//
//  ModelController.h
//  Trovebox Presentation
//
//  Created by Patrick Santana on 10/02/14.
//  Copyright (c) 2014 Trovebox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormViewController.h"
#import "RootViewController.h"
#import "DataPage.h"

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

@property (nonatomic, strong) id rootDelegate;

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;


// method to go to the last page
- (void)requestMoreInformation:(id)sender;
@end
