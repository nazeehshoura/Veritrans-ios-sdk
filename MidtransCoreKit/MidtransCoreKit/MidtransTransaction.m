//
//  VTTransactionData.m
//  iossdk-gojek
//
//  Created by Akbar Taufiq Herlangga on 3/3/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import "MidtransTransaction.h"

@interface MidtransTransaction()

@property (nonatomic, readwrite) id paymentDetails;
@property (nonatomic, readwrite) MidtransTransactionTokenResponse *token;

@end

@implementation MidtransTransaction

- (instancetype)initWithPaymentDetails:(id<MidtransPaymentDetails>)paymentDetails token:(MidtransTransactionTokenResponse *)token {
    if (self = [super init]) {
        self.paymentDetails = paymentDetails;
        self.token = token;
    }
    return self;
}

- (NSDictionary *)dictionaryValue {
    return self.paymentDetails.dictionaryValue;
}

- (NSString *)paymentType {
    return self.dictionaryValue[@"payment_type"];
}

- (NSString *)chargeURL {
    return [NSString stringWithFormat:ENDPOINT_CHARGE, self.token.tokenId];
}

@end
