//
//  UPWDropdownSearchView.m
//  DroperProj
//
//  Created by Dru Lang on 3/27/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//
#import "PureLayout.h"

#import "UPWDropdownSearchView.h"


//_______________________________________________________________________________________________________________
// Class Interface

@interface UPWDropdownSearchView ()

@property (nonatomic, readwrite)UITextField *searchTextField;
@property (nonatomic, readwrite)UITableView *resultsTableView;
@property (nonatomic) NSArray *resultsTableViewHiddenConstraints;
@property (nonatomic) NSArray *resultsTableViewVisibleConstraints;

@end


//_______________________________________________________________________________________________________________
// Class Implementation

@implementation UPWDropdownSearchView {
    BOOL _constraintsAdded;
}

#pragma mark Properties

- (UITextField *)searchTextField {
    if (!_searchTextField) {
        _searchTextField = [[UITextField alloc] init];
        _searchTextField.translatesAutoresizingMaskIntoConstraints = NO;
        _searchTextField.layer.borderColor = [UIColor purpleColor].CGColor;
        _searchTextField.layer.borderWidth = 1;
    }
    return _searchTextField;
}

- (UITableView *)resultsTableView {
    if (!_resultsTableView) {
        _resultsTableView = [[UITableView alloc] init];
        _resultsTableView.translatesAutoresizingMaskIntoConstraints = NO;
        _resultsTableView.backgroundColor = [UIColor lightGrayColor];
    }
    return _resultsTableView;
}

- (NSArray *)resultsTableViewHiddenConstraints {
    if (!_resultsTableViewHiddenConstraints) {
        _resultsTableViewHiddenConstraints = [UIView autoCreateConstraintsWithoutInstalling:^{
            [self.resultsTableView autoSetDimension:ALDimensionHeight toSize:0];
        }];
    }
    return _resultsTableViewHiddenConstraints;
}

- (NSArray *)resultsTableViewVisibleConstraints {
    if (!_resultsTableViewVisibleConstraints) {
        _resultsTableViewVisibleConstraints = [UIView autoCreateConstraintsWithoutInstalling:^{
            [self.resultsTableView autoSetDimension:ALDimensionHeight toSize:200];
        }];
    }
    return _resultsTableViewVisibleConstraints;
}

#pragma mark Constructors

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.searchTextField];
        [self addSubview:self.resultsTableView];
        
        [self setNeedsUpdateConstraints];
    }
    
    return self;
}

#pragma mark PureLayout

- (void)updateConstraints {
    if (!_constraintsAdded) {
        [self.searchTextField autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.searchTextField autoSetDimension:ALDimensionHeight toSize:35];
        
        [self.resultsTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.searchTextField];
        [self.resultsTableView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.searchTextField];
        [self.resultsTableView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.searchTextField];
        [self.resultsTableViewHiddenConstraints autoInstallConstraints];
    }
    [super updateConstraints];
}

#pragma mark Public Methods

- (void)showResultsView {
    [self.resultsTableViewHiddenConstraints autoRemoveConstraints];
    [self.resultsTableViewVisibleConstraints autoInstallConstraints];
    
    [UIView animateWithDuration:.3 animations:^{
        [self layoutIfNeeded];
    }];
}

- (void)hideResultsView {
    [self.resultsTableViewHiddenConstraints autoInstallConstraints];
    [self.resultsTableViewVisibleConstraints autoRemoveConstraints];
    
    [UIView animateWithDuration:.3 animations:^{
        [self layoutIfNeeded];
    }];
}

@end
