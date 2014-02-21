//
//  DataViewController.h
//  Trovebox Presentation
//
//  Created by Patrick Santana on 10/02/14.
//  Copyright (c) 2014 Trovebox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataPage.h"

@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) IBOutlet UIImageView *dataImage;
@property (strong, nonatomic) DataPage *dataObject;
@property (strong, nonatomic) id delegate;


- (IBAction)requestMoreInformation:(id)sender;
@end
