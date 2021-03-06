package hex.runtime.basic;

import hex.core.AbstractApplicationContext;
import hex.core.IApplicationContext;
import hex.di.IBasicInjector;
import hex.di.IDependencyInjector;
import hex.di.Injector;
import hex.log.ILogger;
import hex.log.LogManager;
import hex.module.IContextModule;

/**
 * ...
 * @author Francis Bourre
 */
class ModularContext extends AbstractApplicationContext
{
	@:allow( hex.runtime, hex.metadata )
	@:keep
	function new( applicationContextName : String )
	{
		//build injector
		this._injector = new Injector();
		this._injector.mapToValue( IBasicInjector, this._injector );
		this._injector.mapToValue( IDependencyInjector, this._injector );
		
		var logger = LogManager.getLogger( applicationContextName );
		this._injector.mapToValue( ILogger, logger );
		
		//register applicationContext
		this._injector.mapToValue( IApplicationContext, this );
		this._injector.mapToValue( IContextModule, this );

		super( null, applicationContextName );
	}
	
	override public function getLogger() return this._injector.getInstance( ILogger );
}