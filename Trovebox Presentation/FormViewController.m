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
    
    Customer *customer =  [NSEntityDescription insertNewObjectForEntityForName:@"Customer"
                                                        inManagedObjectContext:[SharedAppDelegate managedObjectContext]];
    
    // details form this upload
    customer.date = [NSDate date];
    customer.name= self.textFieldName.text == nil ? @"N/A" : self.textFieldName.text;
    customer.email=self.textFieldEmail.text == nil ? @"N/A" : self.textFieldEmail.text;
    customer.phone=self.textFieldPhone.text == nil ? @"N/A" : self.textFieldPhone.text;
    
    // ask for password
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank you"
                                                    message:@"Contact saved."
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
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
            
            // send via email
            if ([MFMailComposeViewController canSendMail]) {
                
                MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
                mailViewController.mailComposeDelegate = self;
                [mailViewController setSubject:@"Customer List"];
                [mailViewController setMessageBody:@"Your message goes here." isHTML:NO];
                
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
