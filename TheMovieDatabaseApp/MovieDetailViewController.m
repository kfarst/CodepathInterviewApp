//
//  MovieDetailViewController.m
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 3/3/18.
//  Copyright © 2018 Kevin Farst. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "MovieDetailViewController.h"
#import "MovieDetailView.h"
#import "MovieModel.h"

@interface MovieDetailViewController ()

@property (nonatomic, strong) MovieDetailView *view;
@property (nonatomic, strong) MovieModel *movie;

@end

@implementation MovieDetailViewController

NSString * const BACKDROP_BASE_URL = @"https://image.tmdb.org/t/p/w300%@";

@dynamic view;

- (instancetype)initWithMovie:(MovieModel *)movie
{
    self = [super init];
    
    if (self != nil) {
        self.movie = movie;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *posterPathEncoded = [self.movie.backdropPath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    NSString *urlString = [NSString stringWithFormat:BACKDROP_BASE_URL, posterPathEncoded];
    
    [self.view.backdropImageView setImageWithURL:[NSURL URLWithString:urlString] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    self.view.titleLabel.text = self.movie.title;
    self.view.descriptionTextView.text = self.movie.overview;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView {
    self.view = [[MovieDetailView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}
@end
