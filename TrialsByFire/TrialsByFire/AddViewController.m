//
//  AddViewController.m
//  TrialsByFire
//
//  Created by Whitney Lauren on 6/1/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *additemTextfield;

- (IBAction)additemPressed:(id)sender;



@end

@implementation AddViewController

    
    // Do any additional setup after loading the view.


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

-
(IBAction)additemPressed:(id)sender {
    
    [self.items addObject:self.additemTextfield.text];
    [self dismissViewControllerAnimated:YES completion:nil];
    
//button was pressed 

}
@end
