//
//  ModelController.m
//  Trovebox Presentation
//
//  Created by Patrick Santana on 10/02/14.
//  Copyright (c) 2014 Trovebox. All rights reserved.
//

#import "ModelController.h"

#import "DataViewController.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface ModelController()
@property (readonly, strong, nonatomic) NSArray *pageData;

@end

@implementation ModelController

- (id)init
{
    self = [super init];
    if (self) {
        
        // define page 1
        DataPage *page1 = [[DataPage alloc] init];
        page1.label=@"Page1";
        page1.image = [UIImage imageNamed:@"1a.png"];
        
        // define page 2
        DataPage *page2 = [[DataPage alloc] init];
        page2.label=@"Page2";
        page2.image = [UIImage imageNamed:@"2ab.png"];
        
        // define page 3
        DataPage *page3 = [[DataPage alloc] init];
        page3.label=@"Page3";
        page3.image = [UIImage imageNamed:@"3ab.png"];
        
        // define page 4
        DataPage *page4 = [[DataPage alloc] init];
        page4.label=@"Page4";
        page4.image = [UIImage imageNamed:@"4ab.png"];
        
        // define page 5
        DataPage *page5 = [[DataPage alloc] init];
        page5.label=@"Page5";
        page5.image = [UIImage imageNamed:@"5ab.png"];
        
        // define page 6
        DataPage *page6 = [[DataPage alloc] init];
        page6.label=@"Page6";
        page6.image = [UIImage imageNamed:@"6ab.png"];
        
        // define page 7
        DataPage *page7 = [[DataPage alloc] init];
        page7.label=@"Form";
        page7.image = nil;
        
        _pageData = @[page1, page3, page4, page5, page6, page2, page7];
    }
    return self;
}

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{
    
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    // in the case of form, return a specific controller type FormViewController
    if (index == [self.pageData count] -1){
        //this is the last object, so it is the form.
        FormViewController *formViewController = [storyboard instantiateViewControllerWithIdentifier:@"FormViewController"];
        formViewController.dataObject = self.pageData[index];
        formViewController.delegate = self;
        return formViewController;
    }else{
        // Create a new view controller and pass suitable data.
        DataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
        dataViewController.dataObject = self.pageData[index];
        dataViewController.delegate = self;
        return dataViewController;
    }
}

- (NSUInteger)indexOfViewController:(DataViewController *)viewController
{
    // Return the index of the given data view controller.
    // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}


// method to go to the last page
- (void)requestMoreInformation:(id)sender
{
    [((RootViewController* )self.rootDelegate) flipToNoreInformationPage:sender];
}



@end
