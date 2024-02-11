//
//  APICall.h
//  TestObjectiveCApp
//
//  Created by Sneha Kalariya on 2024-02-11.
//

#import <Foundation/Foundation.h>
#import "ModelData.h"
NS_ASSUME_NONNULL_BEGIN

@interface APICall : NSObject


- (void)callAPI:(NSString*)url res:(void (^)(ModelData * _Nullable json, NSError * _Nullable error))completionHandler;
@end

NS_ASSUME_NONNULL_END
