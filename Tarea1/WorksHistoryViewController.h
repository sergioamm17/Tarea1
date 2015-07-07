//
//  WorksHistoryViewController.h
//  Tarea1
//
//  Created by Sergio Monge on 6/7/15.
//  Copyright (c) 2015 Sergio Monge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorksHistoryViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

- (IBAction)indexChanged:(id)sender;


@end
