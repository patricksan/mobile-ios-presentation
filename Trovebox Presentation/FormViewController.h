//
//  FormViewController.h
//  Trovebox Presentation
//
//  Created by Patrick Santana on 17/02/14.
//  Copyright (c) 2014 Trovebox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <QuartzCore/QuartzCore.h>

#import "Customer+Methods.h"
#import "DataViewController.h"

@interface FormViewController : DataViewController <MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textFieldName;
@property (strong, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (strong, nonatomic) IBOutlet UITextField *textFieldPhone;
@property (strong, nonatomic) IBOutlet UITextField *textFieldCompany;
@property (strong, nonatomic) IBOutlet UITextView *textViewNotes;

- (IBAction)saveForm:(id)sender;
- (IBAction)sendDetailsToServer:(id)sender;
@end
