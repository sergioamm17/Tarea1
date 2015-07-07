//
//  WorksHistoryViewController.m
//  Tarea1
//
//  Created by Sergio Monge on 6/7/15.
//  Copyright (c) 2015 Sergio Monge. All rights reserved.
//

#import "WorksHistoryViewController.h"
#import "Work.h"
#import "WorkTableViewCell.h"

NSString *const CELL_ID = @"WorkTableViewCell";

@interface WorksHistoryViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic,strong) NSFetchedResultsController* works;

@end

@implementation WorksHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setInitialWorkHistory];
    [self registerCustomCellInTableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registerCustomCellInTableView{
    UINib *nib = [UINib nibWithNibName:CELL_ID bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CELL_ID];
}

-(void)setInitialWorkHistory{
    self.works = [Work getTodayWorksWithDelegate:self];
}

- (IBAction)btnClose:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.works sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.works sections][section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WorkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    Work* work = [self.works objectAtIndexPath:indexPath];
    cell.lblClientName.text = work.clientName;
    cell.lblVehicleMade.text = work.vehicleMade;
    cell.lblVehicleYear.text = [work.vehicleYear stringValue];
    
    [[cell contentView] setFrame:[cell bounds]];
    [[cell contentView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Work *work = [self.works objectAtIndexPath:indexPath];
        [work deleteMe];
    }
}

#pragma mark - Fetched results controller
//-(NSFetchedResultsController*)works {
//    //Modificamos el Metodo GET de la propiedad "teams"
//    if (_works) {
//        return _works;
//    }
//    
//    _works = [Work getAllWorksWithDelegate:self];
//    
//    return _works;
//}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        default:
            return;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}




- (IBAction)indexChanged:(id)sender {
    
    switch (self.segmentControl.selectedSegmentIndex)
    {
        case 0:
            self.works = [Work getTodayWorksWithDelegate:self];
            [self.tableView reloadData];
            break;
        case 1:
            self.works = [Work getMonthWorksWithDelegate:self];
            [self.tableView reloadData];
            break;
        case 2:
            self.works = [Work getAllWorksWithDelegate:self];
            [self.tableView reloadData];
            break;
        default:
            break;
    }

    
}
@end
