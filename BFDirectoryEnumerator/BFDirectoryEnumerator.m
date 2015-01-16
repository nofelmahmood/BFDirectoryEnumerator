//
//  BFDirectoryEnumerator.m
//  BFDirectoryEnumerator
//
//  Created by Nofel Mahmood on 16/01/2015.
//  Copyright (c) 2015 Nofel Mahmood. All rights reserved.
//

#import "BFDirectoryEnumerator.h"

@implementation BFDirectoryEnumerator

NSString* const BFDirectoryEnumeratorIDKey=@"BFDirectoryEnumeratorIDKey";
NSString* const BFDirectoryEnumeratorURLKey=@"BFDirectoryEnumeratorURLKey";

-(instancetype)initWithDirectoryURL:(NSURL *)url withOptions:(NSDirectoryEnumerationOptions)options
{
    if((self=[super init]))
    {
        [self setDirectoryURL:url];
        [self setOptions:options];
    }

    return self;
}
+(BFDirectoryEnumerator*)enumeratorWithBFDirectoryURL:(NSURL*)url withOptions:(NSDirectoryEnumerationOptions)options
{
    BFDirectoryEnumerator *bfDirectoryEnumerator=[[BFDirectoryEnumerator alloc]initWithDirectoryURL:url withOptions:options];
    return bfDirectoryEnumerator;
}
-(NSMutableArray *)directoryScanQueue
{
    if(!_directoryScanQueue)
        [self setDirectoryScanQueue:[[NSMutableArray alloc]init]];
    
    return _directoryScanQueue;
}
-(NSDictionary *)directoryInfoWithURL:(NSURL*)URL ID:(NSInteger)ID
{
    return @{BFDirectoryEnumeratorIDKey:[NSNumber numberWithInteger:ID],BFDirectoryEnumeratorURLKey:URL};
}
-(void)setUp
{
    [[self directoryScanQueue]addObject:[self directoryInfoWithURL:[self directoryURL] ID:0]];
}
-(void)main
{
    [self setUp];
    NSInteger ID=1;
    while([[self directoryScanQueue] count]!=0)
    {
        NSDictionary *info=[[self directoryScanQueue] firstObject];
        [[self directoryScanQueue] removeObject:info];
        NSDirectoryEnumerator *directoryEnumerator=[[NSFileManager defaultManager] enumeratorAtURL:info[BFDirectoryEnumeratorURLKey] includingPropertiesForKeys:nil options:[self options] errorHandler:^BOOL(NSURL *url,NSError *error)
                                                    {
                                                        if(error)
                                                        {
                                                           if([[self delegate] respondsToSelector:@selector(bfDirectoryEnumerator:didFailWithError:)])
                                                               [[self delegate]bfDirectoryEnumerator:self didFailWithError:error];
                                                              return NO;
                                                        }
                                                        
                                                        return YES;
                                                    }];
        for(NSURL *fileURL in directoryEnumerator)
        {
            [directoryEnumerator skipDescendants];
            if([[self delegate] respondsToSelector:@selector(bFDirectoryEnumerator:didScanFileWithURL:)])
                [[self delegate]bFDirectoryEnumerator:self didScanFileWithURL:fileURL];
            
            NSNumber *isDirectory=nil;
            NSError *error=nil;
            [fileURL getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:&error];
            if([isDirectory isEqualTo:@YES])
            {
                [[self directoryScanQueue] addObject:[self directoryInfoWithURL:fileURL ID:ID]];
            }
            ID++;
        }
        info=nil;
    }
    
}

@end
