//
//  AppDelegate.h
//  BFDirectoryEnumerator
//
//  Created by Nofel Mahmood on 16/01/2015.
//  Copyright (c) 2015 Nofel Mahmood. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BFDirectoryEnumerator.h"

@interface AppDelegate : NSObject <NSApplicationDelegate,BFDirectoryEnumeratorDelegate>
@property(strong,nonatomic)BFDirectoryEnumerator *bFDirectoryEnumerator;
@end

