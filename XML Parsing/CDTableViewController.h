//
//  CDTableViewController.h
//  XML Parsing
//
//  Created by apple on 26/08/16.
//  Copyright © 2016 felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CD.h"

@interface CDTableViewController : UITableViewController <NSXMLParserDelegate>

@property(nonatomic,retain)NSXMLParser *parser1;
@property(nonatomic,retain)NSMutableArray *cdarray;
@property(nonatomic,retain)NSMutableString *mystring; // to hold read string

@property(nonatomic,retain)CD *cd;







@end
