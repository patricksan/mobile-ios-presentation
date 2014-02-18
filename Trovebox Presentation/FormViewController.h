//
//  FormViewController.h
//  Trovebox Presentation
//
//  Created by Patrick Santana on 17/02/14.
//  Copyright (c) 2014 Trovebox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataViewController.h"

@interface FormViewController : DataViewController
@property (strong, nonatomic) IBOutlet UITextField *textFieldName;
@property (strong, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (strong, nonatomic) IBOutlet UITextField *textFieldPhone;
- (IBAction)saveForm:(id)sender;
- (IBAction)sendDetailsToServer:(id)sender;

@end
