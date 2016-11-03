//
//  CDTableViewController.m
//  XML Parsing
//
//  Created by apple on 26/08/16.
//  Copyright © 2016 felix-its. All rights reserved.
//

#import "CDTableViewController.h"
#import "CustomTableViewCell.h"
#import "CD.h"


@interface CDTableViewController ()

@end

@implementation CDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cdarray=[[NSMutableArray alloc]init];
    
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
    
//    if we have to parse local file(in main bundle) then use foll  line code
    
//    NSURL *filepath=[[NSBundle mainBundle]URLForResource:@"weather" withExtension:@"xml"];
//    
//    _parser1=[[NSXMLParser alloc]initWithContentsOfURL:filepath];
    
    
    // if we hve to parse file from web server(URL) then foll code
    
    NSString *path=@"http://www.w3schools.com/xml/cd_catalog.xml";
    
    NSURL *filepath1=[NSURL URLWithString:path];
    
    _parser1=[[NSXMLParser alloc]initWithContentsOfURL:filepath1];
    
    _parser1.delegate=self;
    
    [_parser1 parse];   // start parsing

    
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict //attribuDict use when < id=1 > key having values
{
    if([elementName isEqualToString:@"CD"])
    {
        _cd=[[CD alloc]init];
       // _mystring=[[NSMutableString alloc]init];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    _mystring=[[NSMutableString alloc]init];
    
    [_mystring appendString:string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
//    if([elementName isEqualToString:@"CD"])
//    {
//        [_cdarray addObject:_mystring];
//        
//        _mystring=nil; //optional no need to write
//        
//    }
    
    if([elementName isEqualToString:@"TITLE"])
    {
        _cd.title=_mystring;
    }
    else if([elementName isEqualToString:@"ARTIST"])
    {
        _cd.artist=_mystring;
    }
    else if([elementName isEqualToString:@"COUNTRY"])
    {
        _cd.country=_mystring;
    }
    else if([elementName isEqualToString:@"COMPANY"])
    {
        _cd.company=_mystring;
    }
    else if([elementName isEqualToString:@"PRICE"])
    {
        _cd.price=_mystring;
    }
    else if([elementName isEqualToString:@"YEAR"])
    {
        _cd.year=_mystring;
    }
    else if([elementName isEqualToString:@"CD"])
    {
        [_cdarray addObject:_cd];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _cdarray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    // cell.textLabel.text=[_cdarray objectAtIndex:indexPath.row];
    
    
    CD *temp=[_cdarray objectAtIndex:indexPath.row];
    
    cell.lbl1.text=temp.title;
    cell.lbl2.text=temp.artist;
    cell.lbl3.text=temp.country;
    cell.lbl4.text=temp.company;
    cell.lbl5.text=temp.price;
    cell.lbl6.text=temp.year;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
