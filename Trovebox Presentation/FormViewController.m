//
//  FormViewController.m
//  Trovebox Presentation
//
//  Created by Patrick Santana on 17/02/14.
//  Copyright (c) 2014 Trovebox. All rights reserved.
//

#import "FormViewController.h"

@interface FormViewController ()

@end

@implementation FormViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor =  UIColorFromRGB(0XFAF3EF);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (IBAction)saveForm:(id)sender {
    NSLog(@"Save form");
}

- (IBAction)sendDetailsToServer:(id)sender {
    NSLog(@"Send details to Server");
    
    // ask for password
    
    // if confirms
    
    // send to server
}

@end
