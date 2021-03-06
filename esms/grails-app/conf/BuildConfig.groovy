grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        mavenRepo "http://snapshots.repository.codehaus.org"
        mavenRepo "http://repository.codehaus.org"
        mavenRepo "http://download.java.net/maven/2/"
        mavenRepo "http://repository.jboss.com/maven2/"
		
		//
		mavenRepo "http://repo.grails.org/grails/libs-releases/"
		mavenRepo "http://m2repo.spockframework.org/ext/"
		
		mavenRepo "http://download.java.net/maven/2/"
		mavenRepo "http://repo.spring.io/milestone/"
    }
	
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.
        runtime 'mysql:mysql-connector-java:5.1.20'
		compile 'joda-time:joda-time:1.6.2'
    }

    plugins {
        runtime ":hibernate:$grailsVersion"
        runtime ":jquery:1.8.0"
        runtime ":resources:1.1.6"
		runtime ":jasper:1.6.1"

        // Uncomment these (or add new ones) to enable additional resources capabilities
        //runtime ":zipped-resources:1.0"
        //runtime ":cached-resources:1.0"
        //runtime ":yui-minify-resources:0.1.4"

        build ":tomcat:$grailsVersion"

        //runtime ":database-migration:1.1"

        compile ':cache:1.0.0'
		
		//runtime ":twitter-bootstrap:2.1.1"
		//runtime ":fields:1.3"
		runtime ":cache-headers:1.1.5"
		
		//compile ":jquery-ui:1.8.24"
		
		compile ":filterpane:2.0.1.1"
		//compile ":filterpane:2.2.5"
		
		//compile ":spring-security-core:1.2.7.3"
		compile ':spring-security-core:2.0-RC2'
		
		compile ":file-uploader:1.2.1"
		
		compile ":audit-logging:0.5.4"
		
		compile ":searchable:0.6.4"
		
		//compile ":modalbox:0.4"
		
		compile ":excel-import:1.0.0"
		
		compile ":jquery-ui:1.10.3"
		compile ":spring-security-ui:1.0-RC1"
    }
}
