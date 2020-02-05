package electron;
/**
	@see http://electronjs.org/docs/api/crash-reporter
**/
@:jsRequire("electron", "crashReporter") extern class CrashReporter extends js.node.events.EventEmitter<electron.CrashReporter> {
	/**
		You are required to call this method before using any other `crashReporter` APIs and in each process (main/renderer) from which you want to collect crash reports. You can pass different options to `crashReporter.start` when calling from different processes.
		
		**Note** Child processes created via the `child_process` module will not have access to the Electron modules. Therefore, to collect crash reports from them, use `process.crashReporter.start` instead. Pass the same options as above along with an additional one called `crashesDirectory` that should point to a directory to store the crash reports temporarily. You can test this out by calling `process.crash()` to crash the child process.
		
		**Note:** If you need send additional/updated `extra` parameters after your first call `start` you can call `addExtraParameter` on macOS or call `start` again with the new/updated `extra` parameters on Linux and Windows.
		
		**Note:** On macOS and windows, Electron uses a new `crashpad` client for crash collection and reporting. If you want to enable crash reporting, initializing `crashpad` from the main process using `crashReporter.start` is required regardless of which process you want to collect crashes from. Once initialized this way, the crashpad handler collects crashes from all processes. You still have to call `crashReporter.start` from the renderer or child process, otherwise crashes from them will get reported without `companyName`, `productName` or any of the `extra` information.
	**/
	static function start(options:{ var companyName : String; /**
		URL that crash reports will be sent to as POST.
	**/
	var submitURL : String; /**
		Defaults to `app.name`.
	**/
	@:optional
	var productName : String; /**
		Whether crash reports should be sent to the server. Default is `true`.
	**/
	@:optional
	var uploadToServer : Bool; /**
		Default is `false`.
	**/
	@:optional
	var ignoreSystemCrashHandler : Bool; /**
		An object you can define that will be sent along with the report. Only string properties are sent correctly. Nested objects are not supported. When using Windows, the property names and values must be fewer than 64 characters.
	**/
	@:optional
	var extra : Record; /**
		Directory to store the crash reports temporarily (only used when the crash reporter is started via `process.crashReporter.start`).
	**/
	@:optional
	var crashesDirectory : String; }):Void;
	/**
		Returns the date and ID of the last crash report. Only crash reports that have been uploaded will be returned; even if a crash report is present on disk it will not be returned until it is uploaded. In the case that there are no uploaded reports, `null` is returned.
	**/
	static function getLastCrashReport():electron.CrashReport;
	/**
		Returns all uploaded crash reports. Each report contains the date and uploaded ID.
	**/
	static function getUploadedReports():Array<electron.CrashReport>;
	/**
		Whether reports should be submitted to the server. Set through the `start` method or `setUploadToServer`.
		
		**Note:** This API can only be called from the main process.
	**/
	static function getUploadToServer():Bool;
	/**
		This would normally be controlled by user preferences. This has no effect if called before `start` is called.
		
		**Note:** This API can only be called from the main process.
	**/
	static function setUploadToServer(uploadToServer:Bool):Void;
	/**
		Set an extra parameter to be sent with the crash report. The values specified here will be sent in addition to any values set via the `extra` option when `start` was called. This API is only available on macOS and windows, if you need to add/update extra parameters on Linux after your first call to `start` you can call `start` again with the updated `extra` options.
	**/
	static function addExtraParameter(key:String, value:String):Void;
	/**
		Remove a extra parameter from the current set of parameters so that it will not be sent with the crash report.
	**/
	static function removeExtraParameter(key:String):Void;
	/**
		See all of the current parameters being passed to the crash reporter.
	**/
	static function getParameters():Void;
	/**
		The directory where crashes are temporarily stored before being uploaded.
	**/
	static function getCrashesDirectory():String;
}
@:enum abstract CrashReporterEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
