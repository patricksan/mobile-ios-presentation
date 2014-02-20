//
//  Customer.h
//  Trovebox Presentation
//
//  Created by Patrick Santana on 20/02/14.
//  Copyright (c) 2014 Trovebox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Customer : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * company;
@property (nonatomic, retain) NSString * notes;

@end
