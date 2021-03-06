package twitter.bootstrap.scaffolding

import org.springframework.validation.Errors
import org.springframework.validation.FieldError

class FormsTagLib {

	static namespace = "bootstrap"
	
	def fieldError = { attrs ->
		def bean = attrs.bean
		def field = attrs.field
		Errors errors = bean.errors
		FieldError error = errors.getFieldError(field)
		out << g.hasErrors(bean: bean, field: field) {
			out << '<span class="help-inline">'
			out << g.message(error: error)
			out << '</span>'
		}
		
	}
	
	def jqDatePicker = {attrs, body ->
		def out = out
		def name = attrs.name    //The name attribute is required for the tag to work seamlessly with grails
		def id = attrs.id ?: name
		def minDate = attrs.minDate
		def showDay = attrs.showDay

		//Create date text field and supporting hidden text fields need by grails
		out.println "<input type=\"text\" name=\"${name}\" id=\"${id}\" />"
		out.println "<input type=\"hidden\" name=\"${name}_day\" id=\"${id}_day\" />"
		out.println "<input type=\"hidden\" name=\"${name}_month\" id=\"${id}_month\" />"
		out.println "<input type=\"hidden\" name=\"${name}_year\" id=\"${id}_year\" />"
		out.println "<input type=\"hidden\" name=\"${name}_hour\" id=\"${id}_hour\"  />"
		out.println "<input type=\"hidden\" name=\"${name}_min\" id=\"${id}_min\" />"

		//Code to parse selected date into hidden fields required by grails
		out.println "<script type=\"text/javascript\"> \$(document).ready(function(){"
		out.println "\$(\"#${name}\").datetimepicker({ampm: true,stepMinute: 15,showHour:false,showMinute:false});"
		/*
		out.println "\$(\"#${name}\").datepicker({dateFormat:'mm/dd/yy',changeYear:true,changeMonth:true,"
		out.println "onClose: function(dateText, inst) {"
		out.println "\$(\"#${name}_month\").attr(\"value\",new Date(dateText).getMonth() +1);"
		out.println "\$(\"#${name}_day\").attr(\"value\",new Date(dateText).getDate());"
		out.println "\$(\"#${name}_year\").attr(\"value\",new Date(dateText).getFullYear());"
		out.println "\$(\"#${name}_hour\").attr(\"value\",0);"
		out.println "\$(\"#${name}_min\").attr(\"value\",0);"
		out.println "}"

		//If you want to customize using the jQuery UI events add an if block an attribute as follows
		if(minDate != null){
			out.println ","
			out.println "minDate: ${minDate}"
		}

		if(showDay != null){
			out.println ","
			out.println "beforeShowDay: function(date){"
			out.println	"var day = date.getDay();"
			out.println	"return [day == ${showDay},\"\"];"
			out.println "}"
		}
		 */

		out.println "})</script>"
	}
}
