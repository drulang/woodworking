//
//  ViewController.m
//  DroperProj
//
//  Created by Dru Lang on 3/27/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//
#import "UPWDropdownSearchView.h"

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic)UPWDropdownSearchView *searchView;

@end


//_______________________________________________________________________________________________________________
//

@implementation ViewController

- (UPWDropdownSearchView *)searchView {
    if (!_searchView) {
        _searchView = [[UPWDropdownSearchView alloc] initWithFrame:CGRectMake(20, 22, self.view.frame.size.width - 40, 55)];
        _searchView.layer.borderColor = [UIColor greenColor].CGColor;
        _searchView.layer.borderWidth = 1;
    }
    return _searchView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.searchView];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.searchView showResultsView];
}

@end
