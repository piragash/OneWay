//
//  TransferStatus.h
//  objective-curl
//
//  Copyright 2010 Nick Jensen <http://goto11.net>
//

typedef enum {
	TRANSFER_STATUS_QUEUED = 1,
	TRANSFER_STATUS_CONNECTING,
	TRANSFER_STATUS_CONNECTED,
	TRANSFER_STATUS_UPLOADING,
	TRANSFER_STATUS_COMPLETE,
	TRANSFER_STATUS_CANCELLED,
	TRANSFER_STATUS_LOGIN_DENIED,
	TRANSFER_STATUS_FAILED
} TransferStatus;
