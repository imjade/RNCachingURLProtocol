//
//  PywWebCacheManager.h
//  CachedWebView
//
//  Created by Jade on 17/2/14.
//
//

#import "RNCachingURLProtocol.h"

@interface PywWebCacheManager : RNCachingURLProtocol
/**
 *  清除缓存
 */
+ (void)clearAllWebCache;
@end
