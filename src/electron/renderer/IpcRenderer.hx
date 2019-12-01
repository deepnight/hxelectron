package electron.renderer;
/**
	@see http://electronjs.org/docs/api/ipc-renderer
**/
@:jsRequire("electron", "ipcRenderer") extern class IpcRenderer extends js.node.events.EventEmitter<electron.renderer.IpcRenderer> {
	/**
		Listens to `channel`, when a new message arrives `listener` would be called with `listener(event, args...)`.
	**/
	static function on(channel:String, listener:haxe.Constraints.Function):Void;
	/**
		Adds a one time `listener` function for the event. This `listener` is invoked only the next time a message is sent to `channel`, after which it is removed.
	**/
	static function once(channel:String, listener:haxe.Constraints.Function):Void;
	/**
		Removes the specified `listener` from the listener array for the specified `channel`.
	**/
	static function removeListener(channel:String, listener:haxe.Constraints.Function):Void;
	/**
		Removes all listeners, or those of the specified `channel`.
	**/
	static function removeAllListeners(channel:String):Void;
	/**
		Send a message to the main process asynchronously via `channel`, you can also send arbitrary arguments. Arguments will be serialized as JSON internally and hence no functions or prototype chain will be included.
		
		The main process handles it by listening for `channel` with the `ipcMain` module.
	**/
	static function send(channel:String, args:haxe.extern.Rest<Any>):Void;
	/**
		Resolves with the response from the main process.
		
		Send a message to the main process asynchronously via `channel` and expect an asynchronous result. Arguments will be serialized as JSON internally and hence no functions or prototype chain will be included.
		
		The main process should listen for `channel` with `ipcMain.handle()`.
		
		For example:
	**/
	static function invoke(channel:String, args:haxe.extern.Rest<Any>):js.lib.Promise<Any>;
	/**
		The value sent back by the `ipcMain` handler.
		
		Send a message to the main process synchronously via `channel`, you can also send arbitrary arguments. Arguments will be serialized in JSON internally and hence no functions or prototype chain will be included.
		
		The main process handles it by listening for `channel` with `ipcMain` module, and replies by setting `event.returnValue`.
		
		**Note:** Sending a synchronous message will block the whole renderer process, unless you know what you are doing you should never use it.
	**/
	static function sendSync(channel:String, args:haxe.extern.Rest<Any>):Any;
	/**
		Sends a message to a window with `webContentsId` via `channel`.
	**/
	static function sendTo(webContentsId:Float, channel:String, args:haxe.extern.Rest<Any>):Void;
	/**
		Like `ipcRenderer.send` but the event will be sent to the `<webview>` element in the host page instead of the main process.
	**/
	static function sendToHost(channel:String, args:haxe.extern.Rest<Any>):Void;
}
@:enum abstract IpcRendererEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
