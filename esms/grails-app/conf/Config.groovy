import grails.plugins.springsecurity.SecurityConfigType

import org.springframework.security.core.userdetails.User
import org.springframework.web.context.request.RequestContextHolder

import com.esms.model.security.SecUser

// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

grails.plugins.remotepagination.max=10
//EnableBootstrap here when using twitter bootstrap, default is set to false.
grails.plugins.remotepagination.enableBootstrap=true

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

grails.resources.modules = {
	gebo {
		resource url:'/bootstrap/css/bootstrap.min.css'
		resource url:'/bootstrap/css/bootstrap-responsive.min.css'
		resource url:'/css/dark.css'
		resource url: '/lib/colorbox/colorbox.css'
		resource url: '/lib/google-code-prettify/prettify.css'
		resource url: '/lib/sticky/sticky.css'
		resource url: '/img/splashy/splashy.css'
		resource url: '/img/flags/flags.css'
		resource url: '/lib/fullcalendar/fullcalendar_gebo.css'
		resource url: '/css/style.css'
	}
	gebo_js {
		//js
		resource url: "/lib/qtip2/jquery.qtip.min.js"
		resource url: "/lib/jBreadcrumbs/js/jquery.jBreadCrumb.1.1.min.js"
		resource url: "/lib/colorbox/jquery.colorbox.min.js"
		resource url: "/js/ios-orientationchange-fix.js"
		resource url: "/lib/antiscroll/antiscroll.js"
		resource url: "/lib/antiscroll/jquery-mousewheel.js"
		resource url: "/js/gebo_common.js"
		resource url: "/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"
		resource url: "/js/forms/jquery.ui.touch-punch.min.js"
		resource url: "/js/jquery.imagesloaded.min.js"
		resource url: "/js/jquery.wookmark.js"
		resource url: "/js/jquery.mediaTable.min.js"
		resource url: "/js/jquery.peity.min.js"
		resource url: "/lib/fullcalendar/fullcalendar.min.js"
		//resource url: "/lib/flot/jquery.flot.min.js"
		//resource url: "/lib/flot/jquery.flot.resize.min.js"
		//resource url: "/lib/flot/jquery.flot.pie.min.js"
		resource url: "/lib/list_js/list.min.js"
		resource url: "/lib/list_js/plugins/paging/list.paging.min.js"
		//resource url: "/js/gebo_dashboard.js"
	}
	core {
		resource url:'/js/jquery-1.7.1.min.js', disposition: 'head'
		resource url: '/js/jquery-ui-1.8.18.custom.min.js'
		resource url: '/js/jquery-ui-timepicker-addon.js'
		resource url: '/js/jquery.qtip.min.js'
	}
 
	fullCalendar {
		dependsOn 'core'
		resource url:'/js/fullcalendar.min.js'
		resource url:'/css/fullcalendar.css'
	}
	
	calendar {
		dependsOn 'fullCalendar'
		resource url: '/js/calendar.js'
		resource url: '/js/bootstrapx-clickover.js'
		resource url: '/css/calendar.css'
	}
  	chosen {
		resource url: '/js/chosen.jquery.min.js'
		resource url: '/css/chosen.css'
	}
}
// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'com.esms.model.security.SecUser'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'com.esms.model.security.SecUserSecRole'
grails.plugins.springsecurity.authority.className = 'com.esms.model.security.SecRole'

grails.plugins.springsecurity.securityConfigType = SecurityConfigType.InterceptUrlMap
grails.plugins.springsecurity.interceptUrlMap = [
	'/login/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/static/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/**': ['ROLE_USER','ROLE_ADMIN']
]

/**
 *  Updated the last login date.
 */

grails.plugins.springsecurity.useSecurityEventListener = true

grails.plugins.springsecurity.onInteractiveAuthenticationSuccessEvent = { e, appCtx ->
	def currentRequest = RequestContextHolder.requestAttributes
	if(currentRequest) { // we have been called from a web request processing thread
	  currentRequest.session["lastLoginDate"] = new Date()
	}
	
	/*SecUser.withTransaction {
		def user = SecUser.findById(appCtx.springSecurityService.principal.id)
		if(!user.isAttached()) {
			user.attach()
		}
		user.lastLoginDate = new Date()
		user.save(flush: true, failOnError: true)
	}*/
	 
}	


fileuploader {
	docs {
		maxSize = 1000 * 1024 * 4 //4 mbytes
		allowedExtensions = ["doc", "docx", "pdf", "rtf"]
		path = "/tmp/docs/"
	}
}


esms {
	settings {
		max = "10"
	}
}