//
//  Customer+Methods.m
//  Trovebox Presentation
//
//  Created by Patrick Santana on 19/02/14.
//  Copyright (c) 2014 Trovebox. All rights reserved.
//

#import "Customer+Methods.h"

@implementation Customer (Methods)


+ (NSArray *) getListCustomerInManagedObjectContext:(NSManagedObjectContext *)context
{
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Customer"];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (error){
        NSLog(@"Error to get all customers on managed object context = %@",[error localizedDescription]);
    }
    
    return matches;
}
@end
