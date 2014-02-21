//
//  DataViewController.m
//  Trovebox Presentation
//
//  Created by Patrick Santana on 10/02/14.
//  Copyright (c) 2014 Trovebox. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor =  UIColorFromRGB(0XFAF3EF);
    [self prefersStatusBarHidden];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject label];
    self.dataImage.image = [self.dataObject image];
}

- (IBAction)requestMoreInformation:(id)sender {
    NSLog(@"Button clicked requestMoreInformation");
    [self.delegate requestMoreInformation:sender];
}
@end
