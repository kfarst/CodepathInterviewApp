//
//  MovieClient.m
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 3/3/18.
//  Copyright © 2018 Kevin Farst. All rights reserved.
//

#import "MovieClient.h"

@interface MovieClient ()

@property (nonatomic, strong) NSURLSession *URLSession;
@property (nonatomic, strong) NSOperationQueue *requestQueue;
- (NSURLRequest *)requestForMovieListWithType:(NSString *)listType;

@end

@implementation MovieClient

NSString  *const BASE_URL = @"https://api.themoviedb.org/3/movie/%@?api_key=%@";
NSString *const  API_KEY = @"a07e22bc18f5cb106bfe4cc1f83ad8ed";

- (instancetype)init
{
    self = [super init];
    
    if (self != nil) {
        self.URLSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:self.requestQueue];
    }
    
    return self;
}

-(NSOperationQueue *) requestQueue {
    if (_requestQueue == nil) {
        _requestQueue = [[NSOperationQueue alloc] init];
    }
    return _requestQueue;
}

- (AnyPromise *)fetchMovieList:(NSString *)listType
{
    return [self.URLSession promiseDataTaskWithRequest:[self requestForMovieListWithType:listType]];
}

- (NSURLRequest *)requestForMovieListWithType:(NSString *)listType
{
    NSString *typeEncoded = [listType stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    NSString *apiKeyEncoded = [API_KEY stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:BASE_URL, typeEncoded, apiKeyEncoded]];
    
    return [NSURLRequest requestWithURL:url];
}
@end

