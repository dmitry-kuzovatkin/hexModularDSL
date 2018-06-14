package;

import com.hello.*;
import com.bye.*;

/**
 * ...
 * @author Francis Bourre
 */
class Main
{
    static public function main() : Void
    {
		var assembler = new hex.runtime.ApplicationAssembler();
		
		hex.compiletime.flow.modular.FlowCompiler2.compile( assembler, 
			'hello.flow' ).then(
			function( code ) 
			{
				code.execute();
				trace( code.locator.hello.sayHello( 'Francis' ) ); 
				
				hex.compiletime.flow.modular.FlowCompiler2.extend( assembler, 'applicationContext',
					'bye.flow'  ).then(
					function( code ) 
					{
						code.execute();
						trace( code.locator.bye.sayBye( 'Mr Bourre' ) ); 
					}
				);
			
			}
		);
	}
}
