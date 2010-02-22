/*
 * OWConstants
 */

#import "OWConstants.h"

// App Name
NSString * const OWApplicationName = @"OneWay";

// Log File
NSString * const OWLogFile = @"~/Library/OneWay/OneWay.log";

// Notifications
NSString * const OWQueueTransferNotification	= @"OneWayQueueTransferNotification";
NSString * const OWQueueNewTransferNotification = @"OneWayQueueNewTransferNotification";

// Files & Directories
NSString * const OWSettingsDirectory	= @"~/Library/OneWay";
NSString * const OWPluginDirectory		= @"~/Library/Contextual Menu Items";
NSString * const OWSavedLocationsFile	= @"~/Library/OneWay/locations.data";
NSString * const OWSavedTransfersFile	= @"~/Library/OneWay/transfers.data";
NSString * const OWMenuItemsFile		= @"~/Library/OneWay/.menuItems";

// Script Locations
NSString * const OWRestartFinderScript = @"Contents/Resources/restart_finder.sh";

// Plugin Source/Destination
NSString * const OWPluginSourceFile			= @"Contents/Resources/OneWayPlugin.plugin";
NSString * const OWPluginDestinationFile	= @"~/Library/Contextual Menu Items/OneWay.plugin";

// Toolbar Identifier
NSString * const OWTransferToolbarIdentifier = @"OneWayTransferToolBarIdentifier";
NSString * const OWLocationToolbarIdentifier = @"OneWayLocationToolBarIdentifier";

NSString * const OWShowTransfersMenuItem	= @"OneWayShowTransfersMenuItem";
NSString * const OWRetryTransfersMenuItem	= @"OneWayRetryTransfersMenuItem";
NSString * const OWStopTransfersMenuItem	= @"OneWayStopTransfersMenuItem";
NSString * const OWClearTransfersMenuItem	= @"OneWayClearTransfersMenuItem";

NSString * const OWShowLocationsMenuItem	= @"OneWayShowLocationsMenuItem";
NSString * const OWCreateLocationMenuItem	= @"OneWayCreateLocationMenuItem";
NSString * const OWUpdateLocationMenuItem	= @"OneWayUpdateLocationMenuItem";
NSString * const OWDeleteLocationMenuItem	= @"OneWayDeleteLocationMenuItem";

NSString * const OWTestMenuItem				= @"OneWayTestMenuItem";