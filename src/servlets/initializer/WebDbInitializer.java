/**
 * 
 */
package servlets.initializer;

import java.net.URL;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * @author huicha
 *
 */
public class WebDbInitializer implements ServletContextListener{

	private static final String WEBINIT_ETL_PATH = "webinit.etl.path";
	
	/**
     * Executes script which inits the database.
     * @param etlUrl ETL file URL.
     * @throws EtlExecutorException if script execution fails.
     */
    static void initDatabase(URL etlUrl) {
    }
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		ServletContext ctx = servletContextEvent.getServletContext();
        try {
            initDatabase(ctx.getResource("/WEB-INF/db/webinit.etl.xml"));
            ctx.log("DB script executed");
        } catch (Exception e) {
            ctx.log("Unable to execute DB script", e);
        }
	}

}
