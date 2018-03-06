//
//  MovieDetailView.h
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 3/3/18.
//  Copyright © 2018 Kevin Farst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailView : UIView

@property (nonatomic, strong, readonly) UIImageView *backdropImageView;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UITextView *descriptionTextView;

@end
