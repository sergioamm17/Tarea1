//
//  WelcomeViewController.m
//  Tarea1
//
//  Created by Sergio Monge on 1/7/15.
//  Copyright (c) 2015 Sergio Monge. All rights reserved.
//

#import "WelcomeViewController.h"
#import "NewWorkFormViewController.h"
#import "WorksHistoryViewController.h"

@interface WelcomeViewController ()

//<NSFetchedResultsControllerDelegate>
//@property (nonatomic,strong) NSFetchedResultsController *workHistory;

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnAddWork:(id)sender {
    
    NewWorkFormViewController *viewForm = [self.storyboard instantiateViewControllerWithIdentifier:@"NewWorkForm"];
    
    [self presentViewController:viewForm animated:YES completion:nil];
    
}

- (IBAction)btnWorkHistory:(id)sender {
    
    WorksHistoryViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"WorkHistory"];
    
    [self presentViewController:view animated:YES completion:nil];

}



@end
