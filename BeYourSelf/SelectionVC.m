//
//  SelectionVC.m
//  BeYourSelf
//
//  Created by huyheo on 9/13/13.
//  Copyright (c) 2013 imac. All rights reserved.
//

#import "SelectionVC.h"
#import "CustomCell.h"
#import "ConstantDefinition.h"
@interface SelectionVC ()

@end

@implementation SelectionVC



-(id) init
{

    self = [super init];
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)cellIsSelected:(NSIndexPath *)indexPath {
	// Return whether the cell at the specified index path is selected or not
	NSNumber *selectedIndex = [selectedIndexes objectForKey:indexPath];
    DebugLog(@"seleted index = %d", selectedIndex);
	return selectedIndex == nil ? FALSE : [selectedIndex boolValue];
}







- (void)viewDidLoad
{
    [super viewDidLoad];


    self.navigationItem.hidesBackButton = NO;
    [self.navigationController setNavigationBarHidden:YES];
    

    NSArray *subviews = [self.view subviews];
    UITableView *tableView = [subviews objectAtIndex:0];
    [tableView setBackgroundColor:[UIColor clearColor]];
    
	selectedIndexes = [[NSMutableDictionary alloc] init];

    
    
}



- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //   cell.backgroundColor = [UIColor colorWithRed:.8 green:.8 blue:1 alpha:1];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    InfoLog(@"");
    
    return 12;
}




-(void)setDetail:(CustomCell *)cell
              withContent:(NSString *)content{
    cell.selectionText.text = content;
}



-(NSArray *)createDataForTest{
    NSArray *data = [NSArray arrayWithObjects:@"",@"Being Me",@"Senerity of Being", @"Boredom",@"Anxiety",@"Despair",@"Hopeless", @"Useless", @"Failure", @"Regrest",@"",@"", nil];
    return data;
}


-(void) setValueForCell:(CustomCell *)cell
              rowNumber: (NSInteger *)row{
    NSArray *data = [self createDataForTest];
    [self setDetail:cell withContent:[data objectAtIndex:row] ];

}

-(void) handleSegue:(NSInteger *)row{
  //  sleep(1);
    [self performSegueWithIdentifier:     @"go_to_content_page" sender: NULL];
        

}


- (CustomCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellforrowatindexPath");
    static NSString *CellIdentifier = @"Cell";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    DebugLog(@"");

    [self setValueForCell: cell rowNumber:[indexPath row]];
    
	if([self cellIsSelected:indexPath]) {
        DebugLog(@"update conetnte higher height");
//        cell.selectionText.frame=  CGRectMake(0, 0, 1000, 1000);
       // [cell.selectionText setFont: [UIFont fontWithName:@"Arial" size:200.0f]];
        cell.selectionText.text = @"test";
      //  cell.selectionText.frame=  CGRectMake(0, 0, 200, 400);
   //     cell.selectionText.hidden = YES;
           // sleep(1);
        
	}
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//Get the selected country
    

	[tableView deselectRowAtIndexPath:indexPath animated:TRUE];
	
	// Toggle 'selected' state
    DebugLog(@"");
	BOOL isSelected = ![self cellIsSelected:indexPath];
	
	// Store cell 'selected' state keyed on indexPath
	NSNumber *selectedIndex = [NSNumber numberWithBool:isSelected];
    DebugLog(@"seletedIndex = %d", selectedIndex);
	[selectedIndexes setObject:selectedIndex forKey:indexPath];
    NSNumber *test = [selectedIndexes objectForKey:indexPath];
    DebugLog(@"seleted index = %@", test);
    DebugLog(@" seleted index = %@", selectedIndexes);
	// This is where magic happens...
    NSArray *subviews = [self.view subviews];
    UITableView *tableView2 = [subviews objectAtIndex:0];
    [tableView2 setBackgroundColor:[UIColor clearColor]];
	[tableView2 beginUpdates];
   [tableView2 reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
	[tableView2 endUpdates];
    
  
    [self handleSegue:[indexPath row]];
//    [self performSegueWithIdentifier:     @"go_to_content_page" sender: NULL];

    
  //  [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	// If our cell is selected, return double height
    DebugLog(@"");
    /*
	if([self cellIsSelected:indexPath]) {
        DebugLog(@"return higher height");
		return kCellHeight * 10.0;
	}*/
	
	// Cell isn't selected so return single height
	return kCellHeight;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)backButton:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
