//
//  MovieDetailView.m
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 3/3/18.
//  Copyright © 2018 Kevin Farst. All rights reserved.
//

#import "MovieDetailView.h"


@interface MovieDetailView ()

@property (nonatomic, strong) UIImageView *backdropImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *descriptionTextView;

@end

@implementation MovieDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self != nil) {
        [self addSubview:self.backdropImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.descriptionTextView];
        
        self.backgroundColor = [UIColor whiteColor];

        [self setNeedsUpdateConstraints];
    }
    
    return self;
}

- (void)updateConstraints {
    NSMutableArray *constraints = [NSMutableArray new];
    NSDictionary *views = NSDictionaryOfVariableBindings(
                                                         _backdropImageView,
                                                         _titleLabel,
                                                         _descriptionTextView
                                                         );
    
    [constraints addObjectsFromArray:
     [NSLayoutConstraint
      constraintsWithVisualFormat:@"H:|[_backdropImageView]|"
      options:0
      metrics:nil
      views:views]];

    [constraints addObjectsFromArray:
     [NSLayoutConstraint
      constraintsWithVisualFormat:@"H:|-[_titleLabel]-|"
      options:0
      metrics:nil
      views:views]];
    
    [constraints addObjectsFromArray:
     [NSLayoutConstraint
      constraintsWithVisualFormat:@"H:|-[_descriptionTextView]-|"
      options:0
      metrics:nil
      views:views]];
    
    [constraints addObjectsFromArray:
     [NSLayoutConstraint
      constraintsWithVisualFormat:@"V:|-topSpacing-[_backdropImageView(==200)]-[_titleLabel]-[_descriptionTextView]"
      options:0
      metrics:@{@"topSpacing": [NSNumber numberWithDouble:self.safeAreaInsets.top]}
      views:views]];
    
    [self addConstraints:constraints];
    [super updateConstraints];
}

- (UIImageView *)backdropImageView
{
    if (_backdropImageView == nil)
    {
        _backdropImageView = [[UIImageView alloc] init];
        _backdropImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _backdropImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _backdropImageView;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.font = [UIFont systemFontOfSize:26.0];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UITextView *)descriptionTextView
{
    if (_descriptionTextView == nil)
    {
        _descriptionTextView = [[UITextView alloc] init];
        _descriptionTextView.translatesAutoresizingMaskIntoConstraints = NO;
        _descriptionTextView.font = [UIFont systemFontOfSize:13.0];
        _descriptionTextView.scrollEnabled = NO;
    }
    return _descriptionTextView;
}

@end
