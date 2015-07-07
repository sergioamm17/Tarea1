//
//  WorkTableViewCell.h
//  Tarea1
//
//  Created by Sergio Monge on 6/7/15.
//  Copyright (c) 2015 Sergio Monge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblClientName;
@property (weak, nonatomic) IBOutlet UILabel *lblVehicleMade;
@property (weak, nonatomic) IBOutlet UILabel *lblVehicleYear;

@end
