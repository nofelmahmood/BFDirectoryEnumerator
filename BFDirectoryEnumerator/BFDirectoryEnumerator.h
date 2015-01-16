//
//  BFDirectoryEnumerator.h
//  BFDirectoryEnumerator
//
//  Created by Nofel Mahmood on 16/01/2015.
//  Copyright (c) 2015 Nofel Mahmood. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BFDirectoryEnumerator;
@protocol BFDirectoryEnumeratorDelegate <NSObject>
@required
-(void)bFDirectoryEnumerator:(BFDirectoryEnumerator*)enumerator didScanFileWithURL:(NSURL*)url;
-(void)bfDirectoryEnumerator:(BFDirectoryEnumerator*)enumerator didFailWithError:(NSError*)error;
@end
@interface BFDirectoryEnumerator : NSOperation

@property(strong,nonatomic)NSURL *directoryURL;
@property(strong,nonatomic)NSDirectoryEnumerator *directoryEnumerator;
@property(strong,nonatomic)NSMutableArray *directoryScanQueue;
@property(strong,nonatomic)id<BFDirectoryEnumeratorDelegate> delegate;
@property(nonatomic,readwrite)NSInteger options;

-(instancetype)initWithDirectoryURL:(NSURL*)url withOptions:(NSDirectoryEnumerationOptions)options NS_DESIGNATED_INITIALIZER;
+(BFDirectoryEnumerator*)enumeratorWithBFDirectoryURL:(NSURL*)url withOptions:(NSDirectoryEnumerationOptions)options;

@end
