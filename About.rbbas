#tag Module
Protected Module About
	#tag Note, Name = About
		This is the open source "MacOSLib", a collection of classes to interface Mac OS X functions
		
		Original sources are located here:  https://github.com/macoslib/macoslib
		
		Requires REALbasic 2011r1 or later and MacOS X 10.5 or later. See Compatibility.
	#tag EndNote

	#tag Note, Name = Compatibility
		COMPATIBILITY WITH REAL STUDIO AND XOJO
		
		macoslib.rbvcp v147 (i.e. running the full project):
		    REAL Studio 2010r5 and below   NOT COMPATIBLE
		    REAL Studio 2011r1 to 2011r3   COMPATIBLE with limitations (you will see it immediately as the splash window is not transparent as it should)
		    REAL Studio 2011r4 and later     COMPATIBLE
		    Xojo 2013r1 and later                 COMPATIBLE
		
		macoslib library v147 (i.e. a project containing the "macoslib" & the "Additional Modules" folders and running it):
		    REAL Studio 2010r5 and below   DOES NOT COMPILE
		    REAL Studio 2011r1 to 2011r3   RUNS but some limitations are to be expected
		    REAL Studio 2011r4 and later     RUNS
		    Xojo 2013r1 and later                 RUNS
	#tag EndNote

	#tag Note, Name = Contributors
		Charles Yeomans (CY)
		Thomas Tempelmann (TT)
		Stéphane Mons (SM)
		Kem Tekinay (KT)
		Vidal van Bergen (VVB)
	#tag EndNote

	#tag Note, Name = Documentation
		Some documentation is accessible from macoslib. Run the project and choose one document.
		The macoslib documentation is provided inside macoslib itself.
	#tag EndNote

	#tag Note, Name = How To Use
		To add MacOSLib to your project, select the entire "macoslib" folder in this project, copy it and paste
		it into your project. Do not attempt to import (or drag+drop) the folder from disk into your project,
		as the IDE will mess the class hierarchy up, causing lots of compile errors.
		
		If you find that the macoslib is too large for your needs, don't worry - the compiler will only include
		the code for classes you actually use in your project, so your project won't grow just because you include
		macoslib without using any of its features (well, that's the theory, at least).
		
		You may try to remove unused classes and modules gradually after you figure out you won't need them,
		but please start with the entire macoslib folder to save you trouble initially.
	#tag EndNote

	#tag Note, Name = License
		The present library is distributed under the terms of the MIT License.
		
		See: http://opensource.org/licenses/mit-license.php
	#tag EndNote

	#tag Note, Name = Release Notes
		These release notes were added as of version 100. Check the git history at https://github.com/macoslib/macoslib
		for previous release notes. Contributors are identified by initials. See the "Contributors" note for full names.
		
		When you make changes, add new notes above existing ones, and remember to increment the Version constant.
		
		166: 2013-12-11 by CY
		-NSWIndow.AnimationBehavior no longer raises an ObjCException in MacOS 10.6; instead the Set handler is a no-op and the Get handler returns NSWindowAnimationBehaviorDefault.
		
		165: 2013-12-04 by CY
		-Refactor CFArray, CFMutableArray, CFAttributedString, CFBundle to use CFTypeRef.
		
		164: 2013-11-25 by CY
		- Rewrite CFUUID; fix a bug in CFType.RefCount introduced in refactoring.
		
		163: 2013-11-24 by CY
		
		- Refactor CFBoolean; deprecate CFBoolean.Constructor and CoreFoundation.CFBoolean; 
		  add CFBoolean.Get to create from a Boolean value; update other code to reflect CFBoolean changes.
		
		162: 2013-11-24 by CY
		
		- Introduce a CFTypeRef structure to Core Foundation.  This is intended to replace the use of Ptr in Core Foundation
		  external functions.
		- Add corresponding CFType methods (i.e. Constructor, NewObject, Operator_Convert) and deprecate those that use Ptr.
		- Delete CFType shared methods Retain, Release, RefCount.
		
		161: 2013-11-04 by TT
		- Makes NSUserDefaults.StandardUserDefaults actually work.
		- Makes App run in Carbon again without raising an exception in CGImage.MakePicture.
		- Fixes NotificationObserver and NSWorkspace.RegisterNotifications to retain the notification center properly.
		- Fixes NSWorkspace.NSStringConstant to not crash any more. This also fixes the crashes in NSWorkspaceEventsExample.
		- CFBundle.NewCFBundleFromID now returns nil for invalid IDs.
		- Makes QTKit.BundleID and QTKit.Framework protected to prevent them accidentally used globally.
		- Moves all TestSelf methods into the App class.
		
		160: 2013-11-19 by VVB
		- Some typo corrections for the French localization of macoslib by Eric de La Rochette.
		
		159: 2013-11-04 by TT
		- Made NSURL more efficient by eliminating several superfluous calls to Cocoa.StringConstant and
		   Cocoa.NSObjectFromNSPtr.
		
		158: 2013-11-04 by KT
		- Added #if Target... pragmas for methods that had been missing them.
		- Checked compilation for Carbon, Cocoa, Windows, and Linux.
		
		157: 2013-10-31 by KT
		- Added pragmas for unused method parameters.
		- Changed NSDictionary to accept and return NativeSubclass.DictionaryCaseSensitive instead of the native Dictionary.
		- In NSDictionary/CFDictionary, swapped VariantValue and Operator_Convert code to avoid unnecessary conversion to Variant.
		- Added #if TargetMacOS to CFDictionary.Operator_Convert.
		- Added optimization to NSDictionary.Operator_Convert.
		- Verified ability to compile for Windows, Cocoa, and Carbon in Real Studio 2012.
		 
		156: 2013-10-26 by KT
		- Changed name of convenience classes from NSRegEx to MacRegEx.
		- Added MacSystemProfiler.CurrentSSID shared method as convenience.
		
		155: 2013-10-18 by KT
		- Added pragmas for unused variables and parameters.
		- Corrected bug that prevented non-Mac compiles.
		- Changed remaining NewMemoryBlock to new MemoryBlock.
		- Coached warning about 64-bit compatibility to prevent it from showing up when not compiling for 64-bit.
		- Confirmed ability to compile in Windows, Carbon, and Cocoa in Xojo and Real Studio 2012.
		
		154: 2013-10-18 by KT
		- Added NSRegEx classes to Additional Modules.
		
		153: 2013-10-05 by SM
		- Removed dependency of some macoslib methods on StringExtensions or DebugReport.
		- Rebased PDFView on CanvasForNSView.
		- Implemented events to PDFView from NSNotifications: DocumentChanged, PageChanged, ScaleChanged, SelectionChanged, HistoryChanged, DisplayModeChanged.
		- NSObject: added Superclass and PerformSelectorOnMainThread (untested).
		- Enabled the close widget of the Welcome to macoslib window. Window can be opened from the Help menu.
		- Added PDFView and PDFThumbnailView which work together to display, edit and print a PDFDocument.
		- Display of built-in PDFs are now using the "single-page continuous" option and has a thumbnail view. The documents can also be printed.
		- Documented PDFView and PDFThumbnailView in the Macoslib Overview docs.
		- Created a CanvasForNSView object to serve as a parent class for all NSView subclasses using a Canvas at the Xojo level.
		- Applied the new CanvasForNSView object to PDFThumbnailView, as a test.
		- Created module macoslib_32_64bits_savviness in Misc. folder to hold 64bits compatibility functions:
		    - SizeOfInteger and SizeOfPointer return the size of an Integer or a Pointer.
		    - bsPtrValueFromCArray, bsIntegerValueFromCArray return a Ptr or Integer in 32/64 bits given a C-Array index.
		    - bsPtrValue, bsIntegerValue return a Ptr or Integer in 32/64 bits given the offset.
		- Methods using SizeOfPointer now raise a warning at compilation time. This could be improved later.
		- Stripped off most of my dead code. For work in progress, made clearer why some code is commented out, per TT's recommendation.
		- Set "FPtr" function as a global function in the new macoslibModule and removed multiple definitions of it as Shared Methods.
		- For CanvasForNSView, created a LoadRequiredFrameworks which will ask for and load all the required frameworks. It can be called several times and returns more quickly than RequireFramework.
		
		152: 2013-10-16 by CY
		-Fix a bug in LaunchServices.SendURLToApplication.
		
		151: 2013-09-28 by SM
		- Implemented most of the ImageKit IKImageBrowserView with all the necessary IK classes: IKImageBrowserCell, IKImageBrowserItem, IKImageBrowserDataSource.
		- Set SizeOfInteger as a global method in Cocoa
		- Fixed NSEvent.MouseLocation which was incorrectly implemented as an instance method
		- Overloaded NSEvent.locationRelativeToNSView so it can work with something else than a NSControl
		- Fixed NSIndexSet.Operator_Convert
		- Slight modifications to DebugReport
		
		150: 2013-09-30 by TT
		- ResourceForkReplacement: Fixes potential crashes in GetResource etc. by properly detecting unavailable resources.
		
		149: 2013-09-19 by SM
		- Fixed serious bugs in ImageKit (which was completely broken).
		- Expanded the "macoslib Overview" document.
		- Process.psn is now gettable
		- Started implementing the NSFileManager and NSDirectoryEnumerator
		- Added NSKnobSlider as subclass of NSSlider
		- Added an example window for NSSliders
		
		148: 2013-09-11 by KT
		- Added NSRegularExpression and NSTextCheckingResult classes.
		- Added Cocoa.NSIntegerMax and Cocoa.NSNotFound methods as pseudo-constants.
		- Replaced some deprecated calls in case they are removed by a newer version of Xojo.
		- Added NSError.Operator_Convert to a MacOSError so you can raise new NSError( id, true ).
		- Removed or added pragmas for unused variables and parameters.
		- Corrected Windows/Linux compile issue.
		
		147: 2013-09-07 by SM
		- Fixed a potential bug reported by KT.
		- Users can now click on the splash window to go immediately to the default window.
		- Improved compatibility with REAL Studio before 2012r2 (Str with 2 parameters & use of Target32Bit).
		- Expanded the "macoslib Overview" document.
		- Sorted the Examples windows by alphabetical order.
		Amended:
		- Small fixes to make the project compatible with RS 2011.x.
		- Tested the current version with every RS version and added the result into About.Compatibility Note.
		- Removed some unnecessary stuff, thanks to TT.
		
		146: 2013-09-04 by SM
		- Added documentation files (in both .docx and .pdf formats) to provide a quick start guide to users (only the
		    PDF file is displayed by macoslib. The docx documents are provided to modify the documentation).
		- The way PDF documents are displayed should be improved.
		- Added a default window to welcome users when they run macoslib. It offers links to the basic documentation
		    but also to documents for beginners, advanced users and experts.
		- Added a splash window to show the capabilities of macoslib but it should be improved.
		- Modified the minimum requirements in the About module.
		- Modified PropertyList inside DebugReportModule so it can handle binary PropertyLists.
		
		
		146: 2013-08-24 by VVB
		- Added NSAlert, NSButton NSControl, NSSharingService/Picker, NSPopover, NSViewController, NSWindowController, NSPanel, filled out NSView, NSControl, NSApplication.
		- Added constructor from Ptr and WithFrame to NSControl, and added convienience methods to get the NSObject and NSView.
		- Added convienience extensions for window to return NSWindow, for control to return NSControl and return NSView.
		- Added ShareTemplate to SystemIcons and NSImage.
		- Added missing images to system images example.
		
		145: 2013-08-11 by VVB
		- Added NSUserNotification/Center and example.
		- Added NSMenu Delegates.
		- Made it slightly easier to call on NSDockTile.
		- Filled out NSEvent a bit.
		- SegmentedControlExtension enumerations shortened.
		
		144: 2013-08-01 by KT
		- Fixed bug when setting NSWindow.RepresentedFile to nil.
		- Fixed bug when setting NSWindow.RepresentedURL to nil.
		- Fixed bug in NSArray.CreateFromObjectsArray.
		- Added methods to NSLayoutManager and NSTextStorage.
		
		143: 2013-07-31 by SM & VVB & CY
		- Added NSByteCountFormatter.
		- Now using NSByteCountFormatter in StringExtension.FormatSize if you're on Mac OS X 10.8+ and using a postive value.
		- StringExtension.FormatSize now mimics Apple's NSByteCountFormatter if on Mac OS X 10.7 and below.
		
		143: 2013-07-29 by KT
		- Added functions/properties to NSTextView.
		- Added NSTextStorage class.
		- Changed some methods into properties to allow access during debugging.
		- Added convenience functions to TextAreaExtension to set and remove font
		background color.
		- Added pragmas for unused variables/parameters.
		- Fixed some code for compiling in Carbon/Windows.
		
		142: 2013-07-29 by VVB
		- Better NSWindow fullscreen methods.
		- Added convenience methods for NSWindow CollectionBehaviors.
		- Added more examples to the NSWindow example.
		- Added more colors to the colorbrowser example.
		
		141: 2013-07-22 by VVB
		- Merged the vallebox project back into the most recent version of macoslib with a few slight modifications here and there.
		  (http://code.google.com/r/vallebox--macoslib/)
		
		140: 2013-07-18 by KT
		- Added properties to NSWindow for BackingScaleFactor, DocumentEdited, MovableByWindowBackgound, 
		  RepresentedFile, RepresentedFilename, and RepresentedURL.
		- Added Constructor and Operator_Convert to NSWindow to allow assignment of a native window.
		- Added NSObject.RespondsToSelector method.
		- Added NSWindowExample window.
		- Modified convenience methods to take advantage of new NSWindow properties.
		
		139: 2013-07-17 by KT
		- Minor changes to WindowExtensions.ScalingFactor. 
		139: 2013-07-09 by VVB
		- Added dutch translation.
		- Added window lion fullscreen methods and menu item.
		- Added help menu to get the auto search menu item.
		- Added some new constructors to NSImage.
		- Added Operator_Convert from Picture to NSImage.
		- Added isTemplate option to NSImage.
		- Set NSIMage size using with/height double values.
		- Made the NSObject.allocate method a little more flexible.
		
		138: 2013-07-08 by KT
		- Added pragmas for unused variables in various methods.
		
		137: 2013-07-07 by KT
		- Changed FileManager code to utilitize FolderItem.NativePath functions in Xojo.
		- Changed FileManager.NativePath from Global "extends" function to Public with parameter.
		- Changed local variable declarations in two methods from "str" to "s" to avoid confusion with the native function Str.
		
		136: 2013-07-07 by CY
		- Moved AddressBook out of Cocoa into AB module.
		
		135: 2013-07-06 by KT
		- Changed constant name in MacSystemProfiler to kSystemProfilerShellPath for clarity.
		- Copied GetFolderItemFromPOSIXPath from Cocoa to FileManager and made it Global.
		- Deprecated Cocoa.GetFolderItemFromPOSIXPath.
		
		134: 2013-07-05 by SM
		- Added link to Docgen wiki to About.
		- Removed ShellPath from FSEvent.
		- Set computed variables to static in StringExtension.FormatSize.
		
		133: 2013-07-03 by KT
		- Added pragmas for unused method parameters.
		- Added Contributors note.
		
		132: 2013-07-02 by VVB
		- Added ScalingFactor method.
		
		131: 2013-07-01 by KT
		- Changed methods/properties that started with "_" so they won't.
		  New convention is that public methods/properties will simply be marked as "hidden",
		  and private/protected ones will start with "m_".
		
		130: 2013-05-30 by TT
		- Add CarbonDragManager along with Example. This makes the Drop Location available to Cocoa apps
		
		129: 2013-05-25 by CCY 
		- Add NSTask class; fix a bug in ExtendedAttributesExtensions.libcErrorCode that prevented Linux/Windows builds.
		
		128: 2013-05-20 by KT 
		- Fixed unused variables/parameters.
		
		127: 2013-05-20 by CCY
		- Added an example that loads the application icon into an NSImage, and demonstrates how to draw it into an Rb Graphics object,
		  including flipping.
		- Added NSAffineTransform
		- Modified NSGraphicsContext and NSImage.
		
		126: 2013-05-14 by TT
		- Fixed a few places where Names of RB's MenuItems were used to look up items in Cocoa, and that did
		  fail if the name contained a "&"
		
		125: 2013-04-03 by KT
		- Converted StaticText, EditField to modern equivalents.
		
		124: 2013-03-19 by KT
		- Fixed compiler error when not TargetCocoa
		- Removed unused variables and method params.
		
		123: 2013-03-18 (give or take) by CY
		- Various changes and additions.
		
		122: 2013-01-25 by KT
		- Changes to MacPListBrowser.
		- Fixed problem that was preventing compile in Real Studio 2012r2.1.
		
		121: 2013-01-20 by KT
		- Added MacSystemProfiler class to Additional Modules.
		- Added Carbon.VersionAsInteger to standardize version-to-integer conversions. (Moved code from SystemVersionAsInt.)
		- Modified Carbon.SystemVersionAsInt to use Carbon.VersionAsInteger. No change in functionality.
		- Added Carbon.IsMountainLion.
		- Modified MacPListBrowser.
		
		120: 2012-12-13 by TT
		- Added FolderItem.OpenMacResourceFork as a replacement for f.OpenResourceFork
		
		119: 2012-12-12 by KT
		- Removed legal notice from NativeSubclass.DictionaryCaseSensitive.
		- Added lines to prevent compiler from complaining about unused variables.
		
		118: 2012-12-11 by KT
		- Added NativeSubclass module to house subclasses of native types.
		- Added NativeSubclass.DictionaryCaseSensitive.
		- Changed output from CFDictionary.VariantValue and related methods to return a NativeSubclass.DictionaryCaseSensitive.
		  (Note: This is a Dictionary subclass so existing code will not need to change.)
		- Optimized code that converts CFDictionary to and from Dictionary.
		- Added #pragmas for unused "areas" parameter in Paint events in 2012r2 and later.
		
		117: 2012-12-11 by TT
		- Adds "MacResourceFork" as a replacement for the ResourceFork class that's removed in RB 2012r2
		- Adds some notes and tests around getting the app's Bundle Identifier
		
		116: 2012-12-01 by KT
		- Added caching for System.IsFunctionAvailable calls.
		- CoreFoundation.TestSelf: Created switches as constants for each test category.
		- CFBundle.Load: Removed older system function check and call, raise any returned CFError as an exception.
		- ATSFont.File: Added check for older function because the documentation for both functions seems to have 
		  dropped off of Apple's site except for a PDF that says it's all deprecated as of OS X 10.6 in favor of 
		  Core Text.
		- Win32Error.FormatErrorMessage: Added caching and checks for both system functions, just to be safe.
		
		115: 2012-12-01 by CY
		- Remove assignment to NSControl.AcceptFocus; update NSSearchField1 pro…
		- Fix a bug in NSSearchField.MaxRecentSearches.
		
		114: 2012-11-30 by KT
		- CoreFoundation.Write: Added CFPropertyListWrite to replace the deprecated CFPropertyListWriteToStream.
		- CoreFoundation.XMLValue: Added code for CFPropertyListCreateData to replace deprecated CFPropertyListCreateXMLData.
		- Added some comments.
		- Added option to MacPListBrowser.SaveToFile to allow saving as binary.
		- Added more unused method parameter pragmas.
		- Added XMLValue as alias for PListStringValue in MacPListBrowser.
		
		113: 2012-11-29 by CY
		- Attempt to get NSSearchField to participate in key-view loop.
		
		112: 2012-11-28 by KT
		- Updated DICT_CaseSensitiveDictionary in Additional Modules.
		- Minor spelling fixes in comments.
		
		111: 2012-11-24 by KT
		- Added DICT_CaseSensitiveDictionary to Additional Modules.
		- Added case-sensitive options to MacPListBrowser. (Now requires DICT_CaseSensitiveDictionary.)
		- Fixed minor bugs in MacPListBrowser.
		- Added ability to convert CFType to MacPlistBrowser.
		- Fixed minor Windows compilation bug.
		- Added pragmas for unused method parameters.
		
		110: 2012-10-16 by KT
		- Added BooleanValue to CFBoolean.
		- Added Constructor( Boolean) to CFBoolean.
		- Added Operator_Compare and Operator_Convert functions to CFBoolean.
		- Added DateValue to CFDate.
		- Ensured that viewing the properties of a CFURL of a file that doesn't exist won't crash the debugger.
		- Added Exists property to CFURL.
		
		109: 2012-10-15 by KT
		- Minimum supported OS is now MacOS X 10.5.
		- Added methods for resolving alias to CFURL.
		- Added optional parameter to CFURL.Constructor( FolderItem ) to specify that the given alias should be resolved first.
		- Added a bunch of properties to CFURL.
		- Added Operator_Compare and Operator_Convert methods to CFDate.
		- Added Operator_Compare and Operator_Convert methods to CFNumber.
		- Added Operator_Compare methods to CFString.
		- Started removing "soft" from function declarations where the call had been introduced in OS X 10.5 or earlier.
		- CFError can now be raised as an Exception (will generate a MaxOSError Exception). Use like this when ErrorRef is returned from system call:
		     if errorRef <> nil then raise new CFError( errorRef, CFType.HasOwnership )
		- Cleaned up unused local variables.
		
		108: 2012-09-08 by SM
		- Implemented all the ImageCaptureCore Cocoa classes to detect and manage cameras, iPhones and iPods. They are lower-level than
		     their ImageKit counterparts (introduced in v.107), i.e. more powerful but more difficult to implement. ImageCapture includes the following classes: ICDeviceBrowser,
		     ICDevice (children ICCameraDevice and ICScannerDevice), ICCameraItem (children ICCameraFolder, ICCameraFile). Some functions like deletion and uploading are
		     not available.
		     Scanner objects are not implemented.
		- Added a License note in the About module (the license terms were only available on the website)
		
		107: 2012-09-02 by SM
		- Implemented ImageKit classes to use scanners and cameras: IKDeviceBrowserView; IKScannerDeviceView, IKCameraDeviceView
		- Implemented example windows for ImageKit
		- Partially implemented ImageCaptureCore classes necessary to support ImageKit (ICDevice, ICScannerDevice, ICCameraDevice…). They should not be used at the moment.
		- Implemented NSUserDefaults
		- Added convenience functions to store/retrieve window frames from the preferences
		
		106: 2012-08-23 by SM
		- Fixed memory leak with MacSpeechSynthesizer. (thank to Charles for finding the problem)
		- Extended MDItem (CreateFromFile, AllAttributes)
		- Added MacOSFolderItemExtension SpotlightMetadata which returns all the metadata for a file as a Dictionary
		- Extended NSDictionary.Value and NSMutableDictionary.Value to accept a key as variant
		- Added optional class checking in the NSObject Constructor
		- Many improvements in NSAttributedString and its mutable counterpart, though there is still much work to be done
		
		105:
		- Moved M_PList module into "Convenience extensions and objects folder" within macoslib.
		
		104:
		- Added AssertionModule in the Exception Classes folder with AssertPtr and AssertOSVersion
		- Started adjusting code to the OS version the application is running on.
		
		103:
		- Corrected bugs in NSString.
		- Added pathExtension method to NSString and NSURL.
		- Added pragmas for unused variables.
		
		102:
		- Modified MacOSFolderItemExtension.Extension to better identify extensions.
		- Modified MacOSFolderItemExtension.NameNoExtension to leverage code in Extension to properly identify the name.
		- Added pragmas for unused variables in Windows/Linux.
		
		101:
		- Added NSFileHandle and NSPipe classes.
		
		100:
		- Added About.Version constant and these release notes.
		- Changed FileManager.StringValue to return UTF16.
		- Modified MacIcon to use new value from FileManager.StringValue.
		- Added FileManager.StringValue( Extends s As HFSUniStr255 ) to overload the native structure's StringValue.
	#tag EndNote


	#tag Constant, Name = Version, Type = Double, Dynamic = False, Default = \"166", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
