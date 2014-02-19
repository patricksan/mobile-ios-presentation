//
//  Customer+Methods.h
//  Trovebox Presentation
//
//  Created by Patrick Santana on 19/02/14.
//  Copyright (c) 2014 Trovebox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Customer.h"

@interface Customer (Methods)

+ (NSArray *) getListCustomerInManagedObjectContext:(NSManagedObjectContext *)context;

@end
