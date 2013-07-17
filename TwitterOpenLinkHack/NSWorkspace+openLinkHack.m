//
//  NSWorkspace+openLinkHack.m
//  TwitterOpenLinkHack
//
//  Created by azu on 2013/07/17.
//  Copyright (c) 2013年 azu. All rights reserved.
//

#import "NSWorkspace+openLinkHack.h"
#import "JRSwizzle.h"
@implementation NSWorkspace (openLinkHack)
+ (void)load{
    NSLog(@"OpenURLHack loaded.");
    NSError *error = nil;
    [[NSWorkspace class] jr_swizzleMethod:@selector(openURLs:withAppBundleIdentifier:options:additionalEventParamDescriptor:launchIdentifiers:) withMethod:@selector(openForeURLs:withAppBundleIdentifier:options:additionalEventParamDescriptor:launchIdentifiers:) error:&error];
}

- (void)openForeURLs:(NSArray *)urls withAppBundleIdentifier:(NSString *)bundleIdentifier options:(NSWorkspaceLaunchOptions)options additionalEventParamDescriptor:(NSAppleEventDescriptor *)descriptor launchIdentifiers:(NSArray **)identifiers;{
    NSLog(@"urls %@",urls);
    for(NSURL *url in urls){
        [[NSWorkspace sharedWorkspace] openURL:url];
    }
}
@end
