//
//  APICall.m
//  TestObjectiveCApp
//
//  Created by Sneha Kalariya on 2024-02-11.
//

#import "APICall.h"
#import "ModelData.h"

@implementation APICall

- (void)callAPI:(NSString*)url res:(void (^)(ModelData * _Nullable json, NSError * _Nullable error))completionHandler {
    [self callAPI:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completionHandler(nil, error);
            return;
        }
        NSError* error1;
        
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:&error1];
        ModelData *obj = [[ModelData alloc]initWithDictionary:json];
        NSLog(@"obj --> %@", obj.country);
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(obj, error1);
        });
    }];
}
    
- (void)callAPI:(NSString*)url completionHandler:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler {
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [[defaultSession dataTaskWithRequest:urlRequest
                       completionHandler:completionHandler] resume];
}


+ (void)call:(NSString*_Nonnull)strURL
      method:(NSString*_Nullable)method
     headers:(NSDictionary*_Nullable)headers
   andParams:(NSDictionary*_Nullable)params
         res:(void (^_Nonnull)(NSDictionary * _Nullable json, NSError * _Nullable error))completionHandler {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:strURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    for (NSString *key in headers) {
        [request addValue:headers[key] forHTTPHeaderField:key];
    }
    method = method ?: @"GET";
    [request setHTTPMethod:method.uppercaseString];
    if (params) {
        NSError *error;
        NSData *body = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
        [request setHTTPBody:body];
    }
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                    if (error) {
                        completionHandler(nil, error);
                        return;
                    }
                    NSError* error1;
                    id json = [NSJSONSerialization JSONObjectWithData:data
                                                              options:kNilOptions
                                                                error:&error1];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completionHandler(json, error1);
                    });
                }] resume];
}
@end
