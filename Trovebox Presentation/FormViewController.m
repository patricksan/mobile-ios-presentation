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
    
    // set delegation
    self.textFieldName.delegate  = self;
    self.textFieldEmail.delegate  = self;
    self.textFieldPhone.delegate  = self;
    self.textFieldCompany.delegate  = self;
    self.textViewNotes.delegate = self;
    
    // border
    self.textViewNotes.layer.borderWidth = 0.2f;
    self.textViewNotes.layer.borderColor = [[UIColor grayColor] CGColor];
    self.textViewNotes.layer.cornerRadius = 8;
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
    
    // retrieve keyboard
    [self.textFieldName resignFirstResponder];
    [self.textFieldEmail resignFirstResponder];
    [self.textFieldPhone resignFirstResponder];
    [self.textFieldCompany resignFirstResponder];
    [self.textViewNotes resignFirstResponder];
    
    
    Customer *customer =  [NSEntityDescription insertNewObjectForEntityForName:@"Customer"
                                                        inManagedObjectContext:[SharedAppDelegate managedObjectContext]];
    
    // details form this upload
    customer.date = [NSDate date];
    customer.name = self.textFieldName.text == nil ? @"N/A" : self.textFieldName.text;
    customer.email = self.textFieldEmail.text == nil ? @"N/A" : self.textFieldEmail.text;
    customer.phone = self.textFieldPhone.text == nil ? @"N/A" : self.textFieldPhone.text;
    customer.company = self.textFieldCompany.text == nil ? @"N/A" : self.textFieldCompany.text;
    customer.notes = self.textViewNotes.text == nil ? @"N/A" : self.textViewNotes.text;
    
    // ask for password
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank you"
                                                    message:@"Contact saved."
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [SharedAppDelegate saveContext];
    
    // clean field in the screen
    self.textFieldName.text  = @"";
    self.textFieldEmail.text = @"";
    self.textFieldPhone.text = @"";
    self.textFieldCompany.text = @"";
    self.textViewNotes.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.textFieldName){
        [self.textFieldEmail becomeFirstResponder];
        return NO;
    }else  if (textField == self.textFieldEmail){
        [self.textFieldPhone becomeFirstResponder];
        return NO;
    }else  if (textField == self.textFieldPhone){
        [self.textFieldCompany becomeFirstResponder];
        return NO;
    }else  if (textField == self.textFieldCompany){
        [self.textViewNotes becomeFirstResponder];
        return NO;
    }else{
        [self saveForm:nil];
        return YES;
    }
}

- (IBAction)sendDetailsToServer:(id)sender {
    NSLog(@"Send details to Server");
    
    // ask for password
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Trovebox Admin"
                                                    message:@"What is the password, please?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
    [alert addButtonWithTitle:@"Login"];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {  //Login
        UITextField *textField = [alertView textFieldAtIndex:0];
        NSLog(@"Password = %@",textField.text);
        
        if ([textField.text isEqualToString:@"trvbx1357"]){
            // read all data from database
            NSArray *customers = [Customer getListCustomerInManagedObjectContext:[SharedAppDelegate managedObjectContext]];
            NSMutableString *body = [NSMutableString stringWithString:@"List of customers\n\n\n"];
            
            int counter = 1;
            
            for (Customer *customer in customers){
                [body appendString:[NSString stringWithFormat:@"%d",counter++]];
                [body appendString:@";"];
                [body appendString:customer.name];
                [body appendString:@";"];
                [body appendString:customer.email];
                [body appendString:@";"];
                [body appendString:customer.phone];
                [body appendString:@";"];
                [body appendString:customer.company];
                [body appendString:@";"];
                [body appendString:[customer.notes stringByReplacingOccurrencesOfString:@"\n" withString:@" "]];
                [body appendString:@";\n"];
            }
            
            // send via email
            if ([MFMailComposeViewController canSendMail]) {
                
                MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
                mailViewController.mailComposeDelegate = self;
                [mailViewController setSubject:@"Customer List"];
                [mailViewController setMessageBody:body isHTML:NO];
                
                [self presentViewController:mailViewController animated:YES
                                 completion:nil];
            }else {
                NSLog(@"Device is unable to send email in its current state.");
            }
        }
    }
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
