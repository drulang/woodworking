//
//  UPWDropdownSearchView.h
//  DroperProj
//
//  Created by Dru Lang on 3/27/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UPWDropdownSearchView : UIView

@property (nonatomic, readonly)UITextField *searchTextField;
@property (nonatomic, readonly)UITableView *resultsTableView;

- (void)showResultsView;
- (void)hideResultsView;

@end
