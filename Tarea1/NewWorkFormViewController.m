//
//  NewWorkFormViewController.m
//  Tarea1
//
//  Created by Sergio Monge on 6/7/15.
//  Copyright (c) 2015 Sergio Monge. All rights reserved.
//

#import "NewWorkFormViewController.h"
#import "Work.h"

@interface NewWorkFormViewController () <UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtClientName;
@property (weak, nonatomic) IBOutlet UITextField *txtVehicleMade;
@property (weak, nonatomic) IBOutlet UITextField *txtVehicleYear;
@property (weak, nonatomic) IBOutlet UITextView *txtDescription;

@end

@implementation NewWorkFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.txtClientName.delegate = self;
    self.txtVehicleMade.delegate = self;
    self.txtVehicleYear.delegate = self;
    self.txtDescription.delegate = self;
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
    
    NSNumber *number = [NSNumber numberWithInteger:[self.txtVehicleYear.text integerValue]];
    
    Work *work = [Work MR_createEntity];
    work = [Work newWorkWithClientName:self.txtClientName.text workDescription:self.txtDescription.text vehicleMade:self.txtVehicleMade.text vehicleYear:number];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)btnCancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

@end
