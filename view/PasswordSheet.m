//
//  PasswordSheet.m
//  OneWay
//
//  Copyright 2010 Nick Jensen <http://goto11.net>
//

#import "PasswordSheet.h"
#import "OWConstants.h"
#import <objective-curl/CurlClientType.h>


@implementation PasswordSheet


@synthesize upload;
@synthesize numberInQueue;
@synthesize savePassword;


- (id)init
{
	if (self = [super initWithWindowNibName:@"PasswordSheet" owner:self])
	{
		[self setSavePassword:YES];
	}
	return self;
}


- (void)dealloc
{
	[upload release];
	[super dealloc];
}


- (void)awakeFromNib
{
	[self updateTitle];
	[self updateLabels];
}


- (void)setUpload:(Upload *)aUpload
{
	if (aUpload != upload)
	{
		[upload release];
		upload = [aUpload retain];
		

		[self updateLabels];
		[self updateTitle];
	}
}


- (void)updateTitle
{
	if ([upload usePublicKeyAuth])
	{
		[titleLabel setStringValue:@"Private key is password protected"];
		[subtitleLabel setStringValue:@"Enter the passphrase for the private key file"];  
	}
	else
	{
		[titleLabel setStringValue:@"Invalid Login"];
		NSString *path = [[upload hostname] stringByAppendingPathComponent:[upload path]];
		[subtitleLabel setStringValue:[NSString stringWithFormat:@"Enter login for %@", path]];
	}
}


- (IBAction)usePublicKeyAuthPressed:(id)sender
{
	if ([sender state] == NSOnState)
	{		
		NSOpenPanel* openDlg = [NSOpenPanel openPanel];
		
		[openDlg setCanChooseFiles:YES];
		[openDlg setCanChooseDirectories:NO];
		[openDlg setTitle:@"Select Private Key"];
		
		NSString *sshDir = [@"~/.ssh" stringByExpandingTildeInPath];
		
		if ([openDlg runModalForDirectory:sshDir file:nil] == NSOKButton)
		{
			if ([[openDlg filenames] count] == 1)
			{
				NSString *privateKeyPath = [[openDlg filenames] objectAtIndex:0];
				NSString *publicKeyPath = [NSString stringWithFormat:@"%@.pub", privateKeyPath];
				
				[upload setUsePublicKeyAuth:YES];
				[upload setPrivateKeyFile:privateKeyPath];
				[upload setPublicKeyFile:publicKeyPath];
			}
		}		
	}
	else
	{
		[upload setUsePublicKeyAuth:NO];
		[upload setPrivateKeyFile:nil];
		[upload setPublicKeyFile:nil];		
	}
	
	[self updateTitle];
	[self updateLabels];
}


- (void)updateLabels
{
	if ([upload clientType] == CURL_CLIENT_S3) {

		[usernameLabel setStringValue:S3USERNAME_LABEL];
		[passwordLabel setStringValue:S3PASSWORD_LABEL];
	}
	else if ([upload clientType] == CURL_CLIENT_SFTP) {

		[usernameLabel setStringValue:USERNAME_LABEL];
		
		if ([upload usePublicKeyAuth]) {
			[passwordLabel setStringValue:PASSPHRASE_LABEL];
		}
		else {
			[passwordLabel setStringValue:PASSWORD_LABEL];
		}
	}
	else
	{
		[usernameLabel setStringValue:USERNAME_LABEL];
		[passwordLabel setStringValue:PASSWORD_LABEL];
	}
}


- (IBAction)closeSheetOK:(id)sender
{	
	[NSApp endSheet:[self window] returnCode:1];
	[[self window] orderOut:nil];
}


- (IBAction)closeSheetCancel:(id)sender
{
	[NSApp endSheet:[self window] returnCode:0];
	[[self window] orderOut:nil];
}

- (IBAction)closeSheetCancelAll:(id)sender
{
	[NSApp endSheet:[self window] returnCode:-1];
	[[self window] orderOut:nil];
}


@end
