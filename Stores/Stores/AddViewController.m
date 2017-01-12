//
//  AddViewController.m
//  Stores
//
//  Created by Fredrick Ohen on 10/11/16.
//  Copyright © 2016 GeeCode. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
 
}

-(IBAction) savedButtonPressed{
    Store *storeList = [[Store alloc]init];
    storeList.storeName = self.storeNameTextfield.text;
    storeList.storeNumber = self.storeNumberTextField.text;
    storeList.itemAdded = [NSMutableArray array];
    
    [self.delegate addStoreListViewControllerDidAddStoreList:storeList];
    [self dismissViewControllerAnimated:YES completion:nil];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
